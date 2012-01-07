<%inherit file="_templates/site.mako" />
<%def name="title()">Mano Palmas</%def>
<%def name="short_title()">Palm</%def>

<div style="float:right; margin: 0 2ex 1em 1em; padding: 4px 4px 0px 4px; border: 1px solid #ccc"><img src="tungsten-t.jpg" alt="Mano Palmas" width="98" height="145" /></div>

<h2>Palm Tungsten T</h2>

<p><span style="text-decoration: line-through">Neseniai</span> Prieš kelis
metus pirkau naują <a href="http://www.palm.com/products/handhelds/tungsten-t/">Palmą Tungsten T</a>
iš <a href="http://www.handheld.lt/TungstenT.html">Mindaugo
Kilikevičiaus</a>.</p>

<p>Šį modelį rinkaus dėl tokių priežasčių</p>

<ul>
<li>Mažas ir lengvas (102mm x 75 mm x 15 mm; 157 g)</li>
<li>Gražus ir patogus (nors Palm m5xx gražesnis ir patogesnis)</li>
<li>Turi Bluetooth</li>
<li>Turi šviesų spalvotą "didelės skiriamosios gebos" (320x320) TFT ekraną</li>
<li>Graffiti teksto įvedimas</li>
<li>Gali groti Ogg bei MP3 failus</li>
<li>Paremtas Palm OS 5.0 o ne WinCE <small>(Linux būtų dar geriau, bet aš dar
    nemačiau Linux delninuko su palyginamu dydžiu/išvaizda, o taip pat prisibijau
    programinės įrangos pusės neišbaigtumo)</small></li>
<li>Naudoja tą patį lopšelį bei pakrautuvą kaip ir mano senas m500</li>
</ul>

<p>Pirmieji įspūdžiai</p>
<ul>
<li><a href="http://gutenpalm.sourceforge.net/">Weasel Reader</a> veikia
    puikiai.  O štai <a href="http://linkesoft.com/xmaster/">X-Masteris</a> -
    ne.  PalmOS 5 hackų nebepalaiko ir nebepalaikys.  Labai pasiilgstu <a href="http://www.mikemccollister.com/palm/#McPhling">McPhling hacko</a>.
    Tačiau yra nauja McPhling versija, skirta PalmOS 5.  Aš išgelbėtas!</li>
<li>Dar viena neveikianti programa yra <a href="http://matrix.netsoc.tcd.ie/~fortytwo/code/">Clip</a>.  Ji tiesiog
    nepasileidžia.</li>
<li>Skaitant knygas su ekrano pašvietimu baterija nusėda per 10 valandų.
    Baisu.  Gal čia tiesiog pirmieji keli kartai, kai baterija dar neįgavo
    savo pilnos talpos?</li>
<li>Pastebėjau, kad norint pasiekti meniu reikia spausti stiliumi kairiajame
    viršutiniame ekrano kampe.  Palmo websaite rašoma, jog tai klaida ir siūlo
    jai atsisiųsti pataisą.  Užsukite ten į Support -&gt; Products -&gt;
    Tungsten T -&gt; Palm Tungsten T Update.</li>
<li>Mygtukas „žemyn“ elgiasi kaprizingai.  Kažin, ar tai nėra hardware problema?
    </li>
</ul>

<p>Pastabos po ilgesnio vartojimo</p>

<ul>
<li>Jis per didelis ir per sunkus.  m500 šiuo atžvilgiu buvo daug geresnis.</li>
<li>Tungstenas geriau tinka knygoms (baltas ekrano fonas, pašvietimas,
    didesnė skiriamoji geba, gražesni šriftai, daugiau atminties, neapsakomai
    greitesnis darbas su atminties kortelėmis).</li>
<li>Pašvietimas yra būtinas, nebent stovėtum lauke saulei šviečiant (o tada
    neįmanoma atskirti, ar jis įjungtas, ar ne).  Ko gero todėl baterija
    trumpiau laiko.</li>
<li>5 krypčių navigacijos mygtukai yra geras patobulinimas.  Galima daryti
    beveik viską (rinktis programas, knygas ir t.t.) netraukiant stiliaus.</li>
<li>Permatomas plastikinis dangtelis turi pliusų (galima skaityti knygas jo
    nenuimant), bet turi ir minusų (nepatogu, mažai saugo, po ilgesnio laiko
    vartojant apsitrina ir pasidaro ne visai permatomas).  Atverčiamas odinis
    m500 dangtelis daug geriau.  Mano m500 vis dar atrodo beveik naujas po
    1,5 metų nešiojimo, o Tungstenas atrodo nutrintas ir apšiuręs jau po kelių
    mėnesių. </li>
<li>Knygos vis dar yra pagrindinė nauda iš PDA.  Dar aš jį naudoju SMSų
    saugojimui (Bluetooth yra gerai, bet STABDO), na ir toms pagrindinėms
    programėlėms (kalendoriui, adresų knygelei, darbų sąrašui, užrašams).
    </li>
