<%inherit file="_templates/site.mako" />
<%def name="title()">IceWM puslapis</%def>
<%def name="short_title()">IceWM</%def>

<div class="news toolbox shadow"><div class="inner">
Šiame puslapyje esanti informacija yra kiek pasenusi.  Kai kurie patchai jau
priimti upstreame, kiti nebeveikia, temą naudoju kitą, vietoje Linkso naudoju
Mozillą, <a href="http://www.icewm.org/">www.icewm.org</a> jau gyva.
</div></div>

<h2>Turinys</h2>

<ol>
<li><a href="#news">Naujienos</a></li>
<li><a href="#history">Kaip aš radau IceWMą</a></li>
<li><a href="#life">Kaip aš gyvenu</a></li>
<li><a href="#patches">Mano IceWM patobulinimai</a></li>
<li><a href="#config">Mano IceWM konfigūracija</a></li>
<li><a href="#links">Nuorodos</a></li>
</ol>

<h2><a id="news">Naujienos</a></h2>

<dl class="news">
<dt>2000-06-26</dt>
<dd>
Ištaisyta klaida viename „lope“: <a href="patch-1.0.4.mg.winlist.2">patch-1.0.4.mg.winlist.2</a>: dėl šios klaidos
IceWM'as galėdavo lūžti uždarant langą.
</dd>
<dt>2000-06-25</dt>
<dd>
Šis puslapis sukurtas.
</dd>
</dl>

<h2><a id="history">Kaip aš radau IceWMą</a></h2>

<p>Ilgą laiką aš nenaudojau X Window sistemos.  Priežasčių buvo
kelios - mano video korta (S3 Trio3D) buvo prastai palaikoma, X'ai buvo
nelabai patogūs, be to aš visada buvau linkęs prie klaviatūros ir komandų
eilutės.  Porą kartų išbandžiau KDE bei GNOME, bet nebuvau sužavėtas ir
grįžau į komandų eilutę.  Tačiau kartą <a href="http://freshmeat.net">Freshmeat'e</a> ar kažkur kitur pamačiau IceWM'o
aprašymą ir mane sudomino žodžiai „pelė - nebūtina“.  Nusprendžiau išbandyti
ir IceWM'as mane pavergė.  Užmiršau konsolę ir dabar naudoju vien tik X'us
(tiesa, komandų eilutės neišsižadėjau - X'uose naudoju praktiškai vien tik
xterm'us, tiksliau, <a href="http://www.eterm.org/">Eterm'us</a>).
</p>

<p>
<a href="http://icewm.sourceforge.net">IceWM</a> - tai X Window sistemos
„langų tvarkytojas“ (window manager).  Jo tikslai - greitis ir patogumas,
tačiau išvaizda dėl to per daug nenukenčia.  (O štai Enlightenment'as
prarado tiek greitį, tiek patogumą, siekdamas išvaizdos...).  Tiesa,
standartinė tema atrodo baisokai, bet laimingo atsitiktinumo dėka susidūriau
su <em>blueHeart</em> tema.  Kito laimingo atsitiktinumo dėka mano
kompiuteryje tuo metu nebuvo suinstaliuoti <em>blueHeart</em> temos
naudojami šriftai.  Vėliau smalsumo genamas aš juos susiradau,
susiinstaliavau, pažiūrėjau ir iškart išmečiau.  Išvaizda gal ir graži,
užtat įskaityti nieko neįmanoma.  Dabar gyvenu su šiek tiek pamodifikuota
<em>blueHeart</em> tema (apie tai žr. žemiau).
</p>

<h2><a id="life">Kaip aš gyvenu</a></h2>

