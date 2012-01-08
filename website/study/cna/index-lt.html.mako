<%inherit file="_templates/site.mako" />
<%def name="title()">Kompiuterių tinklai</%def>
<%def name="short_title()">Tinklai</%def>

<div class="news toolbox shadow"
     tal:define="gr here/whatsHappeningNow"
     tal:condition="gr"><div class="inner">
Dabar vyksta pratybos <a tal:attributes="href string:#gr$gr"><span tal:replace="gr">N</span> grupei</a>.
</div></div>

<a style="float: right; padding: 1em 2em; text-decoration: none"
   href="https://mg.b4net.lt/study/cna/enter_result">&nbsp;</a>

<h2>Kompiuterių tinklai</h2>

<div tal:condition="python:1"
     style="padding: 1ex; border: 1px dotted red; margin-right: 20em; ">
  Oficiali informacija: už vėlavimus balai nebus mažinami.
</div>

<div style="float:right; padding-left: 3em; padding-bottom: 1em; font-size: small; text-align: center; color: #888">
  <img src="about/mugshot2.jpg" alt="Mano nuotrauka" />
  <br/>Taip atrodo dėstytojas
  <br/><span style="font-size: xx-small">(tik kostiumo nesitikėkite)</span>
</div>

<p>2006 m. pavasario semestrą aš vedu <a
  href="http://www.mif.vu.lt/~adam/courses/cna/index.html">kompiuterių
  tinklų kurso</a> pratybas.</p>

<p>Pratybų metu reikės pasirinkti užduotį ir atsiskaityti tris variantus:</p>
<ol>
  <li>Dvi programos (klientas ir serveris) C arba C++ kalba (naudojant BSD socket API)</li>
  <li>Dvi programos (klientas ir serveris) Java kalba</li>
  <li>Viena programa C/C++, kita Java kalba.</li>
</ol>

<p>Būtinai perskaitykite <a
  href="http://www.mif.vu.lt/~adam/courses/cna/ND2006.html">reikalavimus</a>.
Ten taip pat nurodytos ir <strong>atsiskaitymų datos</strong> bei vertinimo
sistema.</p>

<p>Užduotis pasirinkti galite ir <a href="mailto:mgedmin@b4net.lt">paštu</a>.
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

<tal:macros condition="nothing">
<metal:block define-macro="grupe">
<h3 style="clear:both" tal:attributes="id string:gr$gr"><metal:block define-slot="title"><span tal:replace="gr">4</span> grupė</metal:block></h3>

<metal:block define-slot="extrainfo">
</metal:block>

<div style="float: left; padding-bottom: 1em">
<h4>Studentai</h4>
<table class="simple">
<tr><th>Nr</th><th>Studentas</th><th>Užduotis</th><th>1</th><th>2</th><th>3</th></tr>
<tr tal:repeat="row python:here.list(gr=gr)"
    tal:attributes="class python:['even', 'odd'][repeat['row'].even()]">
  <td class="right" tal:content="repeat/row/number">nr.</td>
  <td style="width: 10em;" tal:content="row/name">Vardas Pavardė</td>
  <td style="width: 9em;" class="right" tal:content="row/task" tal:condition="row/task">užduotis</td>
  <td style="width: 9em; color:red" class="right" tal:condition="not:row/task">nepasirinkta</td>
  <tal:loop repeat="uzd python:[row['uzd%d'%n] for n in range(1, 4)]">
  <td style="color:green" class="center" tal:content="uzd" tal:condition="uzd">.</td>
  <td style="color:gray" class="center" tal:condition="not:uzd">&#183;</td>
  </tal:loop>
</tr>
</table>
<p>
<a tal:attributes="href string:results/#gr${gr}">Detalūs rezultatai</a>
</p>
</div>

<div style="float: left; padding-left: 5em; width: 40%">
<h4>Užduotys</h4>

<table class="simple">
<tr><th>Nr</th><th>Užduotis</th></tr>
<tr tal:repeat="row python:here.tasks(gr=gr)"
    tal:attributes="class python:['even', 'odd'][repeat['row'].even()]
                            + ' ' + row['class']">
  <td class="right" tal:content="row/task">nr</td>
  <td style="width: 25em;" tal:content="row/shorttitle"
      tal:attributes="title row/title">Pavadinimas</td>
</tr>
</table>
<p>Neužmirškite, kad galima susigalvoti savo užduotį!
Užduotis tokias kaip 1,
2 ar 23 gali rinktis ir keli studentai, jei darys pakankamai skirtingus
variantus.</p>
<p tal:condition="here/amManager">
<a tal:attributes="href string:editCSV?fn=data${gr}gr.csv"
   tal:content="string:Edit $gr gr.">Edit</a>
</p>
</div>
</metal:block>
</tal:macros>

<tal:defs define="gr string:3" condition="python:1">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyksta pirmadieniais 16 val, 14 kompiuterių klasėje.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:4" condition="python:1">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyksta pirmadieniais 18 val, 14 kompiuterių klasėje.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:5" condition="python:1">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyksta penktadieniais 14 val, 308 ir 309 kompiuterių klasėse
Baltupiuose.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:N" condition="python:1">
<metal:block use-macro="template/macros/grupe">
<metal:block fill-slot="title">Kiti</metal:block>
<p metal:fill-slot="extrainfo">
Atsirado keli žmonės, kurie kartojo kursą ir norėjo pas mane atsiskaitinėti.
</p>
</metal:block>
</tal:defs>

<p tal:condition="here/amManager">
<a href="choose_task">Užduoties pasirinkimas</a>
<a href="enter_result">Atsiskaitymas</a>
</p>
<a accesskey="c" href="https://mg.b4net.lt/study/cna/choose_task"></a>
<a accesskey="r" href="https://mg.b4net.lt/study/cna/enter_result"></a>
