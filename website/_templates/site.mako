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
def _(s):
    return translations.get(msg, {}).get(lang, s)
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
##<tal:block tal:repeat="folder here/breadcrumbTrail">
##  <span tal:omit-tag=""
##        tal:condition="python: repeat['folder'].number() > 1"> &gt; </span>
##  <strong tal:omit-tag="python: folder != here">
##    <a tal:attributes="href python: '%s/index-%s.html' %
##                                    (folder.absolute_url(), lang);
##                       title folder/getTitle"
##       tal:omit-tag="python: folder == here"
##       tal:content="folder/getShortTitle">[Parent]</a></strong>
##</tal:block>
##<tal:block tal:repeat="subfolder here/listSubfolders"
##  ><span class="sep"
##         tal:condition="python: repeat['subfolder'].number() == 1"> | </span>
##   <span tal:omit-tag=""
##         tal:condition="python: repeat['subfolder'].number() > 1"> :: </span>
##   <a tal:attributes="href python: '%s/index-%s.html' %
##                                   (subfolder.absolute_url(), lang);
##                      title subfolder/getTitle"
##         tal:content="subfolder/getShortTitle">[Subdir]</a>
##</tal:block>
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
<%! import datetime %>
${_('Last updated:')} ${datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
</span>

</body>
</html>
<%def name="title()"></%def>
