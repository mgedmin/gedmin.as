<%inherit file="base.mako" />\
<% lang = get_cur_lang() %>\
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
                      "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>${self.title()}</title>
  <link rev="made" href="mailto:marius@gedmin.as" />
  <link rel="stylesheet" type="text/css" href="${self.stylesheet()}" />
  <meta name="Author" content="Marius Gedminas" />
  ${self.extra_head()}
</head>
<body>

<div class="toolbox langbox">
<div class="title">Language</div>
% for n, (code, title) in enumerate(bf.config.site.languages):
%     if n:
  <span class="sep">::</span>
%     endif
  <a href="index-${code}.html"
     title="${title}"><img src="${bf.config.site.url}/${code}.png" alt="${code.title()}" title="${title}" height="16" width="26" /></a>
% endfor
</div>

<div class="title">
<h1 class="title">${self.title()}</h1>
</div>

<div class="navbar">
<span class="right">
<a href="${bf.config.site.url}/sitemap/index-${lang}.html">${_('Site Map')}</a>
<span class="hide">|</span>
</span>
<%
    trail = get_trail()
    subpages = get_subpages()
%>
% for n, (path, short_title, title) in enumerate(trail):
%     if n:
  &gt;
%     endif
%     if n == len(trail) - 1:
  <strong>${short_title}</strong>
%     else:
  <a href="${bf.config.site.url}${path}/index-${lang}.html"
     title="${title}">${short_title}</a>
%     endif
% endfor
% for n, (path, short_title, title) in enumerate(subpages):
%     if n:
  ::
%     else:
  <span class="sep"> | </span>
%     endif
  <a href="${bf.config.site.url}${path}/index-${lang}.html"
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
<a href="https://validator.w3.org/check/referer"><img
        src="${bf.config.site.url}/valid-xhtml11.png"
        alt="Valid XHTML 1.1!" height="31" width="88" /></a>
<a href="https://jigsaw.w3.org/css-validator/"><img
        src="${bf.config.site.url}/valid-css.png"
        alt="Valid CSS!" height="31" width="88" /></a>
</span>
<span class="lastupdated">
${_('Last updated:')} ${get_mtime_str()}
</span>

</body>
</html>
<%def name="title()"></%def>
<%def name="subtitle()"></%def>
<%def name="stylesheet()">${bf.config.site.url}/style.css</%def>
<%def name="extra_head()"></%def>
