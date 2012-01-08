<%inherit file="_templates/site.mako" />
<%def name="title()">Rezultatai</%def>
<%def name="short_title()">rezultatai</%def>

<h2>Kompiuterių tinklai - Rezultatai</h2>

<p>Kiekvienos užduoties įvertis yra suskirstytas į sudėtines dalis.  Pirmasis
skaičius visada yra bazinis balas (1.5 už C-C arba Java-Java; 1.0 už C-Java),
antrasis skaičius visada yra minusas už pavėlavimą arba pliusas už atsiskaitymą
anksčiau.</p>

<%def name="grupe(gr, title=None)">
<%
    if not title:
        title = u'%s grupė' % gr
    deadlines = ['2005-04-08', '2005-04-30', '2005-05-20']
    data = cna_results(gr, deadlines=deadlines)
%>
<h3 style="clear:both" id="gr${gr}">${title}</h3>

<div style="float: left; padding-bottom: 1em">
<table class="simple">
  <tr><th>Nr</th><th>Studentas</th><th>Užduotis</th><th colspan="2">1</th><th colspan="2">2</th><th colspan="2">3</th><th>Iš viso</th></tr>
% for n, row in enumerate(data):
<tr class="${['odd', 'even'][n % 2]}">
  <td class="right">${n + 1}</td>
  <td style="width: 10em">${row.name}</td>
%     if row.task and row.taskhint:
  <td style="width: 9em" class="right" title="${row.taskhint}">${row.task}</td>
%     elif row.task:
  <td style="width: 9em" class="right">${row.task}</td>
%     else:
  <td style="width: 9em" class="right">nepasirinkta</td>
%     endif
%     for uzd in row.uzd:
%         if uzd.plus:
  <td style="color:green" class="center">${uzd.date}</td>
  <td style="text-align:left" class="center">${uzd.score}</td>
%         else:
  <td style="color:gray" class="center">&#183;</td>
  <td style="color:gray" class="center">&#183;</td>
%         endif
%     endfor
  <td class="right">${row.total}</td>
</tr>
<tr class="${['odd', 'even'][n % 2]}">
  <td style="color:gray; font-size: small" class="right" colspan="3">${row.taskhint}</td>
%     for uzd in row.uzd:
  <td colspan="2"
      style="color: ${uzd.uncertainity and 'red' or 'gray'}; font-size: small">
      ${uzd.comments}
  </td>
%     endfor
  <td></td>
</tr>
% endfor
</table>
</div>
</%def>

${grupe('3')}
${grupe('4')}
${grupe('5')}
${grupe('N', title='Kiti')}