<p>Gal užteks šnekėti apie išvaizdą - laikas ją parodyti.  Daugmaž
taip atrodo mano darbastalis:
<br />
<a href="icewm-big.png"><img src="icewm-small.jpg" alt="Mano darbastalis" /></a>
<br />
Fone matote Netscape Navigator'ių, kuris šiaip būna paleistas tik
ypatingomis progomis (kasdieniniam naršymui naudoju <a href="http://artax.karlin.mff.cuni.cz/~mikulas/links/">Links'ą</a>).
Kairėje pusėje - IceWM'o langų sąrašas, dešinėje - Eterm'as, kur aš ką tik
buvau pradėjes rinkti šį puslapį (tekstų redaktorius - <a href="http://www.vim.org/">VIM'as</a>).  Apačioje vienas ant kito sudėti
IceWM taskbar'as ir GNOME Panel'is.
</p>

<p>Beje, laikas būtų įspėti, kad IceWM'as yra labai lankstus.  Tai
kas parodyta šiame puslapyje, yra mano konfigūracija.  Pas jus IceWM'as gali
atrodyti bei elgtis visiškai kitaip.  Be to, aš šiek tiek esu <a href="#patches">pamodifikavęs</a> savo IceWM'ą (tegyvuoja <a href="http://www.opensource.org/">Open Source</a>!).
</p>

<p>Pažvelkime į IceWM'o taskbarą atidžiau:
</p>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td align="left">
<a href="taskbar.png"><img src="taskbar-left.png" alt="Kairė pusė" /></a></td>
<td align="right">
<a href="taskbar.png"><img src="taskbar-right.png" alt="Dešinė pusė" /></a></td></tr>
</table>

<ul>

<li> Kairėje viršuje - tradicinis <em>Start</em> meniu, iškviečiamas
nuspaudus Ctrl+Esc (Win95 klavišus aš naudoju naudingesniems tikslams).
Nelabai naudingas daiktas, bet kartais praverčia.
<br /><img src="startmenu.png" alt="Start meniu" />
</li>

<li> Šiek tiek dešiniau - langų sąrašas.  Bet greičiau yra
išsikviesti atskirą langų sąrašo langelį nuspaudus Win+Esc.
<br /><img src="winlistmenu.png" alt="Langų sąrašo meniu" />
</li>

<li> Dar toliau į dešinę - programų paleidimo mygtukai (aprašomi
<a href="#config">~/.icewm/toolbar faile</a>).  Klaviatūros mylėtojai jų
nenaudos, o spaudys <a href="#config">~/.icewm/keys faile</a> aprašytus
klavišus.  Win+t = Eterm'as, Win+m = Mutt'as.
</li>

<li> Ir dar toliau - komandų eilutė.  Šičia galima paleidinėti X'ines
programas neatsidarinėjant xterm'o, arba paleidinėti konsolines programas,
nuspaudus Ctrl+Enter vietoje Enter.  Į komandų eilutę galima greitai patekti
nuspaudus Win+Space.  Deja, nėra nei istorijos, nei automatinio failų vardų
užbaigimo.
</li>

<li> Antroje eilėje keturi mygtukai atitinka keturis darbastalius.
Šiuo metu aktyvus ketvirtasis.  Tarp darbastalių galima vaikščioti klavišais
Win+Left/Right, o <a href="#patches">Win+Down</a> šokinės tarp šio ir prieš
tai aktyvaus darbastalio.  Į bet kurį iš jų galima greitai pereiti nuspaudus
Win+1..4.  O jei naudodamiesi kuriuo nors iš šių metodų dar laikysite
nuspaustą Shift klavišą, tai kartu į kitą darbastalį pasiimsite ir aktyvų
langą.
</li>

<li> Toliau eina užduočių juosta.  Nieko ypatingo.  Tarp langų galima
vaikščioti spaudant Alt+Tab (arba Alt+Esc).  Minimizuoti langai rodomi
tamsesne spalva.  Paslėpti langai išvis nerodomi, prie jų prieiti galima
tik per langų sąrašą.
</li>

<li> Dešinėje - laikrodis.  Palaikę virš jo pelę, pamatysite ir datą.
<br /><img src="datetooltip.png" alt="Data ir laikas" />
</li>

<li> Kiek kairiau - paštas!  Aš gavau laišką!  Net septynis laiškus! :)
<br /><img src="mailtooltip.png" alt="Paštas" />
</li>

<li> Dar kairiau - procesoriaus užimtumo per paskutines 10 sekundžių grafikas.
<br /><img src="cpuloadtooltip.png" alt="Procesoriaus apkrovimas" />
</li>

<li> Ir dar kairiau - mano mėgiamiausias - tinklo trafiko grafikas.
Standartiškai jo tooltips'as atrodo kiek kitaip ir pateikia mažiau
informacijos, bet tam ir yra <a href="#patches">source kodas</a>.
<br /><img src="nettooltip.png" alt="Tinklo statistika" />
</li>

</ul>

<p>Sumažinus GNOME Panelį iki 24 pikselių aukščio ir parinkus jam
atitinkamą spalvą, jis labai gražiai prisiderina prie IceWM taskbar'o.
Tiesa, aš GNOME panelį vartoju praktiškai vien dėl ICQ (<a href="http://gnomeicu.gdev.net/">GnomeICU</a>) ikonėlės.
</p>

<p>Kiti IceWM'o atributai:</p>
<ul>
<li> Lango meniu (iškviečiamas nuspaudus Alt+Space).  Kaip matote,
visas operacijas galima atlikti vien klavišais.
<br /><img src="winmenu.png" alt="Lango meniu" />
</li>

<li> Tampant langus po ekraną, jie automatiškai "prilimpa" prie kitų
langų ar ekrano krašto.  Nepaprastai patogu.  O jei tepatinka - tereikia
laikyti nuspaudus Alt klavišą.
</li>

<li> Langų sąrašas, iškviečiamas nuspaudus Win+Esc.  Galite čia
aktyvuoti bet kurį langą, arba pasižymėti kelis ir juos visus kartu
paslėpti/uždaryti/ išdėstyti stulpeliais/eilutėmis ir taip toliau.
<br /><img src="winlist.png" alt="Langų sąrašas" />
</li>

<li> Nuspaudę magiškąją trijų pirštų kombinaciją Ctrl+Alt+Del (arba
tiesiog Win+Del), galite atlikti daug įdomių veiksmų, pvz., perkrauti ar
išjungti kompiuterį, perkrauti IceWM'ą, išsiloginti arba tiesiog užrakinti
ekraną.
<br /><img src="ctrlaltdel.png" alt="Ctrl+Alt+Del meniu" />
</li>

</ul>

<h2><a id="patches">Mano IceWM patobulinimai</a></h2>

<p>Čia rasite kelis mano darytus „lopus“ (angl. <em>patches</em>)
IceWM'ui.  Failo vardas sudarytas iš žodžio „patch“ (kad būtų aišku, kas
tai), IceWM versijos numerio (su kuria šie „lopai“ daryti), autoriaus
inicialų (<em>mg</em> - tai aš ;), pavadinimo bei „lopo“ versijos numeriuko.
Be panikos - visi jie veikia ir su naujausia 1.0.4 versija, tiesiog kai kur
gali skirtis eilučių numeriai.
</p>

