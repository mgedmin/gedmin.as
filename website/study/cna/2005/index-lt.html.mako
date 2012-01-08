<%inherit file="_templates/site.mako" />
<%def name="title()">Kompiuterių tinklai (2005)</%def>
<%def name="short_title()">2005</%def>

<div class="news toolbox shadow"
     tal:define="gr here/whatsHappeningNow"
     tal:condition="gr"><div class="inner">
Dabar vyksta pratybos <a tal:attributes="href string:#gr$gr"><span tal:replace="gr">N</span> grupei</a>.
</div></div>

<h2>Kompiuterių tinklai</h2>

<div tal:condition="python:0"
     style="padding: 1ex; border: 1px dotted red; margin-right: 20em; ">
     Balandžio 27 d. vyko <a href="http://www.midi.lt/">MIDI</a>, tad
     pratybų nebvo.  II užduoties atsiskaitymo data atidedama savaitei,
     t.y. šią savaitę nežymėsiu to -0.1 balo už pavėlavimą (bet kitą jau
     bus -0.2).
</div>

<div style="float:right; padding-left: 3em; padding-bottom: 1em; font-size: small; text-align: center; color: #888">
  <img src="about/mugshot2.jpg" alt="Mano nuotrauka" />
  <br/>Taip atrodo dėstytojas
  <br/><span style="font-size: xx-small">(tik kostiumo nesitikėkite)</span>
</div>

<p>2005 m. pavasario semestrą aš vedžiau <a
  href="http://www.mif.vu.lt/~jurgita/cna/">kompiuterių tinklų</a>
pratybas.</p>

<p>Būtinai perskaitykite <a
  href="http://www.mif.vu.lt/~jurgita/cna/ND2005.html">reikalavimus</a>.</p>

<p>Užduotis pasirinkti galite ir <a href="mailto:mgedmin@b4net.lt">paštu</a>.
Užduotys negali kartotis grupėje.  Užduotį galima susigalvoti ir savo, bet ji
neturi būti visiškai triviali.</p>

<p>Nuorodos apie soketų programavimą:</p>

<ul>
  <li><a href="http://www.mif.vu.lt/~jurgita/cna/cna_literature.html">Nuorodų sarašas oficialiame kurso puslapyje</li>
  <li><a href="http://www.mif.vu.lt/~alga/unix/">Unix programavimo kurso konspektas (trumpai apie socketus, procesus, gijas)</li>
  <li><a href="http://www.ecst.csuchico.edu/~beej/guide/net/">Beej's Guide to Network Programming</a></li>
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
<p>Neužmirškite, kad galima susigalvoti savo užduotį!  Užduotis tokias kaip 1,
2 ar 23 gali rinktis ir keli studentai, jei darys pakankamai skirtingus
variantus.</p>
<p tal:condition="here/amManager">
<a tal:attributes="href string:editCSV?fn=data${gr}gr.csv">Edit</a>
</p>
</div>
</metal:block>
</tal:macros>

<tal:defs define="gr string:3">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyko ketvirtadieniais 16 val, 2 ir 3 kompiuterių klasėse.
Aš jas vedu kartu su Aurimu Urbonu.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:4">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyko ketvirtadieniais 12 val, 2 ir 3 kompiuterių klasėse.
Aš jas vedu kartu su Eimontu Augiliu.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:5">
<metal:block use-macro="template/macros/grupe">
<p metal:fill-slot="extrainfo">
Pratybos vyko ketvirtadieniais 14 val, 2 ir 3 kompiuterių klasėse.
Aš jas vedu kartu su Vaidotu Mickum.
</p>
</metal:block>
</tal:defs>

<tal:defs define="gr string:N">
<metal:block use-macro="template/macros/grupe">
<metal:block fill-slot="title">Kiti</metal:block>
<p metal:fill-slot="extrainfo">
Atsirado keli žmonės, kurie kartojo kursą ir norėjo pas mane atsiskaitinėti.
</p>
</metal:block>
</tal:defs>
