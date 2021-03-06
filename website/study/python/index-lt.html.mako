<%inherit file="_templates/site.mako" />
<%def name="title()">Programavimo kalba Python</%def>
<%def name="short_title()">Python</%def>

<a style="float: right; padding: 1em 2em; text-decoration: none" href="https://gedmin.as/study/python/students/enter_result">&nbsp;</a>

<h2>Programavimo kalba Python</h2>

<div style="border: 1px dotted red; padding: 1ex; float: right; width: 20em; margin: 0 0 1ex 2ex">
  Atnaujinta informacija išryškinta <span class="new">raudonai</span>.
</div>

<!--
  <br /><br />

Įskaitai reikia trijų programėlių ir testuko.  Arba projektuko
ir testuko.
  <br /><br />
  <span class="new">
      Jau suvedžiau visų testukų <a href="students">rezultatus</a>.
    </span>

  <br /><br />
  <strong>2006-11-08 paskaitos nebus (sergu)</strong>
  <br /><br />
  <strong>Galutiniai <a href="students">rezultatai</a></strong>
  <br /><br />
  <span class="new">Popierinius žiniaraščius aš jau užpildžiau.  Duomenų bazę laisvai
    pasirenkamiems dalykams pildo studentų skyrius.</span>
  <span class="new">Perlaikymas bus antradienį, vasario 14&nbsp;d., 14 val.
    9-oje kompiuterių klasėje.
    Reikalavimai tie patys kaip ir semestro metu.</span>
</div>

-->

<!--

<div style="border: 1px dotted red; padding: 1ex; margin-right: 27em">
<span class="new">
  Kam trūksta įskaitai programėlių, ir kas yra jas atsiuntę man laiku (iki
  gruodžio 22 d. vakaro), galite užsukti pas mane į darbą (nuo pietų iki
  vakaro) ir jas atsiskaityti.  Paskambinkite man (+370 685 04774) ir
  susitarkite dėl konkretaus laiko.
  <br/><br/>
  <strong>Sausio 25 d. yra paskutinė galimybė atsiskaityti</strong>
</span>
</div>

-->

<h3>2006 m. ruduo</h3>

<p>Laisvai pasirenkamas dalykas.</p>

<p>Paskaitos vyko trečiadieniais 14:00, 301 auditorijoje.</p>

<p>Pratybos vyko penktadieniais 14:00, 16:00 bei 18:00 val. 3-oje kompiuterių
klasėje.</p>

<p>Per paskaitas dėsčiau teoriją (žr. <a href="slides">skaidres</a>), per
pratybas priiminėjau atsiskaitymus.</p>

<p>Visa svarbi informacija turėtų būti surašyta šiame puslapyje</p>

<blockquote>
  <p><a class="good" href="http://gedmin.as/python">http://gedmin.as/python</a></p>
</blockquote>

<h3 id="practice">Atsiskaitymai</h3>

<p>Per pratybas reikėjo atsiskaityti tris mažas programėles (arba
vieną didelę).  Sąlygas reikėjo susigalvoti patiems -- aš tik pateikiau bendrus
reikalavimus, tematiką, bei sąlygų pavyzdžius.  Prieš pradėdami jas daryti,
sąlygą parodykite man (el. paštu -- <span style="text-decoration: line-through" title="pasikeitė į marius@gedmin.as">mgedmin@b4net.lt</span> -- arba per pratybas
asmeniškai), kad aš ją patvirtinčiau.  Visos sąlygos turi būti pakankamai
skirtingos (kad du žmonės nedarytų tos pačios užduoties).  Jei sąlygą nusiuntėte
man paštu, o aš per pakankamai greitą laiką (porą dienų) neatsiliepiau, galite
pakartotinai mane krutinti emailu arba tiesiog pradėti ją daryti.  Jei iškyla
problemų su paštu (jūsų siųstas laiškas grįžta), bandykite mano darbo adresą
-- marius@pov.lt.</p>

<p class="">Siųsdami laišką paminėkite savo vardą pavardę, kursą, grupę ir studijų
kryptį.</p>

