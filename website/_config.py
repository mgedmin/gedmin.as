# -*- coding: utf-8 -*-

######################################################################
# This is your site's Blogofile configuration file.
# www.Blogofile.com
#
# This file doesn't list every possible setting, it relies on defaults
# set in the core blogofile _config.py. To see where the default
# configuration is on your system run 'blogofile info'
#
######################################################################

import os
import csv
import time
import logging

from mako.template import Template
from blogofile.cache import Cache


log = logging.getLogger('blogofile.config')


def expose(name=None):
    """Expose a function to Mako templates."""
    def wrapper(fn):
        site.template_vars[name or fn.__name__] = fn
        return fn
    return wrapper


######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
##site.url = "http://gedmin.as"
site.url = "http://localhost:8080"


#
# Homebrew multilingual solution
#

site.default_lang = 'en'

site.languages = [
    ('lt', 'Lithuanian'),
    ('en', 'English'),
]

site.translations = {
    'Last updated:':
        dict(lt='Paskutiniai pakeitimai:'),
    'Site Map':
        dict(lt='Turinys'),
}


@expose('_')
def translate(msg):
    translations = site.translations
    lang = bf.template_context.lang
    return translations.get(msg, {}).get(lang, msg)


@expose()
def get_cur_lang():
    if 'lang' in bf.template_context:
        return bf.template_context.lang
    for code, title in site.languages:
        suffix = '-%s.html.mako' % code
        if bf.template_context.template_name.endswith(suffix):
            break
    else:
        code = site.default_lang
    bf.template_context.lang = code
    return code


@expose()
def get_body(lang):
    cur_template = bf.template_context.template_name
    new_template = os.path.join(os.path.dirname(cur_template),
                                'index-%s.html.mako' % lang)
    template = get_template(new_template)
    return template.get_def('body').render(bf=bf,
                    **bf.config.site.template_vars).decode('UTF-8')


def post_build():
    output_dir = bf.writer.output_dir
    for dirpath, dirnames, filenames in os.walk(output_dir):
        filename = os.path.join(dirpath, 'index.html')
        if not os.path.exists(filename):
            log.info('Creating symlink %s' % filename)
            os.symlink('index-%s.html' % site.default_lang, filename)
    check_site_map_completeness()


#
# Homebrew navigation solution
#

site.map = '''
    /
        about/
        study/
          * python/
                slides/
                2004/
                2005/
          * icpc/
                submit/
              * 2003a/
              * 2003b/
              * 2004a/
              * 2004b/
          * cna/
          * inf/
          * inf98/
                ate/
                disma/
                disma2/
                mpm/
                nn/
                odb/
                ood/
                physics/
                pkpm/
                itvv/
        denmark/

        palm/

        mutt/
        icewm/
        debs/
        links/
        debian/

        lit-con/
        docs/
        ltz/
        kernel/
        tlint/
        ltt/
        fonts/
        misc/

        medit/
        lit/
        keyutils/
        demo/
        pascal/
        disasm/

        calc/

        news/

        sitemap/
'''
site.excluded_from_site_map = [
    # incomplete pages not exposed to the public; don't warn
    'av',
    'books',
    'tmp',
]



def get_trail_templates(filename, lang):
    filename = os.path.abspath(filename)
    result = [filename]
    path = os.path.dirname(filename)
    while True:
        path = os.path.dirname(path)
        filename = os.path.join(path, 'index-%s.html.mako' % lang)
        if not os.path.exists(filename):
            break
        result.append(filename)
    result.reverse()
    return result


def get_template(filename):
    with open(filename) as f:
        return Template(f.read().decode("utf-8"),
                        output_encoding="utf-8",
                        lookup=bf.writer.template_lookup)


def get_template_info(filename):
    cache = bf.setdefault('my_template_info_cache', {})
    if filename not in cache:
        template = get_template(filename)
        title = template.get_def('title').render().decode('UTF-8')
        short_title = template.get_def('short_title').render().decode('UTF-8')
        cache[filename] = (title, short_title)
    return cache[filename]


def get_trail_for(filename, lang):
    templates = get_trail_templates(filename, lang)
    root = os.path.dirname(templates[0])
    result = []
    for filename in templates:
        subpath = os.path.dirname(filename)[len(root):]
        title, short_title = get_template_info(filename)
        result.append((subpath, short_title, title))
    return result


@expose()
def get_trail():
    return get_trail_for(bf.template_context.template_name, get_cur_lang())