<li>Mygtuko „žemyn“ kaprizai prapuolė.  Ar tik nebuvo tai softwaro (Weasel
    Reader) pastabdymas, kol jis dekompresindavo kitą knygos puslapį? </li>
</ul>


<h3>Hotsync Linuxe</h3>

<p>Jei pas jus senas senas kernelis (pvz., 2.4.20 ar senesnis), tuomet USB
sinchronizacijai reikės <a href="http://www.ussg.iu.edu/hypermail/linux/kernel/0302.2/1422.html">patchinti
kernelį</a>.</p>

<p>Anksčiau naudojau <a href="http://www.coldsync.org">ColdSync</a> su savo m500.
Deja, ši programa su Tungsten T nesusišneka.  Bandžiau versiją 2.3.1+20020318-1
iš Debian unstable. (Naujesnių versijų nebandžiau, nes pilot-link man
pakanka.)</p>

<p>O <a href="http://www.pilot-link.org">Pilot-link</a> veikia.  Tiesiog sukūriau
/dev/pilot symlinką į /dev/ttyUSB0 (o šai m500 arba Tungsten T3 naudoja
/dev/ttyUSB1).  Naudojau pilot-link versiją 0.11.7-3 iš Debian unstable.</p>

<p><small>2.4.20 kernelio visor.o modulis, deja, karts nuo karto lūžinėja.
Tiek su m500, tiek su Tungsten T.  Naujesniuose kerneliuose ši problema,
atrodo, jau pataisyta.</small></p>

<p>Taip pat sėkmingai sinchronizavau jį per IrDA su savo ThinkPadu.  Šiuo
atveju /dev/pilot symlinkas rodo į /dev/ircomm0.  Čia irgi pilot-link veikia, o
coldsync - ne.</p>

<p><small>IrDA sinchronizacija veikia daug maloniau ir patikimiau, tačiau
ir lėčiau.  Duomenų perdavimo greitis yra tik 3-5 kilobaitai per sekundę.
</small></p>

<p>Bluetooth sinchronizaciją realizuoti buvo sunkiausia, bet galų gale pavyko
(teko padaryti PPP dialupą į kompiuterį ir naudoti tinklinę sinchronizaciją).
Veikia tokiu pat greičiu, kaip IrDA, bet nėra jokių kabelių, ir nereikia
laikyti nutaikyto į IrDA ekraniuką.  Dabar daugiausia naudoju Bluetooth
siųsdamas naujas programas/duombazes į palmą.</p>

<p>Dar nesuradau būdo pasiųsti failo tiesiai į Palmo išplėtimo kortelę.  To
reikia visoms man žinomoms mp3 grojimo programėlėms.  Naudoju USB SD kortelių
skaitytuvą.  (MP3 grojimui naudoju <a href="http://tcpmp.corecodec.org/">TCPMP</a> arba AeroPlayer.)</p>

<p>Toliau - Internetas!</p>

<h2>Palm Tungsten T + Sony-Ericsson T68i + Bitė GPRS</h2>

<p>Instrukcija, kaip pasiekti Internetą (konkrečiai - Bitės GPRS) iš Palm
Tungsten T su mobiliu telefonu (Sony-Ericsson T68i).</p>

<p><small>Šias instrukcijas aš rašiau iš atminties, praėjus pusvalandžiui po
intensyvių <span style="text-decoration: line-through">kankynių</span> bandymų.
Nebandžiau jų atlikinėti nuo nulio.  </small></p>

<p>Pirmiausia reikia sukonfigūruoti GPRSą telefone.</p>

<ol>
<li>Menu -&gt; Connect (8) -&gt; Data comm. (7) -&gt; Data accounts (1)
    -&gt; Add account -&gt; GPRS data</li>
<li>Name: <kbd>Banga GPRS</kbd></li>
<li>APN: <kbd>banga</kbd></li>
<li>User id: <em>(tuščia)</em></li>
<li>Password: <em>(tuščia)</em></li>
<li><strong>Save</strong></li>
<li>Įsitikinam, kad naujojo accounto CID=1
    <br /><small>
      Jei ne, įsimenam tą skaičių.
    </small></li>
</ol>

<p>Tada reikėtų sukonfigūruoti Bluetooth, kad telefonas šnekėtųsi su Palmu.
   <br /><small>
     Jei jums pakaks Infraredo, galite šį etapą praleisti.
   </small></p>

<ol>
<li>Palme einam į Preferences -&gt; Communication -&gt; Connection</li>
<li><strong>New</strong></li>
<li>Name: <kbd>Bluetooth to my phone</kbd></li>
<li>Connect to: <kbd>Phone</kbd></li>
<li>Via: <kbd>Bluetooth</kbd></li>
<li>Įjungiam Bluetooth telefone:
    Menu -&gt; Connect (8) -&gt; Bluetooth (4) -&gt; Options -&gt; Operation
    mode -&gt; Automatic; tuomet Menu -&gt; Connect (8) -&gt; Bluetooth (4)
    -&gt; Discoverable </li>
