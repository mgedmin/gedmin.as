<%inherit file="_templates/site.mako" />
<%def name="title()">Linux branduolio „lopai“</%def>
<%def name="short_title()">Branduolys</%def>

<h2>Linux branduolio „lopai“</h2>

<h3>ISO9660 „branduolio lopas“</h3>

<p>
Joliet CD-ROM'uose mane erzino du dalykai:
</p>
<ul>
  <li> Visi failai buvo vykdomieji (mode=0444 veikdavo tik failus, kurių
       varduose buvo taškai), be jokios reakcijos į <tt>noexec</tt> parametrą. </li>
  <li> Dažnai pasitaikydavo 8.3 DOSiški failų vardai DIDŽIOSIOMIS
       RAIDĖMIS (bent jau namų gamybos CD-R'uose). </li>
</ul>

<p>
Šis patch'as ištaiso abi problemas:
</p>
<ul>
  <li> Nė vienas paprastas failas nėra vykdomas, jei užduotas <tt>noexec</tt>
       mount parametras. </li>
  <li> Pridedamas naujas iso9660 mount parametras: <tt>lowercase</tt>.  Jei jis 
       įjungtas, visi failų vardai, sudaryti tik iš didžiųjų raidžių,
       rodomi mažosiomis raidėmis.  Paprasti ISO9660 jau turi <tt>map=normal</tt>
       parametrą, o Rock Ridge šito tikrai nereikia, tad šis parametras
       veikia tik Joliet CD-ROM'us. </li>
</ul>

<ul>
<li><a href="isofs-2.2.19mg1.patch">isofs-2.2.19mg1.patch (5K)</a></li>
</ul>

<p>Ankstesnės branduolio versijos</p>
<ul>
<li><a href="isofs-2.2.14mg1.patch">isofs-2.2.14mg1.patch (5K)</a></li>
<li><a href="isofs-2.2.9mg1.patch">isofs-2.2.9mg1.patch (5K)</a></li>
</ul>

