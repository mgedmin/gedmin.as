<%inherit file="_templates/site.mako" />
<%def name="title()">Skaidrės</%def>
<%def name="short_title()">slides</%def>

<%def name="list(items)">
% for name in items:
  <li><a href="${name}">${name}</a></li>
% endfor
</%def>

<h2>Skaidrės</h2>

<h3>1 paskaita (2005-09-06: įžanga)</h3>

<ul>
  ${self.list(['intro.pdf'])}
</ul>

<h3>2 paskaita (2005-09-13: sintaksė)</h3>

<ul>
  ${self.list(['lecture1.pdf'])}
</ul>

<h3>3 paskaita (2005-09-20: duomenų tipai)</h3>

<ul>
  ${self.list(['lecture2.pdf'])}
</ul>

<h3>4 paskaita (2005-09-27: automatizuotas testavimas)</h3>

<ul>
  ${self.list(['lecture3.pdf'])}
</ul>

<h3>5 paskaita (2005-10-04: dokumentaciniai testai)</h3>

<ul>
  ${self.list(['lecture4.pdf'])}
</ul>

<h3>6 paskaita (2005-10-11: standartinė biblioteka)</h3>

<ul>
  ${self.list(['lecture5.pdf'])}
</ul>

<h3>7 paskaita (2005-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  ${self.list(['lecture6.pdf'])}
</ul>

<h3>8 paskaita (2005-10-25: gijos ir procesai)</h3>

<ul>
  ${self.list(['lecture7.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['pavyzdys.py', 'kitas.py', 'processdemo.py', 'callerdemo.py', 'forkdemo.py', 'subprocessdemo.py'])}
</ul>

<h3>9 paskaita (2005-11-08: debuginimas ir optimizavimas)</h3>

<ul>
  ${self.list(['lecture8.pdf'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['labirintas.py', 'mandel.py'])}
</ul>

<h3>10 paskaita (2005-11-15: dekoratoriai ir metaklasės)</h3>

<ul>
  ${self.list(['lecture9.pdf'])}
</ul>

<h3>11 paskaita (2005-11-22: kurso apžvalga)</h3>

<ul>
  ${self.list(['summary.pdf'])}
</ul>


<h2>MagicPoint pradiniai failai</h2>

<p><a href="http://member.wide.ad.jp/wg/mgp/">MagicPoint</a> yra prezentacijų
programa, skirta X Window System aplinkai.</p>

<p>Paveiksliukai, naudojami bendrai</p>
<ul>
  ${self.list(['vu-logo.png', 'logo.gif'])}
</ul>

<h3>1 paskaita (2005-09-06: įžanga)</h3>

<ul>
  ${self.list(['intro.mgp'])}
</ul>

<h3>2 paskaita (2005-09-13: sintaksė)</h3>

<ul>
  ${self.list(['lecture1.mgp', 'l5filter.py'])}
</ul>

<h3>3 paskaita (2005-09-20: duomenų tipai)</h3>

<ul>
  ${self.list(['lecture2.mgp'])}
</ul>

<h3>4 paskaita (2005-09-27: automatizuotas testavimas)</h3>

<ul>
  ${self.list(['lecture3.mgp'])}
</ul>

<h3>5 paskaita (2005-10-04: dokumentaciniai testai)</h3>

<ul>
  ${self.list(['lecture4.mgp'])}
</ul>

<h3>6 paskaita (2005-10-11: standartinė biblioteka)</h3>

<ul>
  ${self.list(['lecture5.mgp', 'l5filter.py'])}
</ul>

<h3>7 paskaita (2005-10-18: protokolai, iteratoriai, generatoriai)</h3>

<ul>
  ${self.list(['lecture6.mgp', 'dont.png', 'rubber_duck_quacks.png'])}
</ul>

<h3>8 paskaita (2005-10-25: gijos ir procesai)</h3>

<ul>
  ${self.list(['lecture7.mgp', 'concurrency-ddj.gif'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['pavyzdys.py', 'kitas.py', 'processdemo.py', 'callerdemo.py', 'forkdemo.py', 'subprocessdemo.py'])}
</ul>

<h3>9 paskaita (2005-11-08: debuginimas ir optimizavimas)</h3>

<ul>
  ${self.list(['lecture8.mgp'])}
</ul>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['labirintas.py', 'mandel.py'])}
</ul>

<h3>10 paskaita (2005-11-15: dekoratoriai ir metaklasės)</h3>

<ul>
  ${self.list(['lecture9.mgp'])}
</ul>

<h3>11 paskaita (2005-11-22: kurso apžvalga)</h3>

<ul>
  ${self.list(['summary.mgp'])}
</ul>

<h3>12 paskaita (2005-11-29: PyGtk ir DB API demo)</h3>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['demo.py', 'gtk-sql-demo.glade'])}
</ul>

<h3>13 paskaita (2005-12-06: PyGame ir Twisted demo)</h3>

<p>Kodo pavyzdžiai</p>

<ul>
  ${self.list(['tree.png', 'gui.py', 'server.py', 'client.py'])}
</ul>


<p>
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
     <img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
   </a>
   <br />Visa medžiagą galima naudoti pagal
   <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 licenziją</a>.
</p>
