<%inherit file="_templates/site.mako" />
<%def name="title()">Skaidrės</%def>
<%def name="short_title()">slides</%def>

<%def name="list(items)">
% for name in items:
  <li><a href="${name}">${name}</a></li>
% endfor
</%def>

<h2>Skaidrės</h2>

<h3>1 paskaita (2006-09-06: įžanga)</h3>

<ul>
  ${self.list(['intro.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['pirma.py', 'antra.py', 'duom.txt'])}
</ul>

<h3>2 paskaita (2006-09-13: sintaksė)</h3>

<ul>
  ${self.list(['python2.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['manofunkcijos.py'])}
</ul>

<h3>3 paskaita (2006-09-20: duomenų tipai, standartinė biblioteka)</h3>

<ul>
  ${self.list(['python3.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['programa.py', 'zaidimas.py'])}
</ul>

<h3>4 paskaita (2006-09-27: išskirtinės situacijos, vykdymo modelis, vardų erdvės)</h3>

<ul>
  ${self.list(['python4.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['exceptions.py', 'globals.py', 'medziai.py', 'uzdariniai.py'])}
</ul>

<h3>5 paskaita (2005-10-04: automatizuotas testavimas)</h3>

<ul>
  ${self.list(['python5.pdf'])}
</ul>
<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list('eqns.py tests.py test1.in test1.out runtests.py test_bar.py test_foo.py'.split())}
</ul>

<h3>6 paskaita (2005-10-11: dokumentaciniai testai)</h3>

<ul>
  ${self.list(['python6.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list('doctestsample.py README.txt rundoctests.py testdemo.py points.txt'.split())}
</ul>

<h3>7 paskaita (2006-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  ${self.list(['python7.pdf'])}
</ul>

<h3>8 paskaita (2005-10-25: dekoratoriai ir metaklasės)</h3>

<ul>
  ${self.list(['python8.pdf'])}
</ul>

<h3>9 paskaita (2005-11-15: procesai ir gijos)</h3>

<ul>
  ${self.list(['python9.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list('gijos.py gijos2.py gijos3.py gijos4.py gijos5.py gijos6.py gijos7.py procesai.py procesai2.py procesai3.py input.txt'.split())}
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
  ${self.list('generate.py addressbook.glade addressbook.py'.split())}
</ul>

<h3>11 paskaita (2005-11-29: Tinklas su Twisted ir grafika su PyGame)</h3>

<p>Nuorodos</p>

<ul>
  <li><a href="http://www.pygame.org/docs/">PyGame dokumentacija</a></li>
  <li><a href="http://twistedmatrix.com/projects/core/documentation/howto/index.html">Twisted dokumentacija</a></li>
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list('gui.py server.py client.py tree.png'.split())}
</ul>


<h3>12 paskaita (2005-12-06: Programų derinimas ir optimizavimas)</h3>

<ul>
  ${self.list(['python12.pdf'])}
</ul>

<h3>13 paskaita (2005-12-13: Kurso apžvalga)</h3>

<ul>
  ${self.list(['summary.pdf'])}
</ul>

<h3>Įskaita (2005-12-20: trumpas testukas)</h3>

<p>Taip pat galite pasižiūrėti <a href="../2005/slides">praėjusių metų
  skaidres</a>.</p>

<p>
   <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">
     <img alt="Creative Commons License" style="border-width:0" src="https://licensebuttons.net/l/by-sa/3.0/88x31.png" />
   </a>
   <br />Visa medžiagą galima naudoti pagal
   <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 licenziją</a>.
</p>
