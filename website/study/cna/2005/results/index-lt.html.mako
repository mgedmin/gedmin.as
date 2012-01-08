<%inherit file="_templates/site.mako" />
<%def name="title()">Rezultatai</%def>
<%def name="short_title()">rezultatai</%def>

<!-- Page Template Diagnostics
 Macro expansion failed
 <class 'AccessControl.unauthorized.Unauthorized'>: You are not allowed to access 'macros' in this context
-->
<h2>Kompiuterių tinklai - Rezultatai</h2>

<p>Kiekvienos užduoties įvertis yra suskirstytas į sudėtines dalis.  Pirmasis
skaičius visada yra bazinis balas (1.5 už C-C arba Java-Java; 1.0 už C-Java),
antrasis skaičius visada yra minusas už pavėlavimą arba pliusas už atsiskaitymą
anksčiau.</p>

<tal:macros condition="nothing">
<metal:block define-macro="grupe">
<h3 style="clear:both" tal:attributes="id string:gr$gr"><metal:block define-slot="title"><span tal:replace="gr">4</span> grupė</metal:block></h3>

<metal:block define-slot="extrainfo">
</metal:block>

<div style="float: left; padding-bottom: 1em">
<table class="simple">
  <tr><th>Nr</th><th>Studentas</th><th>Užduotis</th><th colspan="2">1</th><th colspan="2">2</th><th colspan="2">3</th><th>Iš viso</th></tr>
<tal:loop tal:repeat="row python:here.list(gr=gr)">
<tr tal:attributes="class python:['even', 'odd'][repeat['row'].even()]">
  <td class="right" tal:content="repeat/row/number">nr.</td>
  <td style="width: 10em;" tal:content="row/name">Vardas Pavardė</td>
  <td style="width: 9em;" class="right" tal:attributes="title row/taskhint" tal:content="row/task" tal:condition="row/task">užduotis</td>
  <td style="width: 9em" class="right" tal:condition="not:row/task">nepasirinkta</td>
  <tal:loop repeat="uzd row/uzd">
  <td style="color:green" class="center" tal:content="uzd/date" tal:condition="uzd/plus">.</td>
  <td style="text-align:left" class="center" tal:content="uzd/score" tal:condition="uzd/plus">.</td>
  <td style="color:gray" class="center" tal:condition="not:uzd/plus">&#183;</td>
  <td style="color:gray" class="center" tal:condition="not:uzd/plus">&#183;</td>
  </tal:loop>
  <td class="right" tal:content="row/total">x.y</td>
</tr>
<tr tal:attributes="class python:['even', 'odd'][repeat['row'].even()]">
  <td style="color:gray; font-size: small" class="right" colspan="3" tal:content="row/taskhint"></td>
  <tal:loop repeat="uzd row/uzd">
  <td style="color:gray; font-size: small" colspan="2"
      tal:define="uncertainity uzd/uncertainity;
                  color python: uncertainity and 'red' or 'gray'"
      tal:attributes="style string:color: $color;; font-size:small"
      tal:content="uzd/comments"></td>
  </tal:loop>
  <td></td>
</tr>
</tal:loop>
</table>
</div>
</metal:block>
</tal:macros>

<tal:defs define="gr string:3">
<metal:block use-macro="template/macros/grupe">
</metal:block>
</tal:defs>

<tal:defs define="gr string:4">
<metal:block use-macro="template/macros/grupe">
</metal:block>
</tal:defs>

<tal:defs define="gr string:5">
<metal:block use-macro="template/macros/grupe">
</metal:block>
</tal:defs>

<tal:defs define="gr string:N">
<metal:block use-macro="template/macros/grupe">
<metal:block fill-slot="title">Kiti</metal:block>
</metal:block>
</tal:defs>
