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
import logging

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

def translate(msg):
    translations = site.translations
    lang = bf.template_context.lang
    return translations.get(msg, {}).get(lang, msg)

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

site.template_vars._ = translate

def post_build():
    log = logging.getLogger('blogofile._config')
    output_dir = bf.writer.output_dir
    for dirpath, dirnames, filenames in os.walk(output_dir):
        filename = os.path.join(dirpath, 'index.html')
        if not os.path.exists(filename):
            log.info('Creating symlink %s' % filename)
            os.symlink('index-%s.html' % site.default_lang, filename)

