<%inherit file="_templates/site.mako" />
<%def name="title()">Studentai pagal grupes</%def>
<%def name="short_title()"></%def>

<h2>Studentai pagal grupes</h2>

<table class="simple">
  <tr><th class="student">Studentas</th><th>1</th><th>2</th><th>3</th><th class="proj" title="Projektukas">P</th><th class="test">Testukas</th><th class="final">Įskaita</th></tr>
<tal:block tal:repeat="group here/by_group">
  <tr><td class="group" colspan="7" tal:content="string:${group/title} (${group/count_done}/${group/count})">(grupė)</td></tr>
  <tr tal:repeat="row group/students" tal:attributes="class python:['even', 'odd'][repeat['row'].even()]">
  <td tal:content="row/name" tal:attributes="title row/fullinfo;
                      class python:row['iskaita']['done'] and 'good' or 'bad'">Vardas Pavardė</td>
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
</tal:block>
</table>

<p tal:define="total here/totals">
  Studentų: <span tal:replace="total/students" /> <br />
  Visas užduotis atsiskaitė: <span tal:replace="total/done_all" /> <br />
  Viską atsiskaitė (užduotis ir testuką): <span tal:replace="total/passed" />
</p>
