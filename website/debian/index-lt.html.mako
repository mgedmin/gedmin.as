<%inherit file="_templates/site.mako" />
<%def name="title()">Debian puslapis</%def>
<%def name="short_title()">Debian</%def>

<h2>Turinys</h2>

<ol>
<li><a href="#news">Naujienos</a></li>
<li><a href="#whatisit">Kas yra Debian</a></li>
<li><a href="#intro">Ilga įžanga</a></li>
<li><a href="#whydebian">Kodėl man taip patinka Debianas?</a></li>
<li><a href="#nothingperfect">Tobulybė nepasiekiama</a></li>
<li><a href="#foryou">Ar Debianas Jums?</a></li>
</ol>

<h2><a id="news">Naujienos</a></h2>

<dl class="news">
<dt>2008-10-29</dt>
<dd>Pataisiau neveikiančias nuorodas.</dd>

<dt>2002-07-25</dt>
<dd>Pora smulkių pataisymų.</dd>

<dt>2002-05-04</dt>
<dd>
Patikrinta rašyba.  Gramatikos klaidos ir baisūs žargonizmai kol kas nejudinti
-- reikia egzaminui ruoštis.
</dd>

<dt>2002-05-03</dt>
<dd>
Šis puslapis sukurtas.  Jaučiuosi per daug pavargęs net perskaityti ir
patikrinti rašybą.  Pamailinkit man, jei rasit klaidų.
</dd>

</dl>

<h2><a id="whatisit">Kas yra Debian</a></h2>
<p><a href="http://www.debian.org/">Debian GNU/Linux</a> - man
labiausiai patinkanti operacinė sistema.  Šiame puslapyje pabandysiu
paaiškinti, kodėl taip yra.</p>

<h2><a id="intro">Ilga įžanga</a></h2>
<p>Mano pažintis su kompiuteriais prasidėjo nuo MS-DOS.  Vėliau
atsirado ir Windows 95.  Kažkur tuo metu man į rankas pateko dvi knygos apie
Unix operacinę sistemą.  Perskaitęs jas likau sužavėtas.  Galios,
elegantiškumo, paprastumo.  Kitaip tariant, <a href="http://en.wikipedia.org/wiki/Unix_philosophy">Unix
filosofijos</a>.  Supratau, jog <em>viskas</em>, kas man patiko MS-DOSe, tėra
menki Unix atspindžiai.  Kiek vėliau man į rankas pakliuvo <a href="http://catb.org/jargon/">Žargono failas</a>, kurį „prarijau“
su dideliu malonumu.  Sužinojau, kas yra <a href="http://catb.org/esr/writings/hacker-history/">hakeriai</a>
(nemaišykite su tais mažvaikiais <a href="http://catb.org/jargon/html/C/cracker.html">H4x0rAiS</a>,
kurie taip pat save mėgsta vadinti "hakeriais") ir panorau tokiu tapti.
Skaitydamas <a href="http://catb.org/esr/writings/hacker-history/">How To
Become A Hacker</a> radau ten patarimą išbandyti Linuxą ar kokį kitą laisvą
Unix kloną.</p>

<p>1997 m. pabaigoje galų gale pasiryžau.  Parsipūčiau Slackware 3.4
(ar tai 3.2) instaliacinius diskelius ir visą naktį su jais žaidžiau shelle
po katalogus nardydamas ir ls spalvotais rašmenimis besidžiaugdamas (likusių
diskelių su pačiais paketais dar neturėjau -- dialupas... tėvas man juos darbe
siuntė).  Kitą rytą išvažiavau į Keiptauną, į tarptautinę moksleivių
informatikos olimpiadą, bet iškart grįžęs tęsiau instaliaciją ir visa kita.  Iš
pradžių taip gyvenau su Slackwaru 340 Mb dydžio diske savo 66 MHz 486tuke su 16
MB atminties.  Vėliau atsisiunčiau iš Amerikos 7 Linuxo CD kolekciją
(Cheap*Bytes), kur buvo Slackware 3.4, Red Hat 5.0, Debian 1.3 2 CD (binary ir
source) bei trys diskai Linuxinio softo iš įvairių FTP archyvų.  Gavęs naują
kietą diską sumaniau išbandyti Red Hatą.  Jis man patiko kiek labiau nei
Slackware.  Ilgai ilgai gyvenau su Red Hatu, tada išbandžiau Mandreiką 6.0 ar
tai 6.1 ir netrukus peršokau.  Ilgą laiką sėkmingai naudojau Mandrake 7.1
desktope bei silpname noutbukėlyje (Pentium 75, 40 MB RAM, 1.2 GB hdd).</p>

