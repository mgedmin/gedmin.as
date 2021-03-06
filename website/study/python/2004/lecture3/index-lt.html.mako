<%inherit file="_templates/site.mako" />
<%def name="title()">Trečioji paskaita (2004-09-20)</%def>
<%def name="short_title()">3</%def>

<h2 id="exceptions">Išskirtinės situacijos</h2>

<p>Kaip ir daugelis kitų šiuolaikinių programavimo kalbų, Pythonas turi
išskirtines situacijas (angl. <em>exceptions</em>).  Išskirtinės situacijos --
objektai, kuriuos galima pakelti ir galima sugauti.  Standartinės Pythono
funkcijos jas dažnai naudoja:
</p>

<blockquote class="example"><pre>
<span class="keyword">try</span>:
    <span class="name">f</span> = <span class="name">open</span>(<span class="string">'filename.txt'</span>)
<span class="keyword">except</span> <span class="name">IOError</span>, <span class="name">e</span>:
    <span class="keyword">print</span> <span class="string">"Could not open filename.txt:"</span>, <span class="name">e</span>
</pre></blockquote>

<p>Jei bandymas atidaryti failą nepasiseka (pvz., to failo nėra, arba jis
nepasiekiamas), pakeliama <code class="name">IOError</code> tipo išskirtinė
situacija.  <code class="keyword">try ... except</code> blokas ją pagauna ir
priskiria kintamajam <code class="name">e</code>.</p>

<p>Kai kurios standartinės išskirtinės situacijos (pilną sąrašą rasite <a href="http://python.org/doc/current/lib/module-exceptions.html">Python
  dokumentacijoje</a>):</p>

<ul>
  <li><code class="name">Exception</code> - visų išskirtinių situacijų bazinė
  klasė</li>
  <li><code class="name">IOError</code> - įvedimo/išvedimo klaida (nėra failo,
  nepavyko sukurti katalogo ir pan.)</li>
  <li><code class="name">OSError</code> - operacinės sistemos klaida</li>
  <li><code class="name">IndexError</code> - sąrašo indeksas užeina už ribų</li>
  <li><code class="name">KeyError</code> - žodyne nėra tokio rakto</li>
  <li><code class="name">TypeError</code> - netinkamas argumento tipas</li>
  <li><code class="name">ValueError</code> - netinkama argumento reikšmė</li>
  <li><code class="name">AttributeError</code> - objektas neturi tokio
      atributo</li>
  <li><code class="name">NameError</code> - nėra tokio kintamojo</li>
  <li><code class="name">SyntaxError</code> - sintaksės klaida Python
      programoje</li>
  <li><code class="name">ImportError</code> - nepavyko importuoti modulio</li>
  <li><code class="name">ZeroDivisionError</code> - dalyba iš nulio</li>
  <li><code class="name">RuntimeError</code> - programos veikimo klaida (pvz.,
      amžina rekursija)</li>
  <li><code class="name">KeyboardInterrupt</code> - vartotojas paspaudė Ctrl+C</li>
</ul>

<p><code class="keyword">try ... except</code> bloku galima gaudyti daugiau nei
vieną išskirtinę situaciją:</p>

<blockquote class="example"><pre>
<span class="keyword">try</span>:
    <span class="name">do_something</span>()
<span class="keyword">except</span> <span class="name">TypeError</span>:
    <span class="keyword">print</span> <span class="string">"TypeError"</span>
<span class="keyword">except</span> <span class="name">KeyError</span>:
    <span class="keyword">print</span> <span class="string">"KeyError"</span>
<span class="keyword">except</span> (<span class="name">NameError</span>, <span class="name">AttributeError</span>):
    <span class="keyword">print</span> <span class="string">"NameError or AttributeError"</span>
<span class="keyword">except</span>:
    <span class="keyword">print</span> <span class="string">"any other error"</span>
</pre></blockquote>

<p>Taip pat matome, jog kintamojo vardą galime praleisti, jei nesiruošiame juo
naudotis.  Jei vardiname kelis išskirtinių situacijų tipus, tą sąrašą reikia
apskliausti (kitaip kintamajam <code class="name">AttributeError</code> bus
priskiriamos <code class="name">NameError</code> tipo išskirtinės
situacijos).</p>

