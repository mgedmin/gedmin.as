<%inherit file="_templates/site.mako" />
<%def name="title()">ACM studentų programavimo varžybos</%def>
<%def name="short_title()">ICPC</%def>

<div class="news toolbox shadow"><div class="inner">
Svarbios nuorodos: <!--<a href="#practice">užsiėmimai</a>,-->
<a class="good" href="seminaras">automatizuota testavimo sistema</a>, <a href="algorithms/index-lt.html">algoritmų konspektas</a>.
</div></div>

<h2>ACM studentų programavimo varžybos</h2>

% if False:
<div style="padding: 1ex; border: 1px dotted red; margin-right: 20em; margin-bottom: 1ex; ">

     <strong>2006-11-08 seminaro nebus (sergu)</strong>

<!--

  <br />

  Rinktis reikia 15 val. MIF foje.

  <br />

  Norintys dalyvauti registruokitės paštu: <a
    href="mailto:marius@gedmin.as?Subject=[icpc]+Atranka">marius@gedmin.as</a>.
     <div style="text-align: right">
       2006-10-18
     </div>
  -->
<!--
   <a href="http://mif.vu.lt/icpc/seminaras2006r">Testavimo sistema 2006 m. rudens semestrui</a> jau parengta.
     <div style="text-align: right">
       2006-09-06
     </div>
-->
</div>
% endif

<div style="float:right; padding-left: 3em; padding-bottom: 1em; font-size: small; text-align: center; color: #888">
  <img src="${bf.config.site.url}/about/mugshot2.jpg" alt="Mano nuotrauka" />
  <br />Taip atrodo dėstytojas
  <br /><span style="font-size: xx-small">(tik kostiumo nesitikėkite)</span>
</div>

<p> <a title="Association for Computing Machinery" href="http://www.acm.org/">ACM</a> kasmet organizuoja tarptautinį studentų
programavimo <a href="http://icpc.baylor.edu/icpc/">konkursą</a> (ICPC —
International Collegiate Programming Contest).  Mūsų regiono ketvirtfinalis
vyksta <a href="http://www.fpmi.bsu.by/acmicpc">Minske</a>, pusfinalis <a href="http://neerc.ifmo.ru/">Sankt-Peterburge</a>, na o finalas kur nors anapus
vandenyno. </p>

<p> Vilniaus Universiteto komandos šiose varžybose dalyvauja nuo 2000 m.
Kiekvienais metais viena VU komanda išeidavo į pusfinalį, tačiau iki finalo
šiek tiek pritrūkdavo. </p>

<p>Varžybų forma: trys studentai prie vieno kompiuterio per penkias valandas
turi išspręsti aštuonias-devynias užduotis.  Programuoti galima C, C++, Java
kalbomis.  Vertinimo pagrindą sudaro teisingai išspręstų užduočių skaičius
(užduotis laikoma išspręsta teisingai, jei su visais organizatorių parengtais
testais programa duoda teisingą atsakymą, t.y.  vertinimas yra „viskas arba
nieko“, skirtingai nuo moksleivių informatikos olimpiadų).  Išspręstą užduotį
galima siųsti testavimui iškart ir po kelių minučių sulaukti atsakymo (šiek
tiek detalesnio nei pavyko/nepavyko).  Testų dalyviai negauna.  Kiekvienam
testui uždedamas kelių sekundžių veikimo laiko limitas.</p>

<p>Nuo 2003 m. pavasario semestro doc. V. Tumasonis organizuoja
algoritmavimo seminarą, per kurį tikimės geriau pasiruošti artėjančiam
konkursui.  2006 m. rudenį seminaras vyko trečiadienais 16-18 val. VU
kompiuterių laboratorijoje, 10, 11 klasėse.  Jį vedžiau aš. </p>

