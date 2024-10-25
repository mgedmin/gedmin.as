"""
A very simple static site generator, Blogofile-style

- Recursively walks through ./website/
- Ignores files starting with a _ or a .
- Renders files ending with .mako
- Copies all other files unmodified
- Puts the output in ./website/_site/
"""

import argparse
import fnmatch
import os
import pathlib
import shutil
import sys
from contextlib import contextmanager

from mako.exceptions import text_error_template
from mako.lookup import TemplateLookup
from mako.template import Template


class Bag(dict):

    def __init__(self, *args, **kw):
        super().__init__(*args, **kw)
        self.__dict__ = self


class Site(Bag):

    def __init__(self):
        self.template_vars = {}


class BlogofileCompat(Bag):
    pass


class BlogofileTemplateContext(Bag):
    pass


@contextmanager
def chdir(where):
    fd = os.open('.', os.O_RDONLY)
    try:
        os.chdir(where)
        yield
    finally:
        os.chdir(fd)
        os.close(fd)


class SiteGenerator:

    verbose = False
    quiet = False
    dry_run = False
    stop_on_first_failure = False
    source_dir = pathlib.Path('website')
    template_dir = pathlib.Path('website/_templates')
    dest_dir = pathlib.Path('website/_site')
    config_file = pathlib.Path('website/_config.py')
    allowed_hidden_files = (
        '.htaccess',
        '.well-known',
        '.nojekyll',
        '.thumb_*.jpg',
    )

    def info(self, msg):
        if not self.quiet:
            print(msg)

    def debug(self, msg):
        if self.verbose:
            print(msg)

    def generate(self):
        self.preexisting_files = list(self.dest_dir.rglob('*'))
        self.generated_files = []
        self.failed = []
        self.load_config()
        if self.pre_build_hook:
            self.run_pre_build_hook()
        self.init_mako()
        for dirpath, dirnames, filenames in self.source_dir.walk():
            dirnames[:] = self.filter_files(dirnames)
            filenames[:] = self.filter_files(filenames)
            self.mkdir(self.dest_of(dirpath))
            for filename in filenames:
                path = dirpath / filename
                if filename.endswith('.mako'):
                    self.render_mako_template(path)
                else:
                    self.copy_file(path)
        if not self.failed:
            if self.post_build_hook:
                self.run_post_build_hook()
            self.clean_old_files()

    def load_config(self):
        self.site = Site()
        self.bf = BlogofileCompat()
        globs = dict(site=self.site, bf=self.bf, Bag=Bag)
        config_file = self.config_file.resolve()
        exec(config_file.read_text(), globs)
        self.pre_build_hook = globs.get('pre_build')
        self.post_build_hook = globs.get('post_build')

    def init_mako(self):
        self.template_lookup = TemplateLookup(
            directories=[self.source_dir, self.template_dir],
            input_encoding='UTF-8',
            encoding_errors='replace',
        )
        # *sigh* so that <%inherit file="_templates/site.mako"> would find
        # things relative to the website root and not the calling template
        self.template_lookup.adjust_uri = lambda uri, relative_to: uri

    def filter_files(self, filenames):
        return sorted(
            f
            for f in filenames
            if not f.startswith(('_', '.'))
            or any(
                fnmatch.fnmatch(f, pat) for pat in self.allowed_hidden_files
            )
        )

    def uri_of(self, path):
        return str(path.relative_to(self.source_dir))

    def dest_of(self, path):
        return self.dest_dir.joinpath(path.relative_to(self.source_dir))

    def format_action(self, action, dest):
        if not self.verbose:
            dest = dest.relative_to(self.dest_dir)
        return f'{action}: {dest}'

    def mkdir(self, dest):
        self.debug(self.format_action("mkdir", dest))
        if not self.dry_run:
            dest.mkdir(parents=True, exist_ok=True)
        self.generated_files.append(dest)

    def copy_file(self, path):
        dest = self.dest_of(path)
        self.info(self.format_action("copy", dest))
        if not self.dry_run:
            if not self.up_to_date(path, dest):
                shutil.copy2(path, dest)
        self.generated_files.append(dest)

    def up_to_date(self, src, dest):
        try:
            ss = src.lstat()
            ds = dest.lstat()
        except OSError:
            return False
        return (ss.st_size, ss.st_mtime) == (ds.st_size, ds.st_mtime)

    def render_mako_template(self, path):
        dest = self.dest_of(path).with_suffix('')
        self.info(self.format_action("mako", dest))
        template = self.template_lookup.get_template(self.uri_of(path))
        self.bf.template_context = BlogofileTemplateContext()
        self.bf.template_context.template_name = str(path)
        self.bf.config = Bag(site=self.site)
        self.bf.writer = Bag(template_lookup=self.template_lookup)
        try:
            html = template.render(bf=self.bf, **self.site.template_vars)
        except Exception:
            print(text_error_template().render(), file=sys.stderr)
            self.failed.append(dest)
            if self.stop_on_first_failure:
                sys.exit(1)
            return
        if not self.dry_run:
            dest.write_text(html)
        self.generated_files.append(dest)

    def run_pre_build_hook(self):
        self.info('running pre_build() hook from _config.py')
        if not self.dry_run:
            self.pre_build_hook()

    def run_post_build_hook(self):
        generated_files = []
        self.bf.writer = Bag(
            output_dir=str(self.dest_dir),
            generated_files=generated_files,
        )
        self.info('running post_build() hook from _config.py')
        if not self.dry_run:
            self.post_build_hook()
            self.generated_files.extend(map(pathlib.Path, generated_files))

    def clean_old_files(self):
        to_clean = set(self.preexisting_files) - set(self.generated_files)
        for dest in sorted(to_clean):
            self.info(self.format_action("clean", dest))
            if not self.dry_run:
                if dest.is_dir():
                    shutil.rmtree(dest)
                else:
                    dest.unlink()


def main():
    parser = argparse.ArgumentParser(description="generate a static site")
    parser.add_argument("-v", "--verbose", action="store_true")
    parser.add_argument("-q", "--quiet", action="store_true")
    parser.add_argument("-n", "--dry-run", action="store_true")
    parser.add_argument("-x", "--stop-on-first-failure", action="store_true")
    args = parser.parse_args()
    if args.verbose and args.quiet:
        parser.error('make up your mind, do you want --verbose or --quiet?')
    generator = SiteGenerator()
    generator.verbose = args.verbose
    generator.quiet = args.quiet
    generator.dry_run = args.dry_run
    generator.stop_on_first_failure = args.stop_on_first_failure
    generator.generate()
    if generator.failed:
        sys.exit(1)
