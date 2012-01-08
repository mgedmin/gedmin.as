<%inherit file="site.mako" />\
${next.body()}

<%def name="site_map()">
<ul>
  ${self.node(get_site_map_root())}
</ul>
</%def>

<%def name="node(node)">
% if node:
<li>
  <a class="good" href="${node.url}">${node.title}</a>
%     if node.children:
  <ul>
%         for child in node.children:
    ${self.node(child)}
%         endfor
  </ul>
%     endif
</li>
% else:
</ul>
<p></p>
<ul>
% endif
</%def>
