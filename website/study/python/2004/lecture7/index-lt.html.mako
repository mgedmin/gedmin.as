<%inherit file="_templates/site.mako" />
<%def name="title()">Septintoji paskaita (2004-10-18)</%def>
<%def name="short_title()">7</%def>

<h2>Debuginimas</h2>

<p>Yra daug <abbr title="Integrated Development Environment">IDE</abbr>, skirtų
Pythonui (<a href="http://www.python.org/idle/">IDLE</a> -- ateina su Pythono
instaliacija, <a href="http://www.die-offenbachs.de/detlev/eric3.html">Eric3</a>, <a href="http://wingide.com/wingide">WingIDE</a> (komercinė), ir t.t.).  Dalis
iš jų turi integruotą debugerį.  Bet apie tai aš nekalbėsiu, nes naudoju <a href="http://www.vim.org/">VIMą</a>.</p>

<p>Pythonas turi standartinį komandų eilutės debugerį <a href="http://python.org/doc/current/lib/module-pdb.html">pdb</a>
standartinėje bibliotekoje.  Debugeris rašytas Pythonu, tad galite pasižiūrėti
jo source kodą ar prikabinti prie jo kokį nors front-endą (ką visokie IDE ir
daro).</p>

<p>Paprasčiausias būdas debuginti programą -- norimoje vietoje įterpti
breakpointą:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">my_function_with_a_problem</span>(<span class="name">args</span>, ...):
    ...
    ...
    <span class="keyword">for</span> ...:
       <span class="keyword">if</span> ...:
           <span class="keyword">import</span> <span class="name">pdb</span>; <span class="name">pdb</span>.<span class="name">set_trace</span>()          <span class="comment"># &lt;- paleidžiam debugerį</span>
           ...
    ...
</pre></blockquote>

<p>Toliau paleidžiate programą konsolėje ir laukiate, kol ji sustos.  PDB duoda
valdomas komandomis, iš kurių naudingiausios yra</p><p></p>

<dl>
  <dt>where (arba bt)</dt>
  <dd>Parodo programos veikimo steką (call stack)</dd>
  <dt>list (arba l)</dt>
  <dd>Parodo programos source kodą (nurodytas eilutes)</dd>
  <dt>step (arba s)</dt>
  <dd>Žingsnis į priekį (lenda į kviečiamų funkcijų vidų)</dd>
  <dt>next (arba n)</dt>
  <dd>Žingsnis į priekį (nelenda į kviečiamų funkcijų vidų)</dd>
  <dt>continue (arba c)</dt>
  <dd>Baigia debuginimą ir leidžia programai veikti toliau</dd>
  <dt>up (arba u)</dt>
  <dd>Pakyla programos veikimo steku aukštyn.  Tai įtakoja, pvz.,
  <code>list</code> komandą (ji rodo pasirinktos funkcijos source kodą) bei
  kintamuosius, matomus <code>print</code> bei <code>!</code> komandoms.</dd>
  <dt>down (arba d)</dt>
  <dd>Nusileidžia programos veikimo steku žemyn.  Žr. <code>up</code>.</dd>
  <dt>print (arba p)</dt>
  <dd>Spausdina Python reiškinį</dd>
  <dt>!</dt>
  <dd>Vykdo Python sakinį (kuris turi tilpti vienoje eilutėje)</dd>
  <dt>break (arba b)</dt>
  <dd>Prideda breakpointą (galima nurodyti failą ir eilutę arba tiesiog
  funkciją).</dd>
  <dt>help</dt>
  <dd>Išvardina ar paaiškina pdb komandas</dd>
</dl>

<p>Kartais debuginti patogiau prikaišiojant <code>print</code> sakinių į
kodą.</p>


<h2>Optimizavimas</h2>

<blockquote>
  <p>Premature optimization is the root of all evil.</p>
  <p>-- Donald E. Knuth</p>
</blockquote>

<p>Pirmiausia įsitikinkite, kad programą tikrai reikia optimizuoti.  Teisinga
darbo tvarka:</p>
<ol>
  <li>Padaryk, kad programa veiktų.</li>
  <li>Padaryk, kad programa veiktų teisingai.</li>
  <li>Padaryk, kad programa veiktų greitai.</li>
</ol>

<p>Jei jau programa veikia, ir veikia teisingai (ir turi rinkinį <a href="../lecture3#unittests">testų</a>), bet veikia per lėtai, tuomet galima
užsiimti ir optimizacija:</p>

