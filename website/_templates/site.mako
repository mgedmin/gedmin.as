<%inherit file="base.mako" />\
<% base_url = bf.config.site.url %>\
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
                      "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${self.title()}</title>
  <link rev="made" href="mailto:marius@gedmin.as" />
  <link rel="stylesheet" type="text/css" href="${base_url}/style.css" />
  <meta name="Author" content="Marius Gedminas" />
  <link rel="openid.server" href="http://www.myopenid.com/server" />
  <link rel="openid.delegate" href="http://mgedmin.myopenid.com/" />
  <link rel="openid2.provider" href="http://www.myopenid.com/server" />
  <link rel="openid2.local_id" href="http://mgedmin.myopenid.com/" />
  <meta http-equiv="X-XRDS-Location"
        content="http://www.myopenid.com/xrds?username=mgedmin.myopenid.com" />
</head>
<body>

<div class="toolbox langbox">
<div class="title">Language</div>
<%
    if 'index-lt' in bf.template_context.template_name:
        lang = 'lt'
    else:
        lang = 'en'
    languages = [
        ('lt', 'Lithuanian'),
        ('en', 'English'),
    ]
    translations = {
        'Last updated:': {'lt': 'Paskutiniai pakeitimai:'},
        'Site Map': {'lt': 'Turinys'},
    }
    def _(msg):
        return translations.get(msg, {}).get(lang, msg)
%>
% for n, (code, title) in enumerate(languages):
%     if n:
  <span class="sep">::</span>
%     endif
  <a href="index-${code}.html"
     title="${title}"><img src="${base_url}/${code}.png" alt="${code.title()}" title="${title}" height="16" width="26" /></a>
% endfor
</div>

<div class="title">
<h1 class="title">${self.title()}</h1>
</div>

<div class="navbar">
<span class="right">
<a href="${base_url}/sitemap/index-${lang}.html">${_('Site Map')}</a>
<span class="hide">|</span>
</span>
<%!
from mako.template import Template
import blogofile_bf as bf

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
        title = template.get_def('title').render()
        short_title = template.get_def('short_title').render()
        cache[filename] = (title, short_title)
    return cache[filename]


def get_trail(filename, lang):
    templates = get_trail_templates(filename, lang)
    root = os.path.dirname(templates[0])
    result = []
    for filename in templates:
        subpath = os.path.dirname(filename)[len(root):]
        title, short_title = get_template_info(filename)
        result.append((subpath, short_title, title))
    return result
%>
<%
    trail = get_trail(bf.template_context.template_name, lang)
    subfolders = [
##      ('/study/python', 'Python', 'Python programming language'),
##      ('/study/icpc', 'ICPC', 'ACM ICPC'),
    ]
%>
% for n, (path, short_title, title) in enumerate(trail):
%     if n:
  &gt;
%     endif
%     if n == len(trail) - 1:
  <strong>${short_title}</strong>
%     else:
  <a href="${base_url}${path}/index-${lang}.html"
     title="${title}">${short_title}</a>
%     endif
% endfor
% for n, (path, short_title, title) in enumerate(subfolders):
%     if n:
  ::
%     else:
  <span class="sep"> | </span>
%     endif
  <a href="${base_url}${path}/index-${lang}.html"
     title="${title}">${short_title}</a>
% endfor
</div>

<div class="content">
${next.body()}
</div>

<p />

<div class="bottombar">
<hr class="hide" />
<span class="valid">
<a href="http://validator.w3.org/check/referer"><img
        src="${base_url}/valid-xhtml11.png"
        alt="Valid XHTML 1.1!" height="31" width="88" /></a>
<a href="http://jigsaw.w3.org/css-validator/"><img
        src="${base_url}/valid-css.png"
        src="http://jigsaw.w3.org/css-validator/images/vcss" 
        alt="Valid CSS!" height="31" width="88" /></a>
</span>
<span class="lastupdated">
<%! import time, os %>
<%
    filename = bf.template_context.template_name
    try:
        mtime = os.stat(filename).st_mtime
    except OSError:
        mtime = time.time()
    last_updated = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(mtime))
%>
${_('Last updated:')} ${last_updated}
</span>

</body>
</html>
<%def name="title()"></%def>
