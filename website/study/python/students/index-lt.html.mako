<%inherit file="_templates/site.mako" />
<%def name="title()">Atsiskaitymai</%def>
<%def name="short_title()">atsiskaitymai</%def>

<a style="float: right; padding: 1em 2em; text-decoration: none" href="https://gedmin.as/study/python/students/enter_result">&nbsp;</a>

<h2>Atsiskaitymai</h2>

##<p>Paskutinis atnaujinimas: ${get_mtime_str('%Y-%m-%d', 'tasks.txt')}.</p>
<p>Paskutinis atnaujinimas: 2007-03-02.</p>

% if False:
<p>Visiems, kurie turi pliusiuką įskaitos stulpelyje, žiniaraščiuose
pasirašiau.</p>
% endif

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
% for n, row in enumerate(py_students()):
<tr class="${['odd', 'even'][n % 2]}">
  <td title="${row.fullinfo}">${row.name}</td>
%     for uzd in row.uzd:
%         if uzd.done:
  <td style="color:green" class="center" title="uzd/description">+</td>
%         elif uzd.chosen:
  <td style="color:gray" class="center" title="uzd/description">-</td>
%         elif uzd.should_choose:
  <td style="color:red" class="center">&#183;</td>
%         else:
  <td style="color:red" class="center"></td>
%         endif
%     endfor
</tr>
% endfor
</table>

<% total = py_student_totals() %>
<p>
  Studentų: ${total.students} <br />
  Visas užduotis atsiskaitė: ${total.done_all} <br />
  Viską atsiskaitė (užduotis ir testuką): ${total.passed}
</p>

<h2 id="taken">Pasirinktos sąlygos</h2>

<h3 id="taken1">1 užduotis</h3>
<ul>
% for task in py_taken('1'):
  <li title="${task.student}">${task.task}</li>
% endfor
</ul>

<h3 id="taken2">2 užduotis</h3>
<ul>
% for task in py_taken('2'):
  <li title="${task.student}">${task.task}</li>
% endfor
</ul>

<h3 id="taken3">3 užduotis</h3>
<ul>
% for task in py_taken('3'):
  <li title="${task.student}">${task.task}</li>
% endfor
</ul>

<h3 id="takenP">Projektukas</h3>
<ul>
% for task in py_taken('projektukas'):
  <li title="${task.student}">${task.task}</li>
% endfor
</ul>