<li>Device: <strong>Tap to find</strong> ir pasirenkam rastą telefoną
    <br /><small>
      Ko gero čia jis paprašys įvesti kodą.  Sugalvojam bet kokį ir įvedam.
      Tuomet telefone turėtų pasirodyti langelis prašantis kodo.  Įvedam tą
      patį.  Jei pasitaikys proga, pasirenkam "Add pair" abiejuose
      įrenginiuose.  Aš tai dariau anksčiau ir smulkmenų neprisimenu.
    </small></li>
<li>Model: <kbd>Standard GSM</kbd> veikia, nors ir skundžias</li>
</ol>

<p>Galų gale reikia sukonfigūruoti tinklą Palme.</p>

<ol>
<li>Preferences -&gt; Communication -&gt; Network</li>
<li><strong>New</strong></li>
<li>Service: <kbd>Banga GPRS</kbd></li>
<li>User name: <kbd>gprs</kbd></li>
<li>Password: <kbd>gprs</kbd>
    <br /><small>
      Jokio skirtumo, kokie username bei password nurodyti, bet būtina, kad jie
      nebūtų tušti.
    </small></li>
<li>Connection: <kbd>Infrared to GSM Phone</kbd> arba
                <kbd>Bluetooth to my phone</kbd></li>
<li>Phone: <kbd>*99#</kbd>
    <br /><small>
      Jei telefone jūsų CID buvo ne 1 o kitas skaičius, pvz, 42, tuomet
      įveskite <kbd>*99***42#</kbd>.
    </small></li>
<li>Galima užeiti į <strong>Details</strong> ir pasikeisti PPP timeoutą į
    <kbd>Never</kbd> -- GPRS apmokamas persiųstų baitų kiekis, o ne praleistų
    minučių skaičius.</li>
<li>Įjungiam Infrared/Bluetooth telefone
    <br /><small>
      Pvz., <strong>Options</strong> -&gt; Receive item (3)
    </small></li>
<li>Spaudžiam <strong>Connect</strong> ir žiūrim, kad viskas veikia.</li>
<li>Spaudžiam <strong>Disconnect</strong> ir džiaugiamės.</li>
</ol>

<p>Keletas naudingų nemokamų programų, kurias aš esu išbandęs:</p>

<ul>
<li><a href="http://www.citi.umich.edu/u/rees/pilot/">sntp</a> leidžia
    sinchronizuoti laikrodį su internetiniais NTP serveriais (pvz.,
    ntp.delfi.lt).
    <em>Open source</em>.
    </li>
<li><a href="http://www.eudora.com/internetsuite/eudoraweb.html">EudoraWeb</a>
    yra WWW naršyklė.  Nereikalauja jokių specialių proxy serverių (bet palaiko
    HTTP proxy).
    <em>Crippleware</em>.
    Beje, su palmu atėjusiame Software Essentials CD jau buvo
    viena naršyklė - Web Pro.
    </li>
<li><a href="http://www.ai/~iang/TGssh/">Top Gun ssh</a> yra SSH klientas.
    Deja jis palaiko tik pirmą SSH protokolo versiją, ir terminalo emuliatorius
    yra gana silpnas (VT100).
    <em>Open source</em>.
    </li>
<li><a href="http://www.sealiesoftware.com/pssh/">pssh</a> yra SSHv2 klientas.
    Terminalo emuliatorius yra paremtas PuTTY, palaiko spalvas, rodo pilną
    80 simbolių pločio ekraną (su smulkiais šriftais).  Veikia tik Palm OS 5
    įrenginiuose.
    <em>Open source</em>.
    </li>
</ul>

<p>Egzistuoja kelios nemokamos elektroninio pašto programos: <a href="http://www.eudora.com/internetsuite/eudora4palm.html">Eudora</a>, <a href="http://rallypilot.sourceforge.net/#GnuGotMail">GNUGotMail</a>.  Aš jų
nenaudoju, nes paštą skaitau tik namų kompiuteryje (būdamas namuose arba per
SSHą).</p>

<p>Ko aš norėčiau, bet dar neradau laiko paieškoti:</p>

<ul>
<li><span style="text-decoration: line-through">SSHv2 kliento su padoriu
    terminalo emuliatoriumi bei RSA autentikacija.</span> <strong>(radau
    pssh)</strong></li>
<li>El. pašto kliento, kuris palaikytų IMAP per SSL ir galėtų teisingai dirbti
    su MIME ir apdorotų skirtingas koduotes (UTF-8, ISO-8859-13).</li>
<li>Web naršyklės, kuri apdorotų skirtingas koduotes ir leistų instaliuoti Palm
    programas tiesiai iš Interneto</li>
</ul>

<!--
<p>Norėčiau išgirsti atsiliepimų.  Mano emailas: mgedmin&#64;b4net.lt</p>
  -->
