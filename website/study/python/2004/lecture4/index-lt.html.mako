<%inherit file="_templates/site.mako" />
<%def name="title()">Ketvirtoji paskaita (2004-09-27)</%def>
<%def name="short_title()">4</%def>

<h2>Standartinė biblioteka</h2>

<p>Viena iš Python idėjų yra</p>

<blockquote><p>Python comes with batteries included</p></blockquote>

<p>Išvertus į žmonių kalbą -- su Python ateina <a href="http://python.org/doc/current/lib/lib.html">turtinga standartinė
  biblioteka</a>, leidžianti atlikti daug praktikoje naudingų veiksmų.</p>

<p>Trumpa naudingų modulių apžvalga, kad pajustumėte, ką galima rasti
standartinėje bibliotekoje:</p>

<dl>
  <dt><a href="http://python.org/doc/current/lib/module-sys.html">sys</a></dt>
  <dd>Darbas su sistema: priėjimas prie komandų eilutės, klaidos kodo
  grąžinimas iš programos, Python versija, sąrašas katalogų, kuriuose bus
  ieškoma importuojamų modulių.  </dd>

  <dt><a href="http://python.org/doc/current/lib/module-operator.html">operator</a></dt>
  <dd>Pythono operatoriai kaip funkcijos, funkcinio programavimo mėgėjams.
  Gerai derinasi su funkcija <a href="http://python.org/doc/current/lib/built-in-funcs.html#l2h-57">reduce</a>.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-traceback.html">traceback</a></dt>
  <dd>Priėjimas prie programos steko, jei reikia gražaus klaidų pateikimo
  (pvz. formatavimo HTMLe) didesnėse sistemose.
  </dd>

  <dt><a href="http://python.org/doc/current/lib/module-linecache.html">linecache</a></dt>
  <dd>Labai lengvas priėjimas prie failų eilučių („duok man šito failo 425
  eilutę“), nesirūpinant efektyvumu (viskas kešuojama).
  </dd>

  <dt><a href="http://python.org/doc/current/lib/module-pickle.html">pickle</a></dt>
  <dd>Bet kokių Python objektų išsaugojimas diske, išlaikant tarpusavio
  sąryšius.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-cPickle.html">cPickle</a></dt>
  <dd>Tas pats, kas ir <a href="http://python.org/doc/current/lib/module-pickle.html">pickle</a>, bet
  veikia greičiau, nes implementuota C kode.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-copy.html">copy</a></dt>
  <dd>Gilus ir negilus objektų kopijavimas</dd>

  <dt><a href="http://python.org/doc/current/lib/module-pprint.html">pprint</a></dt>
  <dd>Gražus objektų pavaizdavimas (pretty printing)</dd>

  <dt><a href="http://python.org/doc/current/lib/module-builtin.html">__builtin__</a></dt>
  <dd>Visos vidinės funkcijos -- jų nereikia specialiai importuoti iš
  __builtin__ modulio, bet __builtin__ modulis leidžia mums pasižiūrėti visą
  vidinių funkcijų/objektų sąrašą, pvz., naudojant
