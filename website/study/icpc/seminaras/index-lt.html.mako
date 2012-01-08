<%inherit file="_templates/site.mako" />
<%def name="title()">Testavimo sistema nepasiekiama</%def>
<%def name="short_title()">testavimo sistema</%def>

<h2>Testavimo sistema persikėlė</h2>

<p>Testavimo sistema dabar perkelta į VU MIF serverį:
<a href="http://mif.vu.lt/icpc/">http://mif.vu.lt/icpc/</a>.
</p>

<tal:nop define="redirect nocall:request/response/redirect;
                 dummy python:redirect('http://mif.vu.lt/icpc/')" />