<p>Plikų <code class="keyword">except:</code> blokų reiktėtų vengti, nes jie
gali paslėpti programos klaidas.  Galima vieną tokį bloką įdėti programos
pagrindiniame cikle ir, pavyzdžiui, parašyti apie įvykusią klaidą į log failą
(čia naudingas modulis <a href="http://python.org/doc/current/lib/module-traceback.html"><code class="name">traceback</code></a>).
</p>

<p>Kartais mes nenorime apdoroti išskirtinių situacijų, bet norime atlaisvinti
resursus (pvz., uždaryti failus).  Tam skirtas <code class="keyword">try ...
  finally</code> blokas:</p>

<blockquote class="example"><pre>
<span class="name">f</span> = <span class="name">open</span>(<span class="string">'filename.txt'</span>)
<span class="keyword">try</span>:
    <span class="name">do_something</span>()
    <span class="name">do_something_else</span>()
<span class="keyword">finally</span>:
    <span class="name">f</span>.<span class="name">close</span>()
</pre></blockquote>

<p><code class="keyword">finally:</code> dalis bus vykdoma ir tuo atveju, jei
nekils išskirtinių situacijų, ir tuo atveju, jei jos kils.</p>

<p>Išskirtines situacijas kelti galima sakiniu <code class="keyword">raise</code>:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">fibonacci</span>(<span class="name">n</span>):
    <span class="keyword">if</span> <span class="name">n</span> &lt; <span class="number">1</span>:
        <span class="keyword">raise</span> <span class="name">ValueError</span>(<span class="string">'n must be &gt;= 1, got %s'</span> % <span class="name">n</span>)
    <span class="keyword">elif</span> <span class="name">n</span> &lt; <span class="number">3</span>:
        <span class="keyword">return</span> <span class="number">1</span>
    <span class="keyword">else</span>:
        <span class="keyword">return</span> <span class="name">fibonacci</span>(<span class="name">n</span> - <span class="number">1</span>) + <span class="name">fibonacci</span>(<span class="name">n</span> - <span class="number">2</span>)
</pre></blockquote>

<p>Savo išskirtinių situacijų klases aprašyti nesudėtinga</p>

<blockquote class="example"><pre>
<span class="def">class</span> <span class="name">BadColour</span>(<span class="name">ValueError</span>):
    <span class="keyword">pass</span>

<span class="comment"># ...</span>

<span class="def">def</span> <span class="name">do_something_with_colout</span>(<span class="name">colour</span>):
    <span class="keyword">if</span> <span class="keyword">not</span> ...:
        <span class="keyword">raise</span> <span class="name">BadColour</span>(<span class="name">colour</span>)
</pre></blockquote>

<p><code class="keyword">pass</code> reiškia, jog blokas yra tuščias.  Blokas
gali būti bet koks -- klasės aprašo, funkcijos ar metodo aprašo, if sakinio,
else dalies, except dalies ir t.t.</p>

<h2 id="unittests">Testavimas (unit testing)</h2>

<p>Unit testai yra automatizuoti programų testai, tikrinantys kodo vienetus
atskirai vieną nuo kito.  Kiekvienas kodo vienetas (t.y. funkcija, klasė,
metodas) turi savo testą ar kelis testus.</p>

<p>Pythono standartinė biblioteka turi modulį
<a href="http://python.org/doc/current/lib/module-unittest.html"><code class="name">unittest</code></a>, kuris pamėgdžioja Javos JUnit kodo
vienetų testų karkasą.</p>

<p>Pavyzdys:</p>

<blockquote class="example"><pre>
<span class="string">""</span><span class="string">"
mathfunc.py -- Matematinių funkcijų rinkinys
"</span><span class="string">""</span>

<span class="def">def</span> <span class="name">fibonacci</span>(<span class="name">n</span>):
    <span class="string">""</span><span class="string">"Grąžina n-tąjį Fibonačio skaičių."</span><span class="string">""</span>
    <span class="keyword">if</span> <span class="name">n</span> &lt; <span class="number">1</span>:
        <span class="keyword">raise</span> <span class="name">ValueError</span>(<span class="name">n</span>)
    <span class="keyword">elif</span> <span class="name">n</span> &lt;= <span class="number">2</span>:
        <span class="keyword">return</span> <span class="number">1</span>
    <span class="keyword">else</span>:
        <span class="keyword">return</span> <span class="name">fibonacci</span>(<span class="name">n</span> - <span class="number">1</span>) + <span class="name">fibonacci</span>(<span class="name">n</span> - <span class="number">2</span>)