<ul>
<li> <a href="patch-1.0.0.mg.lastconsole.1">patch-1.0.0.mg.lastconsole.1</a>
 leidžia šokinėti tarp šio ir praeito darbastalio nuspaudus
               Win+Down. 
</li>

<li> <a href="patch-1.0.1.mg.tooltip.1">patch-1.0.1.mg.tooltip.1</a>
 leidžia tooltips'ams kaboti amžinai, kai ToolTipTime = 0. 
</li>

<li> <a href="patch-1.0.4.mg.winlist.2">patch-1.0.4.mg.winlist.2</a>
 rodo papildomą informaciją langų sąraše: darbastalio numerį
               bei būseną (paslėptas/minimizuotas). 
</li>

<li> <a href="patch-1.0.4.mg.movesize.1">patch-1.0.4.mg.movesize.1</a>
 prideda porą patogių klavišų langų stumdymo metu. 
</li>

<li> <a href="patch-1.0.4.mg.ppp.2">patch-1.0.4.mg.ppp.2</a>
 rodo naudingesnę informaciją tinklo grafiko tooltip'se:
               <br /><img src="nettooltip.png" alt="Tinklo statistika" />
</li>

<li> <a href="patch-1.0.4.mg.alttab.2">patch-1.0.4.mg.alttab.2</a>
 patobulintas (išvaizdos prasme) Andy Oliver „lopas“,
               keičiantis Alt+Tab langelio išvaizdą į štai tokią:
               <br /><img src="alttab.png" alt="Alt+Tab langelis" />