<ul>
  <li>Reikia susigalvoti benchmarką ir matuoti programos veikimo greitį --
  kitaip bus neaišku, kurie kodo pakeitimai situaciją pagerina, o kurie
  pablogina.</li>
  <li>Reikia programą profiliuoti -- 90% (ar daugiau) veikimo laiko
  praleidžiama 10% (ar mažiau) kodo.  Praktika rodo, kad programuotojų
  intucija nesugeba teisingai atspėti, kas yra tie 10% kodo.</li>
  <li>Reikia pagalvoti, ar nėra efektyvesnio algoritmo -- esant didesniems
  duomenų rinkiniams labai gerai optimizuotas bubble sortas stabdys, o
  visai neoptimizuotas quick sortas -- ne.</li>
</ul>

<h3>Laiko matavimas</h3>

<p>Geriau dviračio neišradinėti ir pasinaudoti moduliu <a href="http://python.org/doc/current/lib/module-timeit.html">timeit</a>:</p>

<blockquote class="example"><pre>
<span class="comment"># mymodule.py</span>

<span class="def">def</span> <span class="name">square1</span>(<span class="name">x</span>):
    <span class="keyword">return</span> <span class="name">x</span> * <span class="name">x</span>

<span class="def">def</span> <span class="name">square2</span>(<span class="name">x</span>):
    <span class="keyword">return</span> <span class="name">x</span> ** <span class="number">2</span>

<span class="keyword">if</span> <span class="name">__name__</span> == <span class="string">'__main__'</span>:
    <span class="keyword">import</span> <span class="name">timeit</span>, <span class="name">mymodule</span>
    <span class="name">n_times</span> = <span class="number">100000</span>
    <span class="name">timer</span> = <span class="name">timeit</span>.<span class="name">Timer</span>(<span class="string">"square1(42)"</span>, <span class="string">"from mymodule import square1"</span>)
    <span class="name">square1_best_of_3</span> = <span class="name">min</span>(<span class="name">timer</span>.<span class="name">repeat</span>(<span class="number">3</span>, <span class="name">n_times</span>))
    <span class="keyword">print</span> <span class="string">"square1: %.3f microseconds"</span> % <span class="name">square1_best_of_3</span>
    <span class="name">timer</span> = <span class="name">timeit</span>.<span class="name">Timer</span>(<span class="string">"square2(42)"</span>, <span class="string">"from mymodule import square2"</span>)
    <span class="name">square2_best_of_3</span> = <span class="name">min</span>(<span class="name">timer</span>.<span class="name">repeat</span>(<span class="number">3</span>, <span class="name">n_times</span>))
    <span class="keyword">print</span> <span class="string">"square2: %.3f microseconds"</span> % <span class="name">square2_best_of_3</span>
</pre></blockquote>

<p>Veikimo pavyzdys:</p>

<blockquote><pre>
$ <strong>python mymodule.py</strong>
square1: 0.170 seconds
square2: 0.204 seconds
</pre></blockquote>

<p>Galima timeit paleisti iš komandų eilutės:</p><p></p>

<blockquote><pre>
$ <strong>python /usr/lib/python2.3/timeit.py -s 'from mymodule import square1' 'square1(42)'</strong>
1000000 loops, best of 3: 2.08 usec per loop
$ <strong>python /usr/lib/python2.3/timeit.py -s 'from mymodule import square2' 'square2(42)'</strong>
100000 loops, best of 3: 2.12 usec per loop
</pre></blockquote>

<h3>Algoritmai</h3>

<p>Svarbu parinkti tinkamas duomenų struktūras -- pvz., jei tikrinsite, ar
elementas yra aibėje, tai aibei reprezentuoti naudokite <a href="http://python.org/doc/current/lib/module-sets.html">sets</a> modulį ar
bent jau žodyną, bet ne sąrašą.</p>

<p>Taip pat svarbu pasirinkti efektyvius algoritmus.  Labai gerai optimizuotas
bubble sortas esant nors kiek didesniam duomenų rinkiniui praloš prieš visai
neoptimizuotą quick sortą.</p>

<h3>Profiliavimas</h3>

<p>90% programos laiko yra praleidžiama 10% programos kodo.  Sunku atspėti,
kas būtent yra tie 10%.  Profiliatorius leidžia tai nustatyti.</p>

<p>Profiliatorius programos veikimo metu skaičiuoja, kiek kartų buvo iškviesta
kiekviena funkcija bei kiek laiko ji veikė.  Akivaizdu, kad labiau apsimoka
optimizuota tas funkcijas, kurios kviečiamos šimtus tūkstančių kartų, nei tas,
kurios kviečiamos tris kartus.  Kita vertus reikia atsižvelgti ir į funkcijoje
praleistą laiką -- jei funkcija kviečiama 10 kartų suryja 90% laiko, geriau
optimizuoti ją, nei funkciją, kuri per 100000 iškvietimų suryja 1% laiko.</p>

