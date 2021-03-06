<%inherit file="_templates/site.mako" />
<%def name="title()">Šeštoji paskaita (2004-10-11)</%def>
<%def name="short_title()">6</%def>

<h2 id="threads">Darbas su gijomis</h2>

<p>Jei reikia ką nors padaryti fone, naudokite <a href="http://python.org/doc/current/lib/module-threading.html">threading</a>
modulį.</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">threading</span>
<span class="keyword">import</span> <span class="name">time</span>
<span class="keyword">import</span> <span class="name">sys</span>

<span class="def">def</span> <span class="name">some_function</span>():
    <span class="keyword">for</span> <span class="name">i</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">3</span>)
        <span class="name">time</span>.<span class="name">sleep</span>(<span class="number">1</span>)
        <span class="keyword">print</span> <span class="string">"1"</span>

<span class="name">thread</span> = <span class="name">threading</span>.<span class="name">Thread</span>(<span class="name">target</span>=<span class="name">some_function</span>)
<span class="name">thread</span>.<span class="name">start</span>()
<span class="name">sys</span>.<span class="name">exit</span>()
</pre></blockquote>

<p>Pagrindinė programos gija paleidžia foninę giją ir išeina.  Gina laukia
tris sekundes ir kas sekundę spausdina skaičių į ekraną.  Pati programa baigia
darbą, kai baigia darbą visos gijos (išskyrus „demoniškąsias“).  Jei norite,
kad gija netrukdytų programos darbo pabaigai, prieš ją paleisdami pasakykite
apie tai:</p>

<blockquote class="example"><pre>
...
<span class="name">thread</span>.<span class="name">setDaemon</span>(<span class="name">True</span>)
<span class="name">thread</span>.<span class="name">start</span>()
...
</pre></blockquote>

<p>Jei nenorite perdavinėti funkcijų Thread klasei, galite apsirašyti savo
klasę:</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">time</span>
<span class="keyword">import</span> <span class="name">threading</span>

<span class="def">class</span> <span class="name">MyThread</span>(<span class="name">threading</span>.<span class="name">Thread</span>):

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>):
        <span class="name">threading</span>.<span class="name">Thread</span>.<span class="name">__init__</span>(<span class="name">self</span>)
        <span class="name">self</span>.<span class="name">setDaemon</span>(<span class="name">True</span>)

    <span class="def">def</span> <span class="name">run</span>(<span class="name">self</span>):
        <span class="keyword">for</span> <span class="name">i</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">3</span>)
            <span class="name">time</span>.<span class="name">sleep</span>(<span class="number">1</span>)
            <span class="keyword">print</span> <span class="string">"1"</span>

<span class="name">thread</span> = <span class="name">MyThread</span>()
<span class="name">thread</span>.<span class="name">start</span>()
<span class="name">time</span>.<span class="name">sleep</span>(<span class="number">2</span>)
</pre></blockquote>

<p>Gijos metodas <code>join</code> leidžia vienai gijai palaukti, kol kita gija
baigs darbą.</p>

<p>Sudėtingesnis pavyzdys: paleiskime procesą ir perskaitykime jo standartinį
išvedimą (stdout) bei standartinį klaidų kanalą (stderr) atskirose gijose.
Jei bandytume tai daryti vienoje gijoje, iškiltų rizika užsiblokuoti
(deadlock), jei užsipildytų ne tas operacinės sistemos buferis.</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">os</span>
<span class="keyword">import</span> <span class="name">threading</span>

<span class="def">class</span> <span class="name">Reader</span>(<span class="name">threading</span>.<span class="name">Thread</span>):

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>, <span class="name">pipe</span>):
        <span class="name">threading</span>.<span class="name">Thread</span>.<span class="name">__init__</span>(<span class="name">self</span>)
        <span class="name">self</span>.<span class="name">pipe</span> = <span class="name">pipe</span>
        <span class="name">self</span>.<span class="name">start</span>()

    <span class="def">def</span> <span class="name">run</span>(<span class="name">self</span>):
        <span class="name">self</span>.<span class="name">data</span> = <span class="name">self</span>.<span class="name">pipe</span>.<span class="name">read</span>()
        <span class="name">self</span>.<span class="name">pipe</span>.<span class="name">close</span>()


<span class="def">def</span> <span class="name">run_program</span>(<span class="name">command_line</span>):
    <span class="string">"""Rus a program and return (standard_output, standard_error)."""</span>

    <span class="name">child_stdin</span>, <span class="name">child_stdout</span>, <span class="name">child_stderr</span> = <span class="name">os</span>.<span class="name">popen3</span>(<span class="name">command_line</span>)
    <span class="name">child_stdin</span>.<span class="name">close</span>()

    <span class="name">reader</span> = <span class="name">Reader</span>(<span class="name">child_stderr</span>)

    <span class="name">stdout_data</span> = <span class="name">child_stdout</span>.<span class="name">read</span>()
    <span class="name">child_stdout</span>.<span class="name">close</span>()

    <span class="name">reader</span>.<span class="name">join</span>()
    <span class="name">stderr_data</span> = <span class="name">reader</span>.<span class="name">data</span>

    <span class="keyword">return</span> (<span class="name">stdout_data</span>, <span class="name">stderr_data</span>)