</li>

</ul>

<h2><a id="config">Mano IceWM konfigūracija</a></h2>

<p>Čia rasite mano ~/.icewm/ katalogo turinį:</p>
<ul>
<li> <a href="preferences">preferences</a>
 failas nurodo pagrindinius IceWM parametrus. 
</li>

<li> <a href="winoptions">winoptions</a>
 failas aprašo įvairių programų parametrus.  Jis pas mane
               nelabai tvarkingas :) 
</li>

<li> <a href="toolbar">toolbar</a>
 failas aprašo paleidimo mygtukus taskbar'e.  
</li>

<li> <a href="keys">keys</a>
 failas aprašo greitus programų paleidimo klavišus. 
</li>

<li> <em>menu</em> failas aprašo Start meniu turinį.  Pas mane šis
     failas yra generuojamas <a href="make.sh">make.sh</a> skriptuko iš <a href="menu.src">menu.src</a>, reikiamose vietose įterpiant GNOME bei
     KDE meniu turinį.  Irgi netvarka.  Beje, kur gavau <em>gno2ice.pl</em>
     bei <em>kde2ice.pl</em> skriptukus, nepamenu.
</li>

<li> <a href="programs">programs</a>
 failas taip pat dalyvauja Start meniu kūrime.  Netvarkytas
               šimtą metų - aš Start meniu nenaudoju. 
</li>

<li> <em>icons/</em> kataloge voliojasi 1243 ikonytės.  Beveik visos
     yra nenaudojamos, o reikalingų (pvz. XMMS'ui) nėra...
</li>

<li> <em>mailbox/</em> kataloge yra šiek tiek perpieštos pašto
     ikonėlės taskbar'ui (naudojant standartines sunku iš didesnio atstumo
     įžiūrėti, yra pašto, ar nėra).
</li>

<li> <em>themes/</em> kataloge yra iš <a href="http://icewm.themes.org/">visur</a> pritempta daugybė temų.
     Aš naudoju tik mano modifikuotą <em>blueHeart</em> temą.  Jei norite ją
     išbandyti, atsisiųskite <a href="http://icewm.themes.org/themes.phtml?themeid=946463904">blueHeart
     iš icewm.themes.org</a> ir vietoje ten esančio <em>default.theme</em>
     failo naudokite <a href="mg.theme">mg.theme</a>.
</li>

</ul>

<h2><a id="links">Nuorodos</a></h2>

<p>O kaip gi be jų :)</p>

<ul>
<li> <a href="http://icewm.sourceforge.net/">icewm.sourceforge.net</a>
 - oficialus IceWM puslapis. 
</li>

<li> <a href="http://icewm.cjb.net/">IceWM Network</a>
 - IceWM tinklas. 
</li>

<li> <a href="http://icewmfaq.cjb.net/">IceWM FAQ</a>
 - IceWM dažnai užduodami klausimai. 
</li>

<li> <a href="http://home.mho.net/zrpg/icewm/">IceWM Xtravaganza</a>
 - nuorodos ir t.t. 
</li>
</ul>

<p>Kiek žinau, VA Linux firma yra užregistravusi icewm.org domeną,
tačiau iki šiol ten nėra jokio tinklapio.</p>