<p>Treniruočių esmė -- užduočių sprendimas.  Esu sukūręs <a class="good" href="seminaras">automatizuotą testavimo sistemą</a>, kurioje galite
užsiregistruoti, pasirinkti užduotį, gauti jos sąlygą, nusiųsti savo sprendimą
ir sužinoti, ar jis teisingas.  Man būtų patogiau, jei registruodamiesi
nurodytumėte savo tikrą vardą ir pavardę, ir kaip vartotojo vardą įrašytumėte
savo fakultetinį userneimą (pvz., mage0389).  Fakultetinio slaptažodžio
įvedinėti, žinoma, nereikia.</p>

<!--
<p><strong>2006 m. rudeniui turiu naują rinkinį užduočių, bet dar sistemos
  neparengiau.</strong></p>
  -->

<p>Seminaro metu aš galiu pašnekėti apie įvairius <a href="algorithms/index-lt.html">algoritmus</a>, praverčiančius užduočių
sprendimui.</p>

<p>Rekomenduoju užsirašyti į <a href="http://groups.google.com/group/vu-icpc">pašto
  konferenciją</a> (mailing list) -- ten siųsiu svarbius pranešimus (pvz.,
„rytoj pratybų nebus“).  Taip pat visa svarbi informacija bus skelbiama šiame puslapyje,
kurio trumpas adresas -- <a class="good" href="http://gedmin.as/icpc">http://gedmin.as/icpc</a>.</p>

<!--
<p>Kadangi aš labai neturiu laiko, būčiau dėkingas, jei rastumėte kitų konkursų
užduočių su testais.  Galėčiau jas įtraukti į testavimo sistemą bei pratybų
metu pasvarstyti apie sprendimo būdus.</p>
  -->

<h3> Nuorodos </h3>

<ul>

<li> <a href="http://groups.google.com/group/vu-icpc">Pašto konferencija (naujoji)</a> </li>

<li> <a href="http://ieva.mif.vu.lt/mailman/listinfo/icpc">Senoji pašto
konferencija</a> </li>

<li> <a href="http://ieva.mif.vu.lt/pipermail/icpc/">Senosios pašto
konferencijos archyvai</a> </li>

<li> <a href="http://icpc.baylor.edu/past/PastProblems.html">Užduočių
archyvas</a>. </li>

<!-- broken link
<li> <a href="http://csc.smsu.edu/~rcjudge/potw/probindex.html">Užduočių
pavyzdžių archyvas</a>. </li>
-->

<li> <a href="http://csc.missouristate.edu/~mcpc/potw/probindex.html">Dar
  vienas užduočių archyvas</a>. </li>

<li> <a href="algorithms/index-lt.html">Algoritmų
  konspektas</a> </li>

<li> <a class="good" href="seminaras">Automatizuota testavimo
  sistema</a> </li>

</ul>

<h3> Rekomenduojama literatūra </h3>

<ul class="bibliography">

<li> <span class="author">Thomas H. Cormen, Charles E. Leiserson, and Ronald L.
Rivest</span>.  <em class="title">Introduction to Algorithms</em>.  <span class="publisher">MIT Press, 1990</span>.  „Mokslo knygose“ galima nusipirkti
rusišką vertimą už 106 Lt. — <span class="author">Т. Кормен, Ч. Лейзерсон, Р.
Ривест</span>.  <em class="title">Алгоритмы: построение и анализ</em>. <span class="publisher">МЦНМО, Москва, 2001</span>.  Internete įmanoma rasti pilną
knygą HTMLais su paveiksliukais.  Knyga tikrai gera: per keturis studijų VU
metus iš informatikos nesužinojau nieko, ko nebuvau anksčiau skaitęs toje
knygoje.  Matemantinė analizė nesiskaito. <tt class="smiley">:-)</tt> </li>

</ul>

<!--
<h3>Praktiniai patarimai</h3>

<p>
11, 12 klasėse yra nelabai gerai sukonfigūruotas Linuxas.  Norėdami atsidaryti
PDF failą Mozilloje spustelėkite ant jo ir pasirinkite <em>Open using an
application</em>.  Tuomet spauskite <em>Choose</em> ir įveskite
<tt>/usr/bin/X11/gv</tt> ir porą kartų Enter.
</p>

