<%inherit file="_templates/site.mako" />
<%def name="stylesheet()">${bf.config.site.url}/study/python/style.css</%def>
<%def name="title()">Studentai pagal grupes</%def>
<%def name="short_title()"></%def>

<h2>Studentai pagal grupes</h2>

<table class="simple">
  <tr><th class="student">Studentas</th><th>1</th><th>2</th><th>3</th><th class="proj" title="Projektukas">P</th><th class="test">Testukas</th><th class="final">Įskaita</th></tr>
% for group in py_students_by_group():
  <tr><td class="group" colspan="7">${group.title} (${group.count_done}/${group.count})</td></tr>
%     for n, row in enumerate(group.students):
  <tr class="${['odd', 'even'][n % 2]}">
  <td title="${row.fullinfo}"
      class="${row.iskaita.done and 'good' or 'bad'}">${row.name}</td>
%         for uzd in row.uzd:
%             if uzd.done:
  <td style="color:green" class="center" title="uzd/description">+</td>
%             elif uzd.chosen:
  <td style="color:gray" class="center" title="uzd/description">-</td>
%             elif uzd.should_choose:
  <td style="color:red" class="center">&#183;</td>
%             else:
  <td style="color:red" class="center"></td>
%             endif
%         endfor
  </tr>
%     endfor
% endfor
</table>

<% total = py_student_totals('../tasks.txt') %>
<p>
  Studentų: ${total.students} <br />
  Visas užduotis atsiskaitė: ${total.done_all} <br />
  Viską atsiskaitė (užduotis ir testuką): ${total.passed}
</p>
