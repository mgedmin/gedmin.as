<%inherit file="_templates/sitemap.mako" />
<%def name="title()">Site Map</%def>
<%def name="short_title()">Site Map</%def>

<h2>Site Map</h2>

<div class="sitemap">
${self.site_map()}
</div>
