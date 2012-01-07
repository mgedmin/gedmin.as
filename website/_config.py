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
import time
import logging

from mako.template import Template


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


def post_build():
    log = logging.getLogger('blogofile._config')
    output_dir = bf.writer.output_dir
    for dirpath, dirnames, filenames in os.walk(output_dir):
        filename = os.path.join(dirpath, 'index.html')
        if not os.path.exists(filename):
            log.info('Creating symlink %s' % filename)
            os.symlink('index-%s.html' % site.default_lang, filename)


#
# Homebrew navigation solution
#

site.map = '''
    /
        about/
        study/
            python/
                2004/
            icpc/
                submit/
                2003a/
                2003b/
                2004a/
                2004b/
            inf98/
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
            cna/
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