class SiteMapNode(object):

    def __init__(self, indent, name, marked=False):
        self.indent = indent
        self.name = name
        self.children = []
        self.parent = None
        self.marked = marked

    def getPath(self, *extra_bits):
        bits = []
        node = self
        while node is not None:
            bits.append(node.name.strip('/'))
            node = node.parent
        bits.reverse()
        bits.extend(extra_bits)
        return bf.util.path_join(bits)

    def getURL(self, lang):
        return self.getPath('index-%s.html' % lang)

    def getFilename(self, lang):
        return self.getPath('index-%s.html.mako' % lang)

    def getTitle(self, lang):
        filename = self.getFilename(lang)
        try:
            title, short_title = get_template_info(filename)
        except IOError:
            log.error('%s does not exist' % filename)
            return '(missing template %s)' % filename
        return title

    def getShortTitle(self, lang):
        filename = self.getFilename(lang)
        try:
            title, short_title = get_template_info(filename)
        except IOError:
            log.error('%s does not exist' % filename)
            return '(missing template %s)' % filename
        return short_title

    @property
    def subpath(self):
        return '/' + self.getPath()

    @property
    def url(self):
        return self.getURL(get_cur_lang())

    @property
    def filename(self):
        return self.getFilename(get_cur_lang())

    @property
    def title(self):
        return self.getTitle(get_cur_lang())

    @property
    def short_title(self):
        return self.getShortTitle(get_cur_lang())

    def traverse(self):
        yield self
        for child in self.children:
            if child is not None:
                for node in child.traverse():
                    yield node

    def find(self, path):
        if path.startswith('./'):
            path = path[2:]
        if '/' not in path:
            return self
        head, tail = path.split('/', 1)
        for child in self.children:
            if child and child.name.strip('/') == head:
                return child.find(tail)


def parse_site_map(site_map):
    root = cur = None
    for line in site_map.splitlines():
        name = line.strip('* ')
        if not name:
            if (cur and cur.parent and cur.parent.children
                and cur.parent.children[-1] is not None):
                cur.parent.children.append(None)
            continue
        indent = len(line) - len(line.lstrip('* ')) # haack
        node = SiteMapNode(indent, name, marked=('*' in line))
        if cur is None:
            root = cur = node
        else:
            while indent <= cur.indent:
                cur = cur.parent
            node.parent = cur
            cur.children.append(node)
        cur = node
    return root


@expose()
def get_site_map_root():
    if 'site_map_root' not in bf.template_context:
        bf.template_context.site_map_root = parse_site_map(site.map)
    return bf.template_context.site_map_root


def check_site_map_completeness():
    root = get_site_map_root()
    languages = [code for code, title in site.languages]
    in_site_map = set(n.getFilename(lang)
                        for n in root.traverse()
                        for lang in languages)
    existing = set()
    for dirpath, dirnames, filenames in os.walk('.'):
        for lang in languages:
            filename = 'index-%s.html.mako' % lang
            if filename in filenames and dirpath[2:] not in site.excluded_from_site_map:
                existing.add(os.path.join(dirpath, filename)[2:])
    not_in_site_map = existing - in_site_map
    for name in sorted(not_in_site_map):
        log.warning("Site-map doesn't include %s" % name)
    missing = in_site_map - existing
    for name in sorted(missing):
        log.warning("Site-map refers to a non-existing %s" % name)


@expose()
def get_subpages():
    root = get_site_map_root()
    node = root.find(bf.template_context.template_name)
    if not node:
        return []
    result = []
    for child in node.children:
        if child and child.marked:
            subpath = child.subpath
            short_title = child.short_title
            title = child.title
            result.append((subpath, short_title, title))
    return result


#
# Automatic modification time
#

@expose()
def get_mtime_str():
    filename = bf.template_context.template_name
    try:
        mtime = os.stat(filename).st_mtime
    except OSError:
        mtime = time.time()
    return time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(mtime))


#
# Ad-hoc CSV parsing
#


@expose()
def cna_parse_students(gr, pogr=None):
    cur_template = bf.template_context.template_name
    csv_file = os.path.join(os.path.dirname(cur_template),
                            'data%sgr.csv' % gr)
    result = []
    for cells in csv.reader(open(csv_file)):
        # 0: eil nr, 1: stud paz, 2: vardas, 3: username, 4: uzduotis, 5: pogrupis, 6: 1uzd, 7: data, 8: pastabos, 9: 2uzd, 10:, 11:, 12: 3uzd, ...
        cells = [s.strip() for s in cells]
        while len(cells) <= 12:
            cells.append('')
        if pogr and str(pogr) != cells[5]:
            continue
        uzd1 = cells[6] and '+' or ''
        uzd2 = cells[9] and '+' or ''
        uzd3 = cells[12] and '+' or ''
        result.append(Cache(
            name=cells[2].strip().decode('UTF-8'),
            task=cells[4].strip().decode('UTF-8'),
            uzd=[uzd1, uzd2, uzd3],
        ))
    return result


@expose()
def cna_tasks(gr=None, pogr=None):
    taken = {}
    exacttaken = {}
    if gr:
        for row in cna_parse_students(gr=gr, pogr=pogr):
            task = row['task']
            exacttaken[task] = exacttaken.get(task, 0) + 1
            if task: task = task.split()[0]
            taken[task] = taken.get(task, 0) + 1

    cur_template = bf.template_context.template_name
    task_file = os.path.join(os.path.dirname(cur_template), 'taskdata')
    data = open(task_file).read()

    rows = data.strip().splitlines()[1:]
    result = []
    for row in rows:
        cells = row.split(None, 1)
        task = cells[0]
        title = cells[1]
        shorttitle = title
        if len(shorttitle) > 30:
            shorttitle = ' '.join(title.split()[:5]) + "..."
        en = exacttaken.get(task, 0)
        n = taken.get(task, 0)
        if en > 1: cls = 'conflict'
        elif n: cls = 'taken'
        else: cls = ''
        result.append(Cache(
            task=task.decode('UTF-8'),
            title=title.decode('UTF-8'),
            shorttitle=shorttitle.decode('UTF-8'),
            class_=cls,
        ))
    return result