</pre></blockquote>

<h3>Koordinacija tarp gijų</h3>

<p>Modulyje threading yra keli tradiciniai primityvai kontroliuoti, kad gijos
neužliptų viena kitai ant kojų -- Lock, RLock (recursive lock), Semaphore,
Event, Condition objektai.  Dažniausiai gera idėja yra jų vengti ir pasinaudoti
aukštesnio lygio <a href="http://python.org/doc/current/lib/module-Queue.html">Queue</a>
moduliu ir perdavinėti specializuotas užduotis gijoms-darbininkėms.</p>

<p>Parašyti programą be klaidų yra labai sudėtinga, jei naudojamos gijos, tad
geriau jų vengti.</p>

<h3>Efektyvumas</h3>

<p>Pythonas negali labai efektyviai išnaudoti daugelio gijų, nes Pythono
interpretatorius naudoja vieną globalų užraktą (lock).  Vieno procesoriaus
sistemose tai nesvarbu, bet daugiaprocesorinėse sistemose nesitikėkite
pagreitėjimo, jei gijos vykdo tik pliką Python kodą.</p>

<p>Šis apribojimas negalioja išoriniams moduliams, rašytiems C kalba, arba
darbui su operacine sistema (failų skaitymui, tinklo paketų laukimui ir t.t.).
Šioms užduotims gijos labai tinka.</p>

<h2 id="iterators">Iteratoriai</h2>

<p>Jūs jau žinote, kad Pythonas leidžia prasukti <code>for</code> ciklą
per visas failo eilutes:</p>

<blockquote class="example"><pre>
<span class="name">f</span> = <span class="name">file</span>(<span class="string">'filename.txt'</span>)    <span class="comment"># arba open('filename.txt') -- tai tas pats</span>
<span class="keyword">for</span> <span class="name">line</span> <span class="keyword">in</span> <span class="name">f</span>:
    <span class="keyword">print</span> <span class="name">line</span>
</pre></blockquote>

<p>Kaip tai veikia?  Kaip rašyti savo klases, per kurias galima būtų
<em>iteruoti</em>?</p>

<p>Python leidžia iteruoti per visus objektus, kurie turi metodą
<code>__iter__</code> (bei objektus, turinčius metodą <code>__getitem__</code>,
bet tai specialus ir siauras atvejis).  Šis metodas turi grąžinti
<em>iteratorių</em> -- objektą, kuris turi funkciją <code>next</code> ir
kurio <code>__iter__</code> metodas grąžina jį patį.</p>

<blockquote class="example"><pre>
<span class="def">class</span> <span class="name">AddressBook</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>):
        <span class="name">self</span>.<span class="name">_data</span> = [(<span class="string">'Jonas'</span>, <span class="string">'jonas@example.com'</span>),
                      (<span class="string">'Petras'</span>, <span class="string">'petras@example.org'</span>),
                      (<span class="string">'Maryte'</span>, <span class="string">'maryte@example.net'</span>)]

    <span class="def">def</span> <span class="name">__iter__</span>(<span class="name">self</span>):
        <span class="keyword">return</span> <span class="name">AddressBookIterator</span>(<span class="name">self</span>)


<span class="def">class</span> <span class="name">AddressBookIterator</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>, <span class="name">abook</span>):
        <span class="name">self</span>.<span class="name">abook</span> = <span class="name">abook</span>
        <span class="name">self</span>.<span class="name">index</span> = <span class="number">0</span>

    <span class="def">def</span> <span class="name">next</span>(<span class="name">self</span>):
        <span class="keyword">if</span> <span class="name">self</span>.<span class="name">index</span> &gt;= <span class="name">len</span>(<span class="name">self</span>.<span class="name">abook</span>.<span class="name">_data</span>):
            <span class="keyword">raise</span> <span class="name">StopIteration</span>
        <span class="name">item</span> = <span class="name">self</span>.<span class="name">abook</span>.<span class="name">_data</span>[<span class="name">self</span>.<span class="name">index</span>]
        <span class="name">self</span>.<span class="name">index</span> += <span class="number">1</span>
        <span class="keyword">return</span> <span class="name">item</span>
</pre></blockquote>

<p>Funkcija <code>next</code> paeiliui grąžina sekos elementus, o kai jie
pasibaigia, iškelia StopIteration išskirtinę situaciją.</p>

<p>Kam reikia atskiros klasės?  Ogi tam, kad galima būtų per tą pačią adresų
knygelę iteruoti lygiagrečiai.</p>

