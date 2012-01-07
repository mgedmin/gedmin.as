<%%inherit file="_templates/site.mako" />
<%def name="title()">Links puslapis</%def>
<%def name="short_title()">Links</%def>

<div class="news toolbox shadow"><div class="inner">
Links projektas „truputį“ išsišakojo: links (senoji 0.9x serija dar palaikoma,
jei neklystu), elinks (lua skriptingas ir kt.), links2 (grafika + javascript),
links-hacked (neturiu žalio supratimo, bet girdėjau užuominas mailing liste).
Reiktų visa tai pasivyti.  O kol kas naršymui naudoju Mozilla.
</div></div>

<h2>Kas tai yra</h2>

<p><a href="http://artax.karlin.mff.cuni.cz/~mikulas/links/">Links</a> yra tinklo naršyklė, dirbanti
tekstiniame režime.  Pagrindiniai jos privalumai:</p>
<ul>
<li> siuntimas fone, </li>
<li> vaizdavimas iš karto, nelaukiant, kol visas puslapis bus atsiųstas, </li>
<li> meniu bei dialogai, </li>
<li> pelės palaikymas, </li>
<li> HTML lentelių bei rėmų (frames) vaizdavimas. </li>
<li> pilnas lietuvių kalbos palaikymas. </li>
</ul>
Trūkumai:
<ul>
<li> nepatogus valdymas (kas išbandė <a href="http://ei5nazha.yz.yamagata-u.ac.jp/~aito/w3m/eng/">w3m</a>'ą, nenorės
     grįžti prie <a href="http://lynx.browser.org/">lynx</a> stiliaus klavišų), </li>
<li> tekstinis režimas vis dėlto yra tekstinis režimas... </li>
</ul>
<p>
Viena Links'o savybė - savarankiškumas - yra tiek privalumas, tiek trūkumas.
Sakydamas „savarankiškumas“ aš turiu omenyje nepriklausomybę nuo operacinės
sistemos bei kitų programų ir bibliotekų.  Tai - privalumas todėl, kad Links'ą
nesunku naudoti įvairiose operacinėse sistemose (Windows, OS/2, Unix).
Trūkumas, nes Links'as nenaudoja <em>terminfo</em>, <em>mime.types</em>,
<em>mailcap</em> informacijos ir tenka jį konfigūruoti atskirai.
</p>

<p>Čia mano norų sąrašas Links'ui:</p>
<ul>
<li> geresnis spalvų palaikymas, </li>
<li> CSS palaikymas, </li>
<li> disko kešas, išliekantis ir užbaigus darbą, </li>
<li> išliekanti puslapių istorija bei skirtingos aplankytų/neaplankytų nuorodų
     spalvos, </li>
<li> klavišų bei meniu/dialogų spalvų konfigūravimas. </li>
</ul>

<p><a href="http://www.opensource.org/">Open Source</a> dėka galima ne
tik prašinėti autorių (ko, beje, aš dar nedariau), bet ir pačiam realizuoti
(ar bent jau pabandyti) savo norus. </p>

<ul>
<li> <a href="links-0.91-mg.underline.1">links-0.91-mg.underline.1</a> <br />

     Šis „lopas“ daro du dalykus:
     <ol>
     <li> Rodo visas nuorodas (+ form controls/image maps/etc) pabrauktas. </li>
     <li> Vietoje juodos fono spalvos vartoja permatomą. </li>
     </ol>
     <p>
     Jis naudingas tik <em>xterm</em>'ų vartotojams.  Jei jis būtų
     padarytas padoriai, pridėtų parametrus, leidžiančius
     įjungti/išjungti aukščiau išvardintus pakeitimus.  Bet jis nėra
     padarytas padoriai. :)
     </p>

     <p>
     <a href="links-original.png"><img src="links-original-small.png" alt="Nepakeistas Links'as" /></a><br />
     Slashdot'as nepakeistame Links'e <a href="http://www.eterm.org/">Eterm</a>'o lange.
     </p>

     <p>
     <a href="links-patched.png"><img src="links-patched-small.png" alt="Pakeistas Links'as" /></a><br />
     Slashdot'as pakeistame Links'e <a href="http://www.eterm.org/">Eterm</a>'o lange.
     </p></li>

</ul>

<p> Kai surasiu laiko, pasistengsiu pritaikyti šį „lopą“ naujausiai
Links versijai (šiuo metu tai 0.95). </p>
<p> Dar planavau aiškintis Links'o žaidimus su spalvomis.  Norėčiau
priversti jį rodyti teisingas fono spalvas.  Visų pirma reikėtų išmokyti jį
naudoti visas 16 fono spalvų.  Kada rasiu tam laiko - nežinau. </p>