<p>Tuo metu Linuxe jau buvau ne naujokas ir buvau susidaręs įspūdį, jog
Linux vartotojai laikui bėgant migruoja į Debianą, o po to -- į FreeBSD.  Dėl
BSD aš abejojau (ir dabar dar abejoju), bet buvau nusprendęs kad ugnies be dūmų
nebūna ir kad aš kada nors pereisiu prie Debiano.</p>

<p>Kartą išbandžiau.  Šiaip ne taip susidorojęs su Debian 2.1
instaliacijos procesu buvau smarkiai nepatenkintas ir grįžau atgal prie
Mandrake.  Beje, tuo metu buvau vargšas dialuperis ir viską dariau iš CD.</p>

<p>2001 pavasaris.  Grįžau iš studijų Danijoje.  Nusprendžiau pastatyti
savo seną 486tuką kaip routerį Internetui (kurį pavyko prieš išvažiuojant
įsitaisyti).  Pagalvojau, kodėl gi man neišbandžius Debiano?  Atsipūčiau ir
išsikepiau visus tris Debian 2.2 kompaktus, instaliavau sistemą (vėl nebuvau
ypatingai instaliacija sužavėtas, bet šį kartą ištvėriau), pradėjau žvalgytis.
Buvau sužavėtas.  Po mėnesio nebeištvėriau ir susiinstaliavau Debianą savo
desktope (iš tu pačių CD, tik paskui per klaidą per tinklą pasiupgradinau iki
unstable vietoje testing).  Taigi, šiandien Debianą naudoju jau virš metų --
tiek namie, tiek ir darbe, kur tenka perpus dalintis sysadmino pareigas 10-čiai
workstationų bei 3 serveriams, o taip pat prižiūriu kelis draugų ir pažįstamu
Linuxinius serveriukus.</p>

<h2><a id="whydebian">Kodėl man taip patinka Debianas?</a></h2>
<p>Pasistengsiu išdėstyti, kuo gi man Debianas taip patiko.</p>

<ul>
<li> <em>Paketų instaliacija.</em>  Užsimanai išbandyti kokią nors programą <em>foo</em>
     -- renki apt-get install foo ir po keliasdešimties sekundžių turi ją savo
     kompiuteryje.  Jokių klaidžiojimų po kompaktus/webą/ftp saitus.  Daugiau
     nei 10&nbsp;000 paketų, kurie visi pritaikyti Debian sistemai.  Žinoma, tam
     reikia turėti padorią Interneto liniją.</li>
<li> <em>Upgreidai.</em>  Atsimenu, kiek aš laiko atidėliojau Mandrake 7.1
     -&gt; 7.2 perėjimą, nes reikėjo dėl to perkraudinėti kompiuterį, iš naujo
     pereidinėti bent trečdalį instaliacijos proceso ir t.t.  Ir skaityti
     baisius įspėjimus "BACK UP YOUR DATA BEFORE CONTINUING".  Prieš tai dariau
     keletą Red Hat/Mandrake upgreidų.  Nors procesas nėra labai sunkus, bet
     kažkodėl dažnai jo kartoti nesinori.   O Debiane -- apt-get update;
     apt-get dist-upgrade ir po 300 Mb downloadinimo mano kompiuteryje buvo
     nebe Potato, o unstable.</li>
<li> <em>Tvarka.</em> Slackware tvarką daro adminas, jei jis jos nedarys
     ir sunkiu darbu nepalaikys -- tvarkos ir nebus.  Red Hate jau šiek tiek
     geriau, bet ir ten skriptų magijos gilios ir klaidžios ir panašiai.
     Debiane viskas spindi.  Sėdėdamas prie Debiano aš jaučiu, kad tai ne šiaip
     sau kažkoks Linuxas, kuriame sumesti kaip pakliuvo N paketų.  Čia
     kiekvienas paketas orientuojasi į tas pačias taisykles, kurios išrašytos
     Debian Policy dokumente.  Čia viskas griežtai sudėliota pagal Filesystem
     Hierarchy Standard.  Skriptų magija negili, permatoma ir viską apimanti.
     Ko verta kad ir alternatyvų sistema -- pvz., adminas gali pasirinkti,
     kuris iš instaliuotų paketų realizuos /bin/vi symlinką.  (Beje, RedHat
     neseniai nusprendė nukopijuoti Debiano alternatyvų sistemą.)  Arba dpkg
     diversijos -- vieni paketai (arba sysadminas) gali pervadinti kito paketo
     failą, todėl pas mane pastovūs X'ų upgreidai neoverwritina
     /usr/X11R6/lib/X11/locale/iso8859-13/Compose failiuko.  Arba dpkg paketų
     duomenų bazė -- viskas dviejuose tekstiniuose failuose.  Greitis dėl to
     nukenčia, bet užtat galima naudoti standartinius Unixinius toolsus (kas
     man ne kartą pravertė).  RPMas greitesnis, bet kai iš kitos sistemos
     prisimountinęs particiją pasieki dvejetainę duombazę iš jos būna
     absoliutus nulis naudos.</li>