<span class="def">def</span> <span class="name">factorial</span>(<span class="name">n</span>):
    <span class="string">""</span><span class="string">"Grąžina skaičiaus n faktorialą."</span><span class="string">""</span>
    <span class="keyword">if</span> <span class="name">n</span> &lt;= <span class="number">1</span>:
        <span class="keyword">return</span> <span class="number">1</span>
    <span class="keyword">else</span>:
        <span class="keyword">return</span> <span class="name">n</span> * <span class="name">factorial</span>(<span class="name">n</span> - <span class="number">1</span>)
</pre></blockquote>

<p>Testų rinkinys šiam moduliui</p>

<blockquote class="example"><pre>
<span class="shebang">#!/usr/bin/env python</span>
<span class="string">""</span><span class="string">"
Testų rinkinys moduliui mathfunc.py
"</span><span class="string">""</span>

<span class="keyword">import</span> <span class="name">unittest</span>
<span class="keyword">import</span> <span class="name">mathfunc</span>


<span class="def">class</span> <span class="name">TestMathFunc</span>(<span class="name">unittest</span>.<span class="name">TestCase</span>):

    <span class="def">def</span> <span class="name">test_factorial</span>(<span class="name">self</span>):
        <span class="name">f</span> = <span class="name">mathfunc</span>.<span class="name">factorial</span>
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">0</span>), <span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">1</span>), <span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">2</span>), <span class="number">2</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">3</span>), <span class="number">6</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">4</span>), <span class="number">24</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">5</span>), <span class="number">120</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">f</span>(<span class="number">8</span>), <span class="number">40320</span>)
        <span class="name">self</span>.<span class="name">assertRaises</span>(<span class="name">ValueError</span>, <span class="name">f</span>, -<span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertRaises</span>(<span class="name">ValueError</span>, <span class="name">f</span>, -<span class="number">2</span>)

    <span class="def">def</span> <span class="name">test_fibonacci</span>(<span class="name">self</span>):
        <span class="name">fib</span> = <span class="name">mathfunc</span>.<span class="name">fibonacci</span>
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">1</span>), <span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">2</span>), <span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">3</span>), <span class="number">2</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">4</span>), <span class="number">3</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">5</span>), <span class="number">5</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">6</span>), <span class="number">8</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">fib</span>(<span class="number">7</span>), <span class="number">13</span>)
        <span class="name">self</span>.<span class="name">assertRaises</span>(<span class="name">ValueError</span>, <span class="name">fib</span>, <span class="number">0</span>)
        <span class="name">self</span>.<span class="name">assertRaises</span>(<span class="name">ValueError</span>, <span class="name">fib</span>, -<span class="number">1</span>)
        <span class="name">self</span>.<span class="name">assertRaises</span>(<span class="name">ValueError</span>, <span class="name">fib</span>, -<span class="number">2</span>)


<span class="keyword">if</span> <span class="name">__name__</span> == <span class="string">'__main__'</span>:
    <span class="name">unittest</span>.<span class="name">main</span>()
</pre></blockquote>

<p><code class="name">unittest.main</code> automatiškai susirenka visus testus
šiame modulyje.  Testai atpažinami va kaip: randamos visos klasės, paveldinčios
iš <code class="name">unittest.TestCase</code>, ir išrenkami visi jų metodai,
kurių vardai prasideda "test".  <code class="name">TestCase</code> klasė
turi rinkinį metodų, leidžiančių patikrinti kodo teisingumą:</p>
<ul>
  <li>assertEquals(x, y) patikrina, ar x == y</li>
  <li>assertNotEquals(x, y) patikrina, ar x != y</li>
  <li>assert_(b) patikrina, ar reiškinys b yra teisingas</li>
  <li>assertRaises(e, f, a, b, c, ...) patikrina, ar funkcija f, iškviesta su
      argumentais a, b, c, ..., iškelia išskirtinę situaciją e.</li>
</ul>

<p>Štai kaip galima testus paleisti (raktas -v prašo parodyti visų leidžiamų
testų pavadinimus):</p>

