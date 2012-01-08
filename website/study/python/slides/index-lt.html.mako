<%inherit file="_templates/site.mako" />
<%def name="title()">Skaidrės</%def>
<%def name="short_title()">slides</%def>

<h2>Skaidrės</h2>

<h3>1 paskaita (2006-09-06: įžanga)</h3>

<ul>
  <li tal:repeat="name python:['intro.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['pirma.py', 'antra.py', 'duom.txt']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>2 paskaita (2006-09-13: sintaksė)</h3>

<ul>
  <li tal:repeat="name python:['python2.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['manofunkcijos.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>3 paskaita (2006-09-20: duomenų tipai, standartinė biblioteka)</h3>

<ul>
  <li tal:repeat="name python:['python3.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['programa.py', 'zaidimas.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>4 paskaita (2006-09-27: išskirtinės situacijos, vykdymo modelis, vardų erdvės)</h3>

<ul>
  <li tal:repeat="name python:['python4.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:['exceptions.py', 'globals.py', 'medziai.py', 'uzdariniai.py']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>5 paskaita (2005-10-04: automatizuotas testavimas)</h3>

<ul>
  <li tal:repeat="name python:['python5.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>
<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:'eqns.py tests.py test1.in test1.out runtests.py test_bar.py test_foo.py'.split()">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>6 paskaita (2005-10-11: dokumentaciniai testai)</h3>

<ul>
  <li tal:repeat="name python:['python6.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:'doctestsample.py README.txt rundoctests.py testdemo.py points.txt'.split()">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>7 paskaita (2006-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  <li tal:repeat="name python:['python7.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>8 paskaita (2005-10-25: dekoratoriai ir metaklasės)</h3>

<ul>
  <li tal:repeat="name python:['python8.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>9 paskaita (2005-11-15: procesai ir gijos)</h3>

<ul>
  <li tal:repeat="name python:['python9.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:'gijos.py gijos2.py gijos3.py gijos4.py gijos5.py gijos6.py gijos7.py procesai.py procesai2.py procesai3.py input.txt'.split()">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>


<h3>10 paskaita (2005-11-22: SQL duomenų bazės ir grafinė vartotojo sąsaja</h3>

<p>Nuorodos</p>

<ul>
  <li><a href="http://www.python.org/topics/database/">Python DB API</a></li>
  <li><a href="http://glade.gnome.org/">Glade GUI konstruktorius</a></li>
  <li><a href="http://www.pygtk.org/">PyGTK dokumentacija</a></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:'generate.py addressbook.glade addressbook.py'.split()">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>11 paskaita (2005-11-29: Tinklas su Twisted ir grafika su PyGame)</h3>

<p>Nuorodos</p>

<ul>
  <li><a href="http://www.pygame.org/docs/">PyGame dokumentacija</a></li>
  <li><a href="http://twistedmatrix.com/projects/core/documentation/howto/index.html">Twisted dokumentacija</a></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  <li tal:repeat="name python:'gui.py server.py client.py tree.png'.split()">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>


<h3>12 paskaita (2005-12-06: Programų derinimas ir optimizavimas)</h3>

<ul>
  <li tal:repeat="name python:['python12.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>13 paskaita (2005-12-13: Kurso apžvalga)</h3>

<ul>
  <li tal:repeat="name python:['summary.pdf']">
    <a tal:attributes="href name" tal:content="name" /></li>
</ul>

<h3>Įskaita (2005-12-20: trumpas testukas)</h3>

<p>Taip pat galite pasižiūrėti <a href="../2005/slides">praėjusių metų
  skaidres</a>.</p>

<p>
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
     <img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
   </a>
   <br />Visa medžiagą galima naudoti pagal
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 licenziją</a>.
</p>