<li> <em>Vientisumas.</em> Debianas -- ne šiaip sau programų rinkinys.  Tai
     vieninga sistema.  Tai pirmoji Linux distribucija, kurioje aš pajutau tokį
     vieningumą.  Vieningas policy dokumentas, vieningą ir lengvai pasiekiama
     bug tracking sistema (beje, jei norint reportinti bugą reikia pasileisti
     web browserį -- tokia sistema man nėra lengvai pasiekiama), vieningi
     README.Debian.gz failiukai /usr/share/doc/paketo-vardas/ kataloguose.
     11 palaikomų architektūrų!</li>
<li> <em>Patogumas.</em> Iš vieningos tvarkos išplaukia patogumas.  Man
     nereikia atsiminti, kokį signalą siųsti ar kokią programą su kokiais
     parametrais reikia paleisti pakeitus kažkokio daemono konfigūracijos
     failą.  Aš tiesiog darau /etc/init.d/daemonas reload.  Man nereikia
     aiškintis, kaip kompiliuoti NVidijos draiverius ir kokias OpenGL
     bibliotekas išmetinėti, kad jos nesimaišytų ir kažkokiais būdai išvengti
     visiškos painiavos per kitą sistemos upgreidą -- tam yra Debian paketas.
     Yra paketas kernelio kompiliavimui ir instaliavimui.  Yra paketas Real
     Playerio downloadui ir instaliavimui.  Yra paketas Audiogalaxy satelitui.
     Yra paketas Quake ][ shareware duomenų downloadui ir instaliavimui.
     Bet patogiausia, vis dėlto, apt-get.  Kai man atsibosta kovoti su exim
     pašto serverio konfigūracija, vienu apt-get installu aš jį pakeičiu
     postfixu.</li>
<li> <em>Ideologija.</em> Debianas yra laisviausia iš Linux distribucijų.
     Open Source Definicija parengta pagal Debiano Free Software Guidelines.
     Debian projektas turi savo konstituciją.  Vyksta demokratiniai projekto
     lyderio rinkimai.  Debianą įtakoja ne marketingo sprendimai, o jo
     developeriai -- žmonės, kurie nori sau ir kitiems Linuxistams pagerinti
     gyvenimą.  Matydamas Debianą šiandiena aš tikiuosi, jog jis ir toliau
     eis ta pačia kryptimi.</li>
</ul>

<h2><a id="nothingperfect">Tobulybė nepasiekiama</a></h2>
<p> Debianas ne be trūkumų.  Pvz., senas jo paketų pasirinkimo
interfeisas (dselect) man „vėžį varo“.  Hardware konfigūracija per mažai
automatizuota (tiksliau, visa automatizacija paslėpta mažai reklamuojamuose
paketuose).  Nėra kažkokios centrinės vietos (kokio setupo/control panelio),
tad tenka reikiamas komandas/failus susirasti pačiam.  Kartais sunku pasirinkti
vieną iš kelių alternatyvių paketų (pvz., POP3 serverį).  Stabilios versijos
išleidžiamos gana retai, o nestabilių „betų“ ne visada norisi.</p>

<h2><a id="foryou">Ar Debianas Jums?</a></h2>
<p> Atsakymas -- nežinau.  Tačiau jei jūs norite kažko Unixiško, o ne
kokio nors Windowsų pakaitalo, jei esate patyręs
vartotojas/programuotojas/sysadminas, jei esate tingus ir trokštate patogumo,
jei nebijote pradinio instaliacijos bei konfigūracijos slenksčio, jei turite
neribotą priėjimą prie Interneto, tuomet išbandykite Debian.</p>