<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">__builtin__</span>
<span class="keyword">print</span> <span class="name">dir</span>(<span class="name">__builtin__</span>)
</pre></blockquote>
  </dd>

  <dt><a href="http://python.org/doc/current/lib/module-string.html">string</a></dt>
  <dd>Pasęnęs modulis darbui su simbolių eilutėmis -- dabar didžioji dalis string modulio funkcijų
  yra tiesiog stringų metodai.  Geriau jo vengti.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-re.html">re</a></dt>
  <dd>Darbas su <a href="http://en.wikipedia.org/wiki/Regular_expression">reguliariomis
    išraiškomis (regular expressions)</a>.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-struct.html">struct</a></dt>
  <dd>Darbas su dvejetainėmis duomenų struktūromis -- gali praversti, jei rankomis
  konstruojate tinklo paketus ar dvejetainius duomenų failus.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-difflib.html">difflib</a></dt>
  <dd>Dviejų sekų palyginimas -- su šiuo moduliu galite nesunkiai pasigaminti paprastą
  Unixo <a href="http://en.wikipedia.org/wiki/Diff">diff</a> analogą.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-StringIO.html">StringIO</a></dt>
  <dd>Failo objektas, laikantis duomenis atmintyje ir leidžiantis pasiekti juos kaip
  simbolių eilutę.  Labai praverčia unit testams.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-cStringIO.html">cStringIO</a></dt>
  <dd>Tas pats, kas ir <a href="http://python.org/doc/current/lib/module-StringIO.html">StringIO</a>, bet
  veikia greičiau, nes implementuota C kode.  Skirtingai nuo StringIO,
  cStringIO nemoka dirbti su Unikodinėmis simbolių eilutėmis.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-textwrap.html">textwrap</a></dt>
  <dd>Paprastas teksto "lankstymas".</dd>

  <dt><a href="http://python.org/doc/current/lib/module-pydoc.html">pydoc</a></dt>
  <dd>Tiek modulis, tiek programa, duodanti informacinius puslapius apie
  Pythono modulius, klases ar funkcijas.  Informacija yra sukrapštoma iš dokumentacinių
  simbolių eilutčių (docstrings), tad pydoc'as veiks ir su jūsų pačių parašytais
  moduliais.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-doctest.html">doctest</a></dt>
  <dd>Karkasas <a href="../lecture3/index-lt.html#doctests">dokumentaciniams testams</a>.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-unittest.html">unittest</a></dt>
  <dd>Karkasas <a href="../lecture3/index-lt.html#unittests">automatizuotiems
    kodo vienetų testams</a>.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-math.html">math</a></dt>
  <dd>Įvairios matematinės funkcijos ir konstantos (sinusai, Pi ir t.t.).</dd>

  <dt><a href="http://python.org/doc/current/lib/module-random.html">random</a></dt>
  <dd>Pseudoatsitiktinių skaičių generavimas.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-sets.html">sets</a></dt>
  <dd>Aibės duomenų tipas.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-os.html">os</a></dt>
  <dd>Darbas su operacine sistema (procesų valdymas, aplinka, failų vardai ir t.t.).
  Atkreipkite dėmesį į modulį os.path -- jis labai naudingas programoms, veikiančioms
  tiek Unixe, tiek Windowsuose, tiek Mac OSe.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-datetime.html">datetime</a></dt>
  <dd>Duomenų tipai datai ir laikui bei operacijos su jais.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-time.html">time</a></dt>
  <dd>Senesnis modulis darbui su laiku -- vietoje padorių duomenų tipų turite
  sekundžių skaičių nuo 1970 sausio 1 dienos bei krūvą globalių funkcijų.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-curses.html">curses</a></dt>
  <dd>Tekstinio režimo „grafinė“ vartotojo sąsaja.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-getopt.html">getopt</a></dt>
  <dd>Paprastas ir patogus komandų eilutės argumentų apdorojimas.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-tempfile.html">tempfile</a></dt>
  <dd>Laikinų failų su atsitiktiniais vardais kūrimas.  Praverčia unit testuose.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-glob.html">glob</a></dt>
  <dd>Failų paieška pagal šablonus (pvz, <tt>a[1-9]*.txt</tt>).</dd>

  <dt><a href="http://python.org/doc/current/lib/module-shutil.html">shutil</a></dt>
  <dd>Sudėtingesnės operacijos su failais (kopijavimas, rekursyvus katalogo trynimas ir pan.).</dd>

  <dt><a href="http://python.org/doc/current/lib/module-locale.html">locale</a></dt>
  <dd>Darbas su lokale -- vartotojo naudojama simbolių koduotė, laiko ir datos
  užrašymo būdas ir t.t.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-gettext.html">gettext</a></dt>
  <dd>Programų vartotojo sąsajos vertimas į kitas kalbas.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-logging.html">logging</a></dt>
  <dd>Karkasas informaciniams pranešimams (<em>logging</em>).</dd>

  <dt><a href="http://python.org/doc/current/lib/module-threading.html">threading</a></dt>
  <dd>Darbas su <a href="../lecture6/index-lt.html#threads">gijomis</a>.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-zipfile.html">zipfile</a></dt>
  <dd>Darbas su ZIP archyvais.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-readline.html">readline</a></dt>
  <dd>Komandų eilutė su istorija, tab-išplėtimu ir kitais saldžiais priedais
  Unix sistemose.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-csv.html">csv</a></dt>
  <dd>Darbas su Comma Separated Value (CSV) failais.</dd>

  <dt><a href="http://python.org/doc/current/lib/module-email.html">email</a></dt>
  <dd>Elektroninio pašto pranešimų formavimas pagal visus Internetinius
  standartus (RFC 2822, MIME ir t.t.).</dd>

</dl>
