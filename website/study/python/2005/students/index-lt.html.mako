<%inherit file="_templates/site.mako" />
<%def name="title()">Atsiskaitymai</%def>
<%def name="short_title()">atsiskaitymai</%def>

<h2>Atsiskaitymai</h2>

<p>Paskutinis atnaujinimas: 2005-01-23.</p>

<p>Visiems, kurie turi pliusiuką įskaitos stulpelyje, žiniaraščiuose
pasirašiau.</p>

<div style="float: right; margin: 0 em; 2em;">
  <h4>Paaiškinimas</h4>
<table>
  <tr><td class="center"><span style="color:green">+</span></td><td>atsiskaitė</td></tr>
  <tr><td class="center"><span style="color:gray">-</span></td><td>pasirinko sąlygą, bet dar neatsiskaitė</td></tr>
  <tr><td class="center"><span style="color:red">&#183;</span></td><td>dar nepasirinko sąlygos.</td></tr>
</table>
</div>

<table class="simple">
  <tr><th class="student">Studentas</th><th>1</th><th>2</th><th>3</th><th class="proj" title="Projektukas">P</th><th class="test">Testukas</th><th class="final">Įskaita</th></tr>
<tr tal:repeat="row here/list" tal:attributes="class python:['even', 'odd'][repeat['row'].even()]">
  <td tal:content="row/name">Vardas Pavardė</td>
  <tal:loop repeat="uzd python:[row[taskid] for taskid in ['1', '2', '3', 'projektukas', 'testukas', 'iskaita']]">
  <td style="color:green" class="center" tal:condition="uzd/done" tal:attributes="title uzd/description">+</td>
  <tal:if_not_done condition="not:uzd/done">
  <td style="color:gray" class="center" tal:condition="uzd/chosen" tal:attributes="title uzd/description">-</td>
  <tal:if_not_chosen condition="not:uzd/chosen">
  <td style="color:red" class="center" tal:condition="uzd/should_choose">&#183;</td>
  <td style="color:red" class="center" tal:condition="not:uzd/should_choose"></td>
  </tal:if_not_chosen>
  </tal:if_not_done>
  </tal:loop>
</tr>
</table>

<p tal:define="total here/totals">
  Studentų: <span tal:replace="total/students" /> <br />
  Viską atsiskaitė: <span tal:replace="total/passed" />
</p>
