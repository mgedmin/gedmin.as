<%inherit file="_templates/site.mako" />
<%def name="title()">Programavimo kalba Python (2004)</%def>
<%def name="short_title()">2004</%def>

<h2>Programavimo kalba Python (2004)</h2>

<h3>2004 m. ruduo</h3>

<p>Laisvai pasirenkamas dalykas, 4 kreditai, įskaita.</p>

<p>Paskaitos vyko pirmadieniais, 18:45 -- 20:15, 102 auditorijoje.</p>

<p>Pratybos vyko antradieniais, 17:00 -- 18:30 ir 18:45 -- 20:15, 2 ir 3 kompiuterių
klasėse.</p>

<p>Per paskaitas dėsčiau teoriją, per pratybas priiminėjau atsiskaitymus bei
užsiimdavau konsultacijomis.  (Pirmosios pratybos, per kurias šnekėjau apie
teoriją, buvo išimtis.)</p>

<p><strong>Sausio 11 d., 11 val. buvo papildomas atsiskaitymas bei įskaitų
  pasirašymas.</strong></p>

<p>Visa svarbi informacija turėtų būti surašyta šiame puslapyje</p>

<blockquote>
  <p><a class="good" href="http://gedmin.as/python">http://gedmin.as/python</a></p>
</blockquote>

<h3 id="practice">Atsiskaitymai</h3>

<p>Per pratybas reikės atsiskaityti tris mažas programėles (arba
vieną didelę).  Galite siųsti man (marius@gedmin.as) savo sugalvotas užduočių
sąlygas -- aš jas gal kiek pakoreguosiu ir galėsite daryti tai, kas jums
įdomu.</p>

<p>Per pirmąsias pratybas pasiūliau mini-užduotėlę apšilimui: parašyti
supaprastintą Unix komandos <code>grep</code> versiją.  Programa turi skaityti
iš pradinio failo eilutes ir visas jas, kuriose yra tam tikras žodis,
spausdinti ekrane (arba rašyti į kitą failą).</p>

<p><strong>Pirmoji užduotis</strong>.  Parašyti programą, kuri apdoroja
tekstinį failą (ar kelis failus).  Pavyzdžiui, programa galėtų skaičiuoti
raidžių dažnumus, išrinkti dažniausiai pasitaikančius žodžius, palyginti du
failus pažodžiui (kaip GNU wdiff), atlikti kokius skaičiavimus su duomenimis,
perskaitytais iš CSV formato failų.  Tikslią sąlygą reikia susigalvoti ir
pasiųsti man <a href="mailto:marius@gedmin.as">paštu</a>.</p>

<!-- Manau, kad programa turėtų būti 50-100 eilučių dydžio -->

<p><strong>Antroji užduotis</strong>.  Parašyti programą, kuri iš internetinio
puslapio (HTMLo arba XMLo) iškrapštytų informaciją ir ką nors su ja
padarytų.  Pavyzdžiui, programa galėtų atlikti paiešką Google pagal komandų
eilutėje nurodytus žodžius ir išspausdinti sąrašą nuorodų iš pirmų dviejų
puslapių.  Arba programa galėtų pasižiūrėti, koks Vilniuje yra oras iš
weather.com duomenų.  Arba surasti, kas ir kada paskutinis pasiuntė laišką į
mailing listą pagal webe esančius archyvus.  Tikslią sąlygą reikia susigalvoti
ir pasiųsti man <a href="mailto:marius@gedmin.as">paštu</a>.  Norėčiau, kad
programa būtų objektinė, t.y. kad joje būtų aprašyta pora klasių.</p>

<p><strong>Trečioji užduotis</strong>.  Visų reikalavimų dar nesugalvojau (tai
reiškia, kad galite sąlygą susigalvoti patys), bet norėsiu unit testų.</p>

<p>Alternatyva: įskaitai galima atsiskaityti dvi užduotis ir sausio 11 d.
išlaikyti testuką (~10-20 klausimų, demonstruojančių principines Python
žinias; žr. <a href="lecture8/index-lt.html">temų sąrašą</a>).</p>

<p><strong>Projektas</strong>.  Vietoje trijų mažų programėlių galima
rašyti vieną didelę.  Reikalavimai:
</p>
<ul>
  <li>Programa turi turėti grafinę vartotojo sąsają (GUI) arba būti tinklo
      serveris, leidžiantis prisijungti keliems vartotojams lygiagrečiai.</li>
  <li>Ji turėtų daryti ką nors naudingo.</li>
  <li>Ji turėtų turėti unit testus.</li>
</ul>

<p>Pavyzdys: mp3 serveris -- galima prisijungti prie jo per telnetą (arba per
webinį interfeisą), ieškoti dainų pagal failo pavadinimą ir/arba ID3 atributus,
peržiūrinėti dainų sąrašą, pridėdinėti dainas į playlistą ir jas groti (galima
paleisti mpg123 su os.system).</p>

<p>Pavyzdys: grafinė programa laiko žymėjimui -- vartotojas pasižymi, kada
pradeda, ir kada baigia daryti tam tikrą užduotį ir gali pasiųsti dienos ar
savaitės darbų ataskaitą emailu.</p>

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
</ul>

<p>Python kalbos interpretatorių įvairioms operacinėms sistemoms galite rasti
<a href="http://www.python.org/">www.python.org</a>.  Daugelyje Linux
distribucijų bei naujesnėse Mac OS X versijose Python interpretatorius ateina
su operacine sistema ir jo atskirai siųstis nereikia.</p>

<h3 id="intro">Įžanga</h3>

<p>Python -- dinaminė aukšto lygio programavimo kalba.  Python yra griežtai
tipizuota (neturi typecastų), bet nėra statiškai tipizuota (tipus turi ne
kintamieji, o reikšmės).   Python leidžia naudoti struktūrinio, objektinio,
bendro (generic) bei, šiek tiek, funkcinio programavimo paradigmas).  Python
yra interpretuojama kalba, panašiai kaip Java (programa pirma kompiliuojama
į baitinį kodą, o paskui virtuali mašina tą kodą interpretuoja).  Skirtingai
nuo Java, Pytohne kompiliavimas atliekamas automatiškai, paleidus
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

<ol>
  <li><a href="lecture1/index-lt.html">Trumpa sintaksės apžvalga.</a></li>
  <li><a href="lecture2/index-lt.html">Viskas yra objektai.</a></li>
  <li><a href="lecture3/index-lt.html">Išskirtinės situacijos.  Automatizuotas testavimas.</a></li>
  <li><a href="lecture4/index-lt.html">Standartinės bibliotekos apžvalga.</a></li>
  <li><a href="lecture5/index-lt.html">HTML bei XML apdorojimas.</a></li>
  <li><a href="lecture6/index-lt.html">Gijos.  Iteratoriai bei generatoriai.</a></li>
  <li><a href="lecture7/index-lt.html">Debuginimas bei optimizavimas.</a></li>
  <li><a href="lecture8/index-lt.html">Apžvalga.</a></li>
  <li><a href="lecture9/index-lt.html">Python sprendimai: Zope web aplikacijų serveris</a></li>
</ol>

<p>Dar kalbėjau apie duomenų bazes, ZODB, PyGame, wxPython.</p>

<p>
   <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">
     <img alt="Creative Commons License" style="border-width:0" src="https://licensebuttons.net/l/by-sa/3.0/88x31.png" />
   </a>
   <br />Visa medžiagą galima naudoti pagal
   <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 licenziją</a>.
</p>