<blockquote class="example"><pre>
$ python test_mathfunc.py -v
test_factorial (__main__.TestMathFunc) ... FAIL
test_fibonacci (__main__.TestMathFunc) ... ok

======================================================================
FAIL: test_factorial (__main__.TestMathFunc)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_mathfunc.py", line 21, in test_factorial
    self.assertRaises(ValueError, f, -1)
  File "/usr/lib/python2.3/unittest.py", line 295, in failUnlessRaises
    raise self.failureException, excName
AssertionError: ValueError

----------------------------------------------------------------------
Ran 2 tests in 0.006s

FAILED (failures=1)
</pre></blockquote>

<p>Matome, jog programoje yra klaida -- <code class="name">factorial</code>
funkcija nekelia <code class="name">ValueError</code> klaidos gavusi neigiamą
argumentą.  Ištaisę klaidą vėl paleisime testus ir įsitikinsime, kad klaida
tikrai ištaisyta.</p>

<p>Suradus programoje klaidą, kurios nepagauna testai, visų prima reikėtų
sukurti naują testą, kuris tą klaidą pagautų.  Tokiu būdu būsime tikri, kad
ateityje ta pati klaida nepasikartos.  Tai vadinama regresiniu testavimu (angl.
<em>regression testing</em>).</p>

<h3>Testavimo nauda</h3>

<p>E. W. Dijkstra yra pasakęs, kad testai gali įrodyti programos klaidingumą,
bet negali įrodyti jos teisingumo.  Ar tai reiškia, kad testų rašyti
neapsimoka?  Ne.  Testai padeda įsitikinti, kad keisdami programą jos netyčia
nesugadinome.  Testų rašymas dažnai sugauna žioplas klaidas, kurias padaro
pavargęs programuotojas.  Iš kitos pusės reikia jausti saiką -- jei funkcija
tokia triviali, kad joje tikrai klaidų būti negali, nėra prasmės rašyti jai
testo -- geriau tą sutaupytą laiką sunaudoti rašant testą sudėtingai
funkcijai.</p>

<p>Pythono programuotojų bendruomenėje testai dažnai siūlomi kaip atsakas
statiškai tipizuotoms kalboms.  Testų rinkinys sugauna klaidas, kurias kitose
programavimo kalbose sugautų kompiliatoriau atliekamas tipų patikrinimas.
O taip pat sugauna ir kitas klaidas, kurių statiškai tipizuotų klaidų
kompiliatoriai nepastebi.  Geriau investuoti laiką rašant testus, negu
rašinėjant tipų deklaracijas kiekvienai funkcijai, kintamajam ar metodui.</p>

<p>Egzistuoja disciplina, vadinama "testai pirma" (angl. "tests first" arba
"test driven development (TDD)"):</p>

<ol>
  <li>Rašomas testas</li>
  <li>Rašomas kodas</li>
  <li>Leidžiami testai (jei jie nepraeina, kodas taisomas, kol jie praeina)</li>
  <li>Kodas tvarkomas, kad būtų gražus ir lengvai suprantamas</li>
  <li>Leidžiami testai (įsitikiname, kad gražindami kodą nieko
      nesugriovėme)</li>
  <li>Ciklas kartojamas iš pradžių</li>
</ol>

<p>Tokio darbo būdo nauda:</p>

<ul>
  <li>Turime pilną testų rinkinį</li>
  <li>Kodo dizainą įtakoja tai, kaip kodas bus naudojamas, o ne tai, kaip jį
  patogiau realizuoti.</li>
  <li>Akcentuojamas kodo paprastumas</li>
</ul>

<p>TDD yra viena iš sudėtinių ekstremalaus programavimo (XP) dalių.</p>

<p>Ne viską galima lengvai testuoti.  Sritys, kuriose sudėtinga kurti
automatizuotus testus yra:</p>

<ul>
  <li>Vartotojo sąsajos programavimas</li>
  <li>Paskirstytos sistemos</li>
</ul>

<p>Tokiais atvejais geriausia visą programos logiką turėti testuojamuose
komponentuose, o vartotojo sąsają ar ryšius su kitomis paskirstytos sistemos
dalimis laikyti kiek galima „plonesnius“.</p>

<h3 id="doctests">Dokumentacijos testai</h3>

