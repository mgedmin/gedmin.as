<%inherit file="_templates/site.mako" />
<%def name="title()">About me</%def>
<%def name="short_title()">About</%def>
<% base_url = bf.config.site.url %>

<p><strong>Name:</strong> Marius Gedminas
<br /><strong>Date of birth:</strong> 29 Jan 1980
<br /><strong>Nationality:</strong> Lithuanian
<br /><strong>Occupation:</strong> Programmer (<a href="http://www.pov.lt/">PoV</a>).
<br /><strong>PGP:</strong> <a href="${base_url}/mg-pgp-key.txt">public PGP key (ID: E7A6D78F)</a>
<br /><strong>Phone:</strong> +370 685 04774
<br /><strong>E-mail:</strong> marius@gedmin.as
<br /><strong>WWW:</strong>
<a href="http://gedmin.as/">http://gedmin.as/</a> (used to be <a style="text-decoration: line-through" href="http://mg.b4net.lt/">http://mg.b4net.lt/</a>),
<a href="http://mg.pov.lt/">http://mg.pov.lt/</a> (various projects, and also <a href="http://mg.pov.lt/blog">my blog</a>)
<br /><strong>Picture:</strong>
<br /><img src="${base_url}/about/mugshot2.jpg" alt="A picture of me" class="good" />
</p>