<h2 id="generatoriai">Generatoriai</h2>

<p>Rankutėmis iteratorius rašinėti nepatogu.  Laimei, Pythonas turi
<em>generatorius</em>.  Generatorius -- tai funkcija, grąžinanti iteratorių:
</p>

<blockquote class="example"><pre>
<span class="def">class</span> <span class="name">AddressBook</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>):
        <span class="name">self</span>.<span class="name">_data</span> = [(<span class="string">'Jonas'</span>, <span class="string">'jonas@example.com'</span>),
                      (<span class="string">'Petras'</span>, <span class="string">'petras@example.org'</span>),
                      (<span class="string">'Maryte'</span>, <span class="string">'maryte@example.net'</span>)]

    <span class="def">def</span> <span class="name">__iter__</span>(<span class="name">self</span>):
        <span class="keyword">for</span> <span class="name">item</span> <span class="keyword">in</span> <span class="name">self</span>.<span class="name">_data</span>:
            <span class="keyword">yield</span> <span class="name">item</span>
</pre></blockquote>

<p>Generatorius nuo paprastos funkcijos (ar metodo) skiriasi tuo, kad jo kūne
naudojamas bazinis žodis <code>yield</code>.  Generatoriaus iškvietimas grąžina
iteratorių.  Kviečiant to iteratoriaus <code>next</code> metodą vykdomas
funkcijos kodas iki kito <code>yield</code> iškvietimo ir grąžinama
<code>yield</code>ui paduota reikšmė.  Jei funkcija baigiasi nepasiekusi
<code>yield</code>, <code>next</code> iškelia StopIteration.</p>

<p>Kitas pavyzdys:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">fibonacci</span>():
    <span class="string">"""Generuoja Fibonačio skaičius."""</span>
    <span class="name">a</span>, <span class="name">b</span> = <span class="number">1</span>, <span class="number">1</span>
    <span class="keyword">while</span> <span class="name">True</span>:
        <span class="keyword">yield</span> <span class="name">a</span>
        <span class="name">a</span>, <span class="name">b</span> = <span class="name">b</span>, <span class="name">a</span>+<span class="name">b</span>


<span class="name">fib</span> = <span class="name">fibonacci</span>()       <span class="comment"># generatoriaus iškvietimas duoda iteratorių</span>
<span class="keyword">for</span> <span class="name">n</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">6</span>):
    <span class="keyword">print</span> <span class="name">n</span>, <span class="name">fib</span>.<span class="name">next</span>()    <span class="comment"># galime rankomis kviesti funkciją next</span>

<span class="keyword">print</span>

<span class="name">fib2</span> = <span class="name">fibonacci</span>()      <span class="comment"># galime lygiagrečiai iteruoti kelis kartus</span>
<span class="keyword">for</span> <span class="name">n</span>, <span class="name">f</span> <span class="keyword">in</span> <span class="name">zip</span>(<span class="name">range</span>(<span class="number">8</span>), <span class="name">fib2</span>):    <span class="comment"># naudoju zip, kad ištraukčiau pirmus 8</span>
    <span class="keyword">print</span> <span class="name">n</span>, <span class="name">f</span>

<span class="keyword">print</span>

<span class="comment"># senasis iteratorius atsimena, kur jis buvo</span>
<span class="keyword">print</span> <span class="number">6</span>, <span class="name">fib</span>.<span class="name">next</span>()
</pre></blockquote>

<p>Šiame pavyzdyje parodytas generatorius yra begalinis.</p>

<p>Standartinė Python funkcija <code>enumerate</code> taip pat yra
generatorius.  Ją galima būtų užrašyti taip:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">enumerate</span>(<span class="name">seq</span>):
    <span class="name">n</span> = <span class="number">0</span>
    <span class="keyword">for</span> <span class="name">item</span> <span class="keyword">in</span> <span class="name">seq</span>:
        <span class="keyword">yield</span> <span class="name">n</span>, <span class="name">item</span>
        <span class="name">n</span> += <span class="number">1</span>
</pre></blockquote>

<p>Galima būtų parašyti ir funkciją, kuri ima sąrašą ir grąžina sąrašą, bet
generatoriaus privalumas -- sutaupoma atminties, nėra ilgų tarpinių sąrašų,
galima dirbti su begalinėmis sekomis.</p>

<p>Dar vienas standartinėje bibliotekoje esantis generatoriaus pavyzdys --
funkcija <a href="http://python.org/doc/current/lib/os-file-dir.html#l2h-1466">os.walk</a>
(palyginkite su <a href="http://python.org/doc/current/lib/module-os.path.html#l2h-1587">os.path.walk</a>).</p>

<p>Modulyje <a href="http://python.org/doc/current/lib/module-itertools.html">itertools</a>
yra neblogas rinkinukas įvairių iteratorių bei generatorių, kuriuos galima
tarpusavyje kombinuoti.</p>