<p>
Paskalio kompiliatorius vadinasi <tt>fpc</tt> (Free Pascal Compiler).
Kompiliavimas bei paleidimas atrodo taip:
</p>
<blockquote class="example"><pre>
fpc -g -gl <em>programa.pas</em>
./<em>programa</em>
</pre></blockquote>

<p>
Taip pat yra Borland Paskalį primenanti programavimo aplinka RHIDE.  Norėdami
ją paleisti rinkite <tt>rhide</tt>.  Norėdami kompiliuoti Paskalio programas,
nueikite į <em>Options, Environment, Preferences</em> ir padėkite kryžiuką ties
<em>Use FPC pascal compiler</em>.  Jei norite programas dar ir derinti
(„debugginti“), <em>Options, Compiler, Pascal-Flags</em> įjunkite <em>-g</em>.
O jei įjungsite ne tik <tt>-g</tt>, bet ir <tt>-gl</tt>, tuomet įvykus
klaidai pamatysite ir eilučių numerius.
</p>

<p>Praktika rodo, kad iš RHIDE kaip iš debuggerio naudos nedaug.  Yra kitų
debugerių: ddd, xgdb, gdb.  Man asmeniškai pakanka GVim bei reikiamose
vietose prikaišiotų WriteLn iškvietimų.</p>

<p>C bei C++ programos kompiliuojamos taip:</p>
<blockquote class="example"><pre>
gcc -Wall -g -o <em>programa</em> <em>programa.c</em>
g++ -Wall -g -o <em>programa</em> <em>programa.cpp</em>
</pre></blockquote>
-->

<h3 id="practice">Užsiėmimai</h3>

<p>Spalio 10 d. (antradienį) vyko <a href="atranka2006">atrankinės varžybos
    į ACM ICPC ketvirtfinalį</a>.  <a href="http://lausks.linux.edu.lv/standings_3.html">Galutiniai
    rezultatai</a>.
</p>

<!--

<p>Planai šiam semestrui:</p>
<ul>
  <li> atnaujinti užduočių repertuarą automatizuotoje testavimo sistemoje </li>
  <li> seminaro metu prie lentos padėstyti algoritmus </li>
  <li> gegužės mėnesį surengti varžybas, kad būtų įdomiau (gal pavyktų
       surasti ir sponsorių su prizais?) </li>
</ul>

<dl class="news">

  <dt>2006-02-08</dt>
  <dd>Sukūriau naują pašto konferenciją (Google Groups), nes senoji labai
  stabdė.</dd>

  <dt>2006-02-22</dt>
  <dd>Pašnekėjau apie <a href="algorithms/dynamic-programming">dinaminį programavimą</a>.
  </dd>

</dl>

-->
<!--

<p>Kviečiu visus (ar bent jau aktyvesniuosius) peržvelgti užduočių archyvus
bei pasiųsti man nuorodas į patikusias užduotis — tuomet galėsiu atspausdinti
po kelias kopijas ir kitą paskaitą jas panagrinėti.</p>

<p>Jei išsprendžiate kokį nors uždavinį, <a class="good"
href="seminaras">atsiųskite man sprendimą</a> (programos source tekstą).
</p>
-->

<h3 id="practice">Istorija</h3>

<p><a href="2003a/index-lt.html">2003 m. pavasario semestro užsiemimų istorija (bei uždavinių
sąlygos)</a>.</p>
<p><a href="2003b/index-lt.html">2003 m. rudens semestro užsiemimų istorija (bei uždavinių
sąlygos)</a>.</p>
<p><a href="2004a/index-lt.html">2004 m. pavasario semestro užsiemimų istorija (bei uždavinių
sąlygos)</a>.</p>
<p><a href="2004b/index-lt.html">2004 m. rudens semestro užsiemimų istorija</a>.</p>

<p>2005 m. užsiemimai vyko, bet naujų užduočių neatsirado ir detalios istorijos
nėra.</p>