<p>Paprastų funkcijų testus galima užrašyti tų funkcijų dokumentacijos
eilutėse, kaip vartojimo pavyzdžius:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">abs</span>(<span class="name">x</span>):
    <span class="string">""</span><span class="string">"Grąžina |x|, t.y. skaičiaus x absoliučiąją reikšmę.

    Pavyzdžiai:

      &gt;&gt;&gt; abs(1)
      1
      &gt;&gt;&gt; abs(-2)
      2
      &gt;&gt;&gt; abs(0)
      0

    "</span><span class="string">""</span>
    <span class="keyword">if</span> <span class="name">x</span> &gt;= <span class="number">0</span>:
        <span class="keyword">return</span> <span class="name">x</span>
    <span class="keyword">else</span>:
        <span class="keyword">return</span> -<span class="name">x</span>
</pre></blockquote>

<p>Tokį dokumentacinį testą galima nukopijuoti tiesiai iš interaktyvios Python
sesijos.</p>

<p>Dokumentaciniams testams leisti ir tikrinti yra skirtas <a href="http://python.org/doc/current/lib/module-doctest.html">doctest</a>
modulis, tačiau didesnėje programoje geriau juos integruoti į testų
modulius, kartu su kitais testais.  Štai kaip tai daroma:</p>

<blockquote class="example"><pre>
<span class="shebang">#!/usr/bin/env python</span>
<span class="string">""</span><span class="string">"
Testų rinkinys moduliui mathfunc.py
"</span><span class="string">""</span>

<span class="keyword">import</span> <span class="name">unittest</span>
<span class="keyword">import</span> <span class="name">doctest</span>
<span class="keyword">import</span> <span class="name">mathfunc</span>


<span class="def">class</span> <span class="name">TestMathFunc</span>(<span class="name">unittest</span>.<span class="name">TestCase</span>):
   ...
   ...
   ...


<span class="def">def</span> <span class="name">test_suite</span>():
    <span class="name">suite</span> = <span class="name">unittest</span>.<span class="name">TestSuite</span>()
    <span class="name">suite</span>.<span class="name">addTest</span>(<span class="name">unittest</span>.<span class="name">makeSuite</span>(<span class="name">TestMathFunc</span>))
    <span class="name">suite</span>.<span class="name">addTest</span>(<span class="name">doctest</span>.<span class="name">DocTestSuite</span>(<span class="name">mathfunc</span>))
    <span class="keyword">return</span> <span class="name">suite</span>

<span class="keyword">if</span> <span class="name">__name__</span> == <span class="string">'__main__'</span>:
    <span class="name">unittest</span>.<span class="name">main</span>(<span class="name">defaultTest</span>=<span class="string">'test_suite'</span>)
</pre></blockquote>

<p>Skirtumai nuo ankstesniojo testų modulio:</p>
<ol>
  <li>Importuojame <code class="name">doctest</code>.</li>
  <li>Aprašome funkciją <code class="name">test_suite</code>.</li>
  <li>Šioje funkcijoje sudedame visas testų klases į rinkinį, o taip pat į
      testų rinkinį įtraukiame <code class="name">DocTestSuite</code>
      norimam moduliui.</li>
  <li><code class="name">unittest.main</code> perduodame argumentą <code class="name">defaultTest</code>.</li>
</ol>

<h3>Keli testų failai</h3>

<p>Didesnėje programoje bus daug Python kodo modulių, ir ne mažiau testų
modulių.  Kad nereiktų kiekvieno testų modulio rankutėmis paleidinėti, galime
pasinaudoti skriptu, kuris tai padarys už mus:</p>

<blockquote class="example"><pre>
<span class="shebang">#!/usr/bin/python</span>
<span class="string">""</span><span class="string">"Skriptukas, paleidžiantis visus programos testus."</span><span class="string">""</span>

<span class="keyword">import</span> <span class="name">os</span>
<span class="keyword">import</span> <span class="name">unittest</span>