<p class="">Prieš atsiskaitymą norėčiau padarytą užduotį gauti paštu.</p>

<p>Deadlainai: viską reikėjo atsiskaityti <em>iki semestro galo</em>.
Atsižvelkite į tai, kad jūsų daug, aš vienas, ir atsiskaitymas užima
laiko (bent 5 minutes).</p>

<p class="">Įskaitai reikėjo trijų programėlių ir testuko.  Arba projektuko
ir testuko.  Testukas nesunkus, jei žinote esminius principus.  Jis vyko
gruodžio 20 d. paskaitos metu.</p>

<p class="">Čia galite rasti <a href="students">atsiskaitymų rezultatus ir
  pasirinktas užduotis</a></p>

<p><strong>Pirmoji užduotis</strong>.  Parašyti programą, kuri apdoroja
tekstinį failą (ar kelis failus).</p>

<p>Mano tikslai šiai užduotėlei: noriu, kad būtų proga susipažinti su ciklais,
duomenų įvedimu ir išvedimu, sąrašais ir/arba žodynais.</p>

<p>Sąlygų <em>pavyzdžiai</em> (kai kurie iš praėjusių metų, kiti šiaip į galvą atėję):</p>
<ul>
  <li>Skaičiuoti raidžių/žodžių dažnumus</li>
  <li>Palyginti du failus pažodžiui (kaip GNU wdiff)</li>
  <li>Atsitiktinio labirinto generavimas.</li>
  <li>Suskaidyti failą į N dalių bei suklijuoti atgal.</li>
  <li>Užkoduoti/atkoduoti failą.</li>
  <li>Suskaičiuoti raidžių/žodžių dažnumus ir papaišyti tekstinį grafikėlį.</li>
  <li>Parašyti paprastą suspaudimo programėlę (LZW ir RLE algoritmai jau pasirinki).</li>
  <li>Paprastas kokios nors kalbos sintaksės išryškinimas (išvedimas HTMLu).</li>
  <li>Paprastas kokios nors kalbos sintaksės išryškinimas (išvedimas tekstu su ANSI spalvų kodais).</li>
  <li>Spręsti kvadratinę lygtį ax<sup>2</sup>+bx+c=0 (pradiniame faile koeficientai a, b, c).</li>
  <li>Lygiuoti tekstą, kad dešinys kraštas būtų lygus (įterpiant kur reikia tarpus).</li>
  <li>Tekstiniame faile pakeisti kai kurios žodžius į kitus žodžius (antrajame faile nurodyti pakeitimai).</li>
  <li>Iš failo išrinkti žodžius, kurie pasikartoja daugiau nei N kartų, ir surašyti į kitą failą.</li>
  <li>Papaišyti Mandelbroto aibę tekstiniais simboliais.</li>
  <li>Tvarkingai išmėtyti/sudėlioti tarpus tekste (kad po kabelio būtų, prieš
  kablelį nebūtų, skliaustų viduje nebūtų, išorėje būtų, bet tik jei neseka
  skyrybos ženklas ir pan.)</li>
  <li>Daryti tą patį kokiai nors programavimo kalbai (pvz. Python ;-)</li>
  <li>Iš WWW serverio log failo išrinkti dažniausiai pasitaikančius IP adresus.</li>
</ul>

<p class="">Nesirinkite užduoties, kuri jau yra <a href="students#taken1">pasirinkta</a>.</p>

<p><strong>Antroji užduotis</strong>.  <!--Praeitais metais tai buvo programėlė,
kuri iš internetinio puslapio (HTML/XML) krapšto informaciją ir ją apdoroja.--></p>

