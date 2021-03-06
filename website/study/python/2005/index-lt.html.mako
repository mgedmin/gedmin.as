<%inherit file="_templates/site.mako" />
<%def name="title()">Programavimo kalba Python (2005)</%def>
<%def name="short_title()">2005</%def>

<h2>Programavimo kalba Python</h2>

% if False:
<div style="border: 1px dotted red; padding: 1ex; float: right; width: 20em;">
<!--
  Atnaujinta informacija išryškinta <span class="new">raudonai</span>.
  <br /><br />
  <strong>Galutiniai <a href="students">rezultatai</a></strong>
  <br /><br />
  <span class="new">Popierinius žiniaraščius aš jau užpildžiau.  Duomenų bazę laisvai
    pasirenkamiems dalykams pildo studentų skyrius.</span>
-->
  <span class="new">Perlaikymas bus antradienį, vasario 14&nbsp;d., 14 val.
    9-oje kompiuterių klasėje.
    Reikalavimai tie patys kaip ir semestro metu.</span>
</div>
% endif

<h3>2005 m. ruduo</h3>

<p>Laisvai pasirenkamas dalykas, 4 kreditai.</p>

<p>Paskaitos vykdavo antradieniais, 18:00, 301 auditorijoje.</p>

<p>Pratybos vykdavo antradieniais 16:00 val. 4-oje ir 5-oje kompiuterių
klasėse, bei trečiadieniais 14:00 val. 13-oje o kompiuterių klasėje.</p>

<p>Per paskaitas dėsčiau teoriją (žr. <a href="slides">skaidres</a>), per
pratybas priiminėdavau atsiskaitymus.</p>

<p>Visa svarbi informacija turėtų būti surašyta šiame puslapyje</p>

<blockquote>
  <p><a class="good" href="http://gedmin.as/python">http://gedmin.as/python</a></p>
</blockquote>

<h3 id="practice">Atsiskaitymai</h3>

<p>Per pratybas reikės atsiskaityti tris mažas programėles (arba
vieną didelę).  Sąlygas reikia susigalvoti patiems -- aš tik pateiksiu bendrus
reikalavimus, tematiką, bei sąlygų pavyzdžius.  Prieš pradėdami jas daryti,
sąlygą parodykite man (el. paštu -- marius@gedmin.as -- arba per pratybas
asmeniškai), kad aš ją patvirtinčiau.  Visos sąlygos turi būti pakankamai
skirtingos (kad du žmonės nedarytų tos pačios užduoties).  Jei sąlygą nusiuntėte
man pašu, o aš per pakankamai greitą laiką (porą dienų) neatsiliepiau, galite
pakartotinai mane krutinti emailu arba tiesiog pradėti ją daryti.  Jei iškyla
problemų su paštu (jūsų siųstas laiškas grįžta), bandykite mano darbo adresą
-- marius@pov.lt.</p>

<p>Deadlainai: viską reikia atsiskaityti <em>iki semestro galo</em>.
Atsižvelkite į tai, kad jūsų daug (85), aš vienas, ir atsiskaitymas užima
laiko (bent 5 minutes).</p>

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

<p><strong>Antroji užduotis</strong>.  Praeitais metais tai buvo programėlė,
kuri iš internetinio puslapio (HTML/XML) krapšto informaciją ir ją apdoroja.</p>

<p>Šiais metais siūlau įdomesnę temą: mažas tekstinis nuotykinis
žaidimukas (interactive fiction/MUD).  Komandų eilutėje įvedate veiksmus ("go
north" arba "paimti akmenį"), nedidukas pasaulio modelis jos vykdo.</p>

<p>Arba dar viena mintis: geometrija/grafika.  Pvz., tekstiniame
faile aprašytos geometrinės figūros, kurias reikia pavaizduoti ekrane
grafiškai.  Arba išspręsti kokią geometrinę užduotėlę.</p>

<p>Mano tikslai šiai užduotėlei: noriu, kad apsirašytumėte porą
klasių, modeliuojančių kažkokius pasaulio objektus.</p>

<p><strong>Trečioji užduotis</strong>.  Visų reikalavimų dar nesugalvojau (tai
reiškia, kad galite sąlygą susigalvoti patys), bet norėsiu unit testų.</p>

<p>Mano tikslai šiai užduotėlei: noriu, kad pasitreniruotumėte
rašyti testus; stipriai rekomenduoju Test-Driven Developmentą.</p>

<p>Galima (bet nebūtina) atiskaitinėti tą pačią pirmąją ar antrąją
užduotėlę, pridėjus jai testus.  Tokiu atveju lengviau bus, jei kodą rašysite
iš naujo, naudodami <em>testai pirma</em> metodiką, egzistuojantį kodą
naudodami tik kaip prototipą.  Bus įdomu palyginti kodo, rašyto be testų, ir
kodo, rašyto testai pirma būdu, kokybę.</p>

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

<p>Šių metų <a href="slides">skaidrės</a> (PDFai bei MagicPoint pradiniai
failai).</p>

<p>Taip pat galite pasižvalgyti į <a href="../2004/index-lt.html#lectures">praėjusių metų paskaitų konspektus</a>
HTMLu.</p>

<h3>Istorija</h3>

<ul>
  <li><a href="../2004/index-lt.html">Praėjusių metų medžiaga.</a></li>
</ul>
