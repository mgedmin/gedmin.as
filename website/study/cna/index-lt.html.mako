<%inherit file="_templates/site.mako" />
<%def name="title()">Kompiuterių tinklai</%def>
<%def name="short_title()">Tinklai</%def>

<h2>Kompiuterių tinklai</h2>

<div style="float:right; padding-left: 3em; padding-bottom: 1em; font-size: small; text-align: center; color: #888">
  <img src="${bf.config.site.url}/about/mugshot2.jpg" alt="Mano nuotrauka" />
  <br/>Taip atrodo dėstytojas
  <br/><span style="font-size: xx-small">(tik kostiumo nesitikėkite)</span>
</div>

<p>2006 m. pavasario semestrą aš vedžiau <a
  href="http://www.mif.vu.lt/~adam/courses/cna/index.html">kompiuterių
  tinklų kurso</a> pratybas.</p>

<p>Pratybų metu reikėjo pasirinkti užduotį ir atsiskaityti tris variantus:</p>
<ol>
  <li>Dvi programos (klientas ir serveris) C arba C++ kalba (naudojant BSD socket API)</li>
  <li>Dvi programos (klientas ir serveris) Java kalba</li>
  <li>Viena programa C/C++, kita Java kalba.</li>
</ol>

<p>Būtinai perskaitykite <a
  href="http://www.mif.vu.lt/~adam/courses/cna/ND2006.html">reikalavimus</a>.
Ten taip pat nurodytos ir <strong>atsiskaitymų datos</strong> bei vertinimo
sistema.</p>

<p>Užduotis pasirinkti galite ir <a href="mailto:marius@gedmin.as">paštu</a>.
Užduotys negali kartotis grupėje.  Užduotį galima (o kai kuriems teks)
susigalvoti ir savo.</p>

<p>Pridėjau puslapėlį su <a href="advice/index-lt.html">praktiniais patarimais.</p>

<p>Nuorodos apie soketų programavimą:</p>

<ul>
  <li><a href="http://www.mif.vu.lt/~adam/courses/cna/index.html">Kurso puslapyje</a> yra kelios nuorodos į tutorialus</li>
  <li><a href="http://beej.us/guide/bgnet/">Beej's Guide to Network Programming</a></li>
  <li><a href="http://www.mif.vu.lt/~alga/unix/">Unix programavimo kurso konspektas (trumpai apie socketus, procesus, gijas)</li>
</ul>

<ul>
  <li><a href="http://isds.bus.lsu.edu/cvoc/reposit/bpr/eventtrace/bc.html">Event Trace diagramų paaiškinimas</a></li>
</ul>

<%def name="grupe(gr, title=None)">
<%
    if not title:
        title = u'%s grupė' % gr
    data = cna_parse_students(gr)
    tasks = cna_tasks(gr)
%>
<h3 style="clear:both" id="gr${gr}">${title}</h3>

<p>
${caller.body()}
</p>

<div style="float: left; padding-bottom: 1em">
<h4>Studentai</h4>
<table class="simple">
<tr><th>Nr</th><th>Studentas</th><th>Užduotis</th><th>1</th><th>2</th><th>3</th></tr>
% for n, row in enumerate(data):
<tr class="${['odd', 'even'][n % 2]}">
  <td class="right">${n + 1}</td>
  <td style="width: 10em">${row.name}</td>
%     if row.task:
  <td style="width: 9em" class="right">${row.task}</td>
%     else:
  <td style="width: 9em; color: red" class="right">nepasirinkta</td>
%     endif
%     for uzd in row.uzd:
%         if uzd:
  <td style="color:green" class="center">${uzd}</td>
%         else:
  <td style="color:gray" class="center">&#183;</td>
%         endif
%     endfor
</tr>
% endfor
</table>
<p>
<a href="results/index-lt.html#gr${gr}">Detalūs rezultatai</a>
</p>
</div>

<div style="float: left; padding-left: 5em; width: 40%">
<h4>Užduotys</h4>

<table class="simple">
<tr><th>Nr</th><th>Užduotis</th></tr>
% for n, row in enumerate(tasks):
<tr class="${['odd', 'even'][n % 2]} ${row.class_}">
  <td class="right">${row.task}</td>
  <td style="width: 25em;" title=${row.title}</td>${row.shorttitle}</td>
</tr>
% endfor
</table>
<p>Neužmirškite, kad galima susigalvoti savo užduotį!  Užduotis tokias kaip 1,
2 ar 23 gali rinktis ir keli studentai, jei darys pakankamai skirtingus
variantus.</p>
</div>
</%def>


<%self:grupe gr="3">
Pratybos vyko pirmadieniais 16 val, 14 kompiuterių klasėje.
</%self:grupe>

<%self:grupe gr="4">
Pratybos vyko pirmadieniais 18 val, 14 kompiuterių klasėje.
</%self:grupe>

<%self:grupe gr="5">
Pratybos vyko penktadieniais 14 val, 308 ir 309 kompiuterių klasėse
Baltupiuose.
</%self:grupe>

<%self:grupe gr="N" title="Kiti">
Atsirado keli žmonės, kurie kartojo kursą ir norėjo pas mane atsiskaitinėti.
</%self:grupe>