<p>Python standartinėje bibliotekoje yra du profiliatoriai -- <a href="http://python.org/doc/current/lib/module-hotshot.html">hotshot</a>
(rašytas C, greitesnis) bei <a href="http://python.org/doc/current/lib/module-profile.html">profile</a>
(rašytas pliku Pythonu, lėtesnis).  Jų naudojimas panašus.  Toliau
demonstruosiu <tt>hotshot</tt>.</p>

<p>Tarkime, kad jūs norite išsiaiškinti, kodėl funkcija <tt>do_something</tt>
iš modulio <tt>my_module</tt> užtrunka labai ilgai.  Pasileiskite Python
interpretatorių ir...</p>

<blockquote><pre>
&gt;&gt;&gt; import hotshot
&gt;&gt;&gt; from my_module import do_something
&gt;&gt;&gt; profiler = hotshot.Profile('do_something.prof')
&gt;&gt;&gt; profiler.runcall(do_something)
&gt;&gt;&gt; profiler.close()
</pre></blockquote>

<p>Jei <tt>do_something</tt> turi argumentų, juos galite perduoti
<tt>runcall</tt> metodui.  Jei <tt>do_something</tt> grąžina reikšmę, ją
jums grąžins <tt>runcall</tt>.  Profiliavimo duomenys bus įrašyti į failą
<tt>do_something.prof</tt>. Jų analizė:</p>

<blockquote><pre>
&gt;&gt;&gt; import hotshot
&gt;&gt;&gt; stats = hotshot.stats.load('do_something.prof')
&gt;&gt;&gt; stats.strip_dirs()     # mus domina failų vardai be katalogų
&gt;&gt;&gt; stats.sort_stats('time', 'calls') # akivaizdu, ką tai daro
&gt;&gt;&gt; stats.print_stats(20)             # parodys 20 lėčiausių funkcijų
</pre></blockquote>

<p>Kiekviena išspausdintos lentelės eilutė atitinka funkciją.  Stulpeliai yra
</p>

<dl>
  <dt>ncalls</dt>
  <dd>Kiek kartų ši funkcija buvo kviesta.</dd>
  <dt>tottime</dt>
  <dd>Kiek iš viso laiko buvo praleista šioje funkcijoje.</dd>
  <dt>percall</dt>
  <dd>tottime padalinta iš ncalls</dd>
  <dt>cumtime</dt>
  <dd>Kiek iš viso laiko buvo praleista šioje funkcijoje ir iš jos iškviestose
  funkcijose.</dd>
  <dt>percall</dt>
  <dd>cumtime padalinta iš ncalls</dd>
</dl>

<p>Apsimoka pilną rezultatų lentelę importuoti į kokį speadsheetą ir su ja
pažaisti -- parūšiuoti vienaip ar kitaip, pasumuoti, pažiūrėti, kas labiausiai
stabdo ir ką labiau apsimoka optimizuoti.</p>

<h3>Jei niekas nepadeda</h3>

<p>Jei jūsų algoritmo esmė -- gilūs skaičiavimai, kuriuos Pythonas vykdo per
lėtai, apsimoka perrašyti skaičiavimus C ar kita žemesnio lygio kalba
arba paieškoti bibliotekų, kuriose reikiami skaičiavimai būtų efektyviai
realizuoti.</p>

<p>Žmonės su pliku Pythonu ir standartinės bibliotekos moduliais padaro <a href="http://www.python.org/pycon/dc2004/papers/6/">Voice over IP
  klientus</a>, kuriuose tinklo paketus reikia spėti apdoroti per 20
milisekundžių.  Pasidairykite standartinėje bibliotekoje.</p>

<p><a href="http://www.pfdubois.com/numpy/">Numerical Python</a> yra biblioteka
realizuojanti greitus skaičiavimus su dideliais masyvais ar matricomis.  Pats
tas darbui su grafika.</p>

<p><a href="http://psyco.sourceforge.net/">Psyco</a> yra Just In Time
kompiliatorius Pythono kodui.</p>

<p><a href="http://nz.cosc.canterbury.ac.nz/~greg/python/Pyrex/">Pyrex</a> yra
į Pythoną panaši kalba skirta rašyti Pythono išplėtimo moduliams.  Pyrex kodas
su (nebūtinomis) tipų anotacijomis yra verčiamas į C kodą, kurį galima
kompiliuoti.</p>