<p>Siūlau tokią temą: mažas tekstinis nuotykinis žaidimukas (interactive
fiction/MUD).  Komandų eilutėje įvedate veiksmus ("go north" arba "paimti
akmenį"), nedidukas pasaulio modelis jos vykdo.</p>

<p>Arba dar viena mintis: geometrija/grafika.  Pvz., tekstiniame
faile aprašytos geometrinės figūros, kurias reikia pavaizduoti ekrane
grafiškai.  Arba išspręsti kokią geometrinę užduotėlę.</p>

<p>Mano tikslai šiai užduotėlei: noriu, kad apsirašytumėte porą
klasių, modeliuojančių kažkokius pasaulio objektus.</p>

<p class="">Nesirinkite užduoties, kuri jau yra <a href="students#taken2">pasirinkta</a>.</p>

<p><strong>Trečioji užduotis</strong>.  Visų reikalavimų dar nesugalvojau (tai
reiškia, kad galite sąlygą susigalvoti patys), bet norėsiu unit testų.</p>

<p>Mano tikslai šiai užduotėlei: noriu, kad pasitreniruotumėte
rašyti testus; stipriai rekomenduoju Test-Driven Developmentą.</p>

<p>Galima (bet nebūtina) atiskaitinėti tą pačią pirmąją ar antrąją
užduotėlę, pridėjus jai testus.  Tokiu atveju lengviau bus, jei kodą rašysite
iš naujo, naudodami <em>testai pirma</em> metodiką, egzistuojantį kodą
naudodami tik kaip prototipą.  Bus įdomu palyginti kodo, rašyto be testų, ir
kodo, rašyto testai pirma būdu, kokybę.</p>

<p class="">Nesirinkite užduoties, kuri jau yra <a href="students#taken3">pasirinkta</a>.</p>

<p><strong>Projektas</strong>.  Vietoje trijų mažų programėlių galima
rašyti vieną didelę.  Reikalavimai:
</p>
<ul>
  <li>Programa turi turėti grafinę vartotojo sąsają (GUI) arba būti tinklo
      serveris, leidžiantis prisijungti keliems vartotojams lygiagrečiai.</li>
  <li>Ji turėtų daryti ką nors naudingo/įdomaus.</li>
  <li>Ji turėtų turėti unit testus.</li>
</ul>

<p>Pavyzdys: mp3 serveris -- galima prisijungti prie jo per telnetą (arba per
webinį interfeisą), ieškoti dainų pagal failo pavadinimą ir/arba ID3 atributus,
peržiūrinėti dainų sąrašą, pridėdinėti dainas į playlistą ir jas groti (galima
paleisti mpg123 su os.system).</p>

<p>Pavyzdys: grafinė programa laiko žymėjimui -- vartotojas pasižymi, kada
pradeda, ir kada baigia daryti tam tikrą užduotį ir gali pasiųsti dienos ar
savaitės darbų ataskaitą emailu.</p>

<p>Pavyzdys: MagicPoint -&gt; PDF konverteris.  MagicPoint yra įrankis, kuriuo
aš rengiu skaidres paskaitoms.  MagicPoint skaidrės aprašomos tekstiniame
faile labai paprastu formatu.  PDFų generacijai apsimoka naudoti Reportlab
biblioteką.  Nei GUI nei tinklo čia nėra -- bet PDFą galima laikyti kaip ir
GUI... programa tikrai bus pakankamai sudėtinga.</p>

<!-- Manau, kad programa turėtų būti 500-1000 eilučių dydžio -->

<p class="">Nesirinkite užduoties, kuri jau yra <a href="students#takenP">pasirinkta</a>.</p>

<h3 id="literature">Literatūra</h3>

<ul>
  <li><a href="http://docs.python.org/tut/tut.html">Python Tutorial</a> --
      įžanga.</li>
  <li><a href="http://diveintopython.org/index.html">Dive into Python</a>
      -- knyga patyrusiems programuotojams.  Galima skaityti online, galima
      parsisiųsti, galima nusipirkti popierinį variantą.</li>
  <li><a href="http://www.oreilly.com/catalog/lpython2/">Learning Python</a>
      O'Reilly knyga.  Skaityti online nepavyks.</li>
  <li><a href="http://www.python.org/peps/pep-0008.html">PEP 8</a>
      gero Python stiliaus rekomendacijos.</li>
</ul>

<p>Python kalbos interpretatorių įvairioms operacinėms sistemoms galite rasti
<a href="http://www.python.org/">www.python.org</a>.  Daugelyje Linux
distribucijų bei naujesnėse Mac OS X versijose Python interpretatorius ateina
su operacine sistema ir jo atskirai siųstis nereikia.</p>

<h3 id="intro">Įžanga</h3>

<p>Python -- dinaminė aukšto lygio programavimo kalba.  Python yra griežtai
tipizuota (neturi typecastų), bet nėra statiškai tipizuota (tipus turi ne
kintamieji, o reikšmės).   Python leidžia naudoti struktūrinio, objektinio,
bendro (generic) bei, šiek tiek, funkcinio programavimo paradigmas.  Python
yra interpretuojama kalba, panašiai kaip Java (programa pirma kompiliuojama
į baitinį kodą, o paskui virtuali mašina tą kodą interpretuoja).  Skirtingai
nuo Java, Pytohn kompiliavimas atliekamas automatiškai, paleidus
interpretatorių.</p>

<p>Štai kaip atrodo trumpa tradicinė Hello, World programėlė:</p>

<blockquote class="example"><pre>
print <span class="string">"Hello, world!"</span>
</pre></blockquote>

<p>Štai kaip atrodo daug rimtesnė tos pačios programėlės versija:</p>

<blockquote class="example"><pre>
<span class="shebang">#!/usr/bin/env python</span>
<span class="comment"># -*- coding: UTF-8 -*-</span>
<span class="docstring">"""
Labas, pasauli.

Demonstracinė programėlė Python kursui.

Autorius -- Marius Gedminas
"""</span>

<span class="def">def</span> <span class="name">main</span>():
<span class="docstring">    """Spausdina ekrane žodžius "Hello, world!"."""</span>
    <span class="keyword">print</span> <span class="string">"Hello, world!"</span>

<span class="keyword">if</span> <span class="name">__name__</span> == <span class="string">"__main__"</span>:
    <span class="name">main</span>()
</pre></blockquote>

<p>Pirmoji eilutė -- specialus komentaras, nurodantis, jog tai yra Python
kalbos skriptas.  Unix šeimos operacinės sistemos pagal šią eilutę
nustato, kokį interpretatorių reikia paleisti.</p>

<p>Antroje eilutėje -- dar vienas specialus komentaras, <a href="http://docs.python.org/ref/encodings.html">nurodantis failo koduotę</a>
(jo reikia, jei faile pasitaiko raidžių, nepatenkančių į US-ASCII).</p>

<p>Trigubomis kabutėmis Pythone apibrėžiamos ilgos simbolių eilutės
(multiline strings).  Tradiciškai tokios eilutės naudojamos dokumentacijai,
analogiškai Javos dokumentaciniams komentarams.  Kiekvieno failo, klasės,
funkcijos pradžioje verta įrašyti dokumentacinę eilutę.  Egzistuoja programų
(pvz., pydoc), kurios iš Pythono programų ištraukia ir gražiai suformatuoja
tokiu pavidalu pateiktą dokumentaciją.</p>

<p>Toliau matome funkcijos <code class="name">main</code> apibrėžimą.  Funkcijos
kūną sudaro visos eilutės, kurios yra pastumtos į dešinę (keturiais
tarpais).  Ši funkcija nieko negražina.</p>

<p>Programos pabaigoje -- idiomatiškas patikrinimas, ar programa yra vykdoma,
ar tik importuojama.  Apie tai detaliau parašysiu vėliau.</p>

<h3 id="lectures">Paskaitos</h3>

<p class="new">Šių metų <a href="slides">skaidrės</a>.</p>

<!--
<p>Taip pat galite pasižvalgyti į <a
  href="2004/index-lt.html#lectures">2004-ųjų metų paskaitų konspektus</a>
HTMLu.</p>
  -->

<h3>Istorija</h3>

<ul>
  <li><a href="2004/index-lt.html">2004-ųjų metų medžiaga.</a></li>
  <li><a href="2005/index-lt.html">2005-ųjų metų medžiaga.</a></li>
</ul>
