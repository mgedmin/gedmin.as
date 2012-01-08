<%inherit file="_templates/site.mako" />
<%def name="title()">Skaidrės</%def>
<%def name="short_title()">slides</%def>

<h2>Skaidrės</h2>

<h3>1 paskaita (2005-09-06: įžanga)</h3>

<ul>
  <li tal:repeat="name python:['intro.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>2 paskaita (2005-09-13: sintaksė)</h3>

<ul>
  <li tal:repeat="name python:['lecture1.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>3 paskaita (2005-09-20: duomenų tipai)</h3>

<ul>
  <li tal:repeat="name python:['lecture2.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>4 paskaita (2005-09-27: automatizuotas testavimas)</h3>

<ul>
  <li tal:repeat="name python:['lecture3.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>5 paskaita (2005-10-04: dokumentaciniai testai)</h3>

<ul>
  <li tal:repeat="name python:['lecture4.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>6 paskaita (2005-10-11: standartinė biblioteka)</h3>

<ul>
  <li tal:repeat="name python:['lecture5.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>7 paskaita (2005-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  <li tal:repeat="name python:['lecture6.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>8 paskaita (2005-10-25: gijos ir procesai)</h3>

<ul>
  <li tal:repeat="name python:['lecture7.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['pavyzdys.py', 'kitas.py', 'processdemo.py', 'callerdemo.py', 'forkdemo.py', 'subprocessdemo.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>9 paskaita (2005-11-08: debuginimas ir optimizavimas)</h3>

<ul>
  <li tal:repeat="name python:['lecture8.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['labirintas.py', 'mandel.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>10 paskaita (2005-11-15: dekoratoriai ir metaklasės)</h3>

<ul>
  <li tal:repeat="name python:['lecture9.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>11 paskaita (2005-11-22: kurso apžvalga)</h3>

<ul>
  <li tal:repeat="name python:['summary.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>


<h2>MagicPoint pradiniai failai</h2>

<p><a href="http://member.wide.ad.jp/wg/mgp/">MagicPoint</a> yra prezentacijų
programa, skirta X Window System aplinkai.</p>

<p>Paveiksliukai, naudojami bendrai</p>
<ul>
  <li tal:repeat="name python:['vu-logo.png', 'logo.gif']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>1 paskaita (2005-09-06: įžanga)</h3>

<ul>
  <li tal:repeat="name python:['intro.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>2 paskaita (2005-09-13: sintaksė)</h3>

<ul>
  <li tal:repeat="name python:['lecture1.mgp', 'l5filter.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>3 paskaita (2005-09-20: duomenų tipai)</h3>

<ul>
  <li tal:repeat="name python:['lecture2.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>4 paskaita (2005-09-27: automatizuotas testavimas)</h3>

<ul>
  <li tal:repeat="name python:['lecture3.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>5 paskaita (2005-10-04: dokumentaciniai testai)</h3>

<ul>
  <li tal:repeat="name python:['lecture4.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>6 paskaita (2005-10-11: standartinė biblioteka)</h3>

<ul>
  <li tal:repeat="name python:['lecture5.mgp', 'l5filter.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>7 paskaita (2005-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  <li tal:repeat="name python:['lecture6.mgp', 'dont.png', 'rubber_duck_quacks.png']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>8 paskaita (2005-10-25: gijos ir procesai)</h3>

<ul>
  <li tal:repeat="name python:['lecture7.mgp', 'concurrency-ddj.gif']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['pavyzdys.py', 'kitas.py', 'processdemo.py', 'callerdemo.py', 'forkdemo.py', 'subprocessdemo.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>9 paskaita (2005-11-08: debuginimas ir optimizavimas)</h3>

<ul>
  <li tal:repeat="name python:['lecture8.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['labirintas.py', 'mandel.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>10 paskaita (2005-11-15: dekoratoriai ir metaklasės)</h3>

<ul>
  <li tal:repeat="name python:['lecture9.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>11 paskaita (2005-11-22: kurso apžvalga)</h3>

<ul>
  <li tal:repeat="name python:['summary.mgp']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>12 paskaita (2005-11-29: PyGtk ir DB API demo)</h3>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['demo.py', 'gtk-sql-demo.glade']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>13 paskaita (2005-12-06: PyGame ir Twisted demo)</h3>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['tree.png', 'gui.py', 'server.py', 'client.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>


<p>
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
     <img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
   </a>
   <br />Visa medžiagą galima naudoti pagal
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 licenziją</a>.
</p>