<span class="def">def</span> <span class="name">test_files</span>():
    <span class="string">""</span><span class="string">"Grąžina sąrašą su visais testų failais."</span><span class="string">""</span>
    <span class="name">files</span> = []
    <span class="keyword">for</span> <span class="name">dirpath</span>, <span class="name">dirnames</span>, <span class="name">filenames</span> <span class="keyword">in</span> <span class="name">os</span>.<span class="name">walk</span>(<span class="string">'.'</span>):
        <span class="name">files</span> += [<span class="name">f</span> <span class="keyword">for</span> <span class="name">f</span> <span class="keyword">in</span> <span class="name">filenames</span>
                  <span class="keyword">if</span> <span class="name">f</span>.<span class="name">startswith</span>(<span class="string">'test'</span>) <span class="keyword">and</span> <span class="name">f</span>.<span class="name">endswith</span>(<span class="string">'.py'</span>)]
    <span class="keyword">return</span> <span class="name">files</span>

<span class="def">def</span> <span class="name">test_modules</span>(<span class="name">test_files</span>):
    <span class="string">""</span><span class="string">"Paverčia failų vardus į modulių vardus."</span><span class="string">""</span>
    <span class="keyword">return</span> [<span class="name">filename</span>[:-<span class="number">3</span>].<span class="name">replace</span>(<span class="name">os</span>.<span class="name">path</span>.<span class="name">sep</span>, <span class="string">'.'</span>)
            <span class="keyword">for</span> <span class="name">filename</span> <span class="keyword">in</span> <span class="name">test_files</span>]

<span class="def">def</span> <span class="name">main</span>():
    <span class="name">suite</span> = <span class="name">unittest</span>.<span class="name">TestSuite</span>()
    <span class="keyword">for</span> <span class="name">module_name</span> <span class="keyword">in</span> <span class="name">test_modules</span>(<span class="name">test_files</span>()):
        <span class="name">module</span> = <span class="name">__import__</span>(<span class="name">module_name</span>, {}, {}, ())
        <span class="name">suite</span>.<span class="name">addTest</span>(<span class="name">module</span>.<span class="name">test_suite</span>())
    <span class="name">unittest</span>.<span class="name">TextTestRunner</span>().<span class="name">run</span>(<span class="name">suite</span>)

<span class="keyword">if</span> <span class="name">__name__</span> == <span class="string">'__main__'</span>:
    <span class="name">main</span>()
</pre></blockquote>

<p>Ši programėlė tikisi kiekviename testų modulyje surasti funkciją
<code class="name">test_suite</code>, panašiai kaip praeitame skyrelyje
buvusiame pavyzdyje.</p>

<h3>Sudėtingesni testai</h3>

<p>Testų klasėse galima aprašyti metodus <code class="name">setUp</code> ir
<code class="name">tearDown</code>, kurie bus automatiškai paleidžiami
atitinkamai prieš kiekvieną testą ir po kiekvieno testo.  Šiuose metoduose
galite susikurti aplinką, reikiamą testams.</p>

<p>Pavyzdys: testuojame metodą, kuris sukuria kataloge tris failus.  <code class="name">setUp</code> metode susikursime laikiną katalogą, o <code class="name">tearDown</code> modulyje jį ištrinsime, kad mūsų testai
nepalikinėtų po savęs šiukšlių.</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">unittest</span>
<span class="keyword">import</span> <span class="name">tempfile</span>
<span class="keyword">import</span> <span class="name">shutil</span>

...

<span class="def">class</span> <span class="name">TestFileCreator</span>(<span class="name">unittest</span>.<span class="name">TestSuite</span>):

    <span class="def">def</span> <span class="name">setUp</span>(<span class="name">self</span>):
        <span class="name">self</span>.<span class="name">dir</span> = <span class="name">tempfile</span>.<span class="name">mkdtemp</span>()

    <span class="def">def</span> <span class="name">test</span>(<span class="name">self</span>):
        <span class="name">create_three_files</span>(<span class="name">dir</span>=<span class="name">self</span>.<span class="name">dir</span>)
        <span class="name">files</span> = <span class="name">os</span>.<span class="name">listdir</span>(<span class="name">self</span>.<span class="name">dir</span>)
        <span class="name">self</span>.<span class="name">assertEquals</span>(<span class="name">len</span>(<span class="name">files</span>), <span class="number">3</span>)

    <span class="def">def</span> <span class="name">tearDown</span>(<span class="name">self</span>):
        <span class="name">shutil</span>.<span class="name">rmtree</span>(<span class="name">self</span>.<span class="name">dir</span>)

...
</pre></blockquote>
