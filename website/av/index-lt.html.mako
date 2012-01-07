<%inherit file="_templates/site.mako" />
<%def name="title()">Antivirusai Linuxe</%def>
<%def name="short_title()">antivirusai</%def>

<h2>Antivirusai Linuxe</h2>

<p>Kam reikia antiviruso Linuxui?  Teisingai, išgaudyti tame pačiame tinkle
esantiems Windowsiniams virusams.  Konkrečiai šiuo momentu mane domina pro
<abbr title="Mail Transport Agent">MTA</abbr> praeinančio elektroninio pašto
filtravimas.</p>

<p>2003 m. birželio pradžioje padariau mažą apklausą os_linux el. pašto
konferencijoje: ką žmonės naudoja elektroninio pašto tikrinimui?  Atsakymai
buvo įvairūs: MTA -- postfix, exim, sendmail, qmail; antivirusas -- F-Prot,
VirusWall, DrWeb, AVP, H+BEDV, McAfee, Panda; įvairūs priedai -- amavis, virge,
inflex, mimedefang, qmail-scanner, clamav.</p>

<p>MTA pasirinkimas -- skonio reikalas, apie tai daugiau nekalbėsiu.  Jei
įdomu, pats aš dažniausiai naudoju Postfix. </p>

<h3>Antivirusai</h3>

<p>Pagrindinis mane dominantis kriterijus -- nemokamos versijos (free beer) bei
nemokamų atnaujinimų egzistavimas.  Galimybė ne tik atpažinti, bet ir gydyti
virusus manęs nedomino.
</p>

<dl>

<dt><a href="http://www.f-prot.com/">F-Prot Antivirus for Linux</a></dt>
<dd>Komercinis; nemokamas asmeniniam naudojimui asmeniniuose kompiuteriuose.
</dd>

<dt><a href="http://www.trendmicro.com/en/products/gateway/isvw/evaluate/overview.htm">InterScan VirusWall</a></dt>
<dd>Komercinis.  Manęs nedomina.
</dd>

<dt><a href="http://www.drweb.ru/unix/">Dr. Web</a></dt>
<dd>Nemokama versija negydo virusų ir nesikapsto archyvų viduje.  Websaitas
rusiškas. <a href="http://www.sald.com/">Angliškas websaitas</a> kiek pasenęs.
</dd>

<dt><a href="http://www.kaspersky.com/">AVP</a></dt>
<dd>Komercinis.  Kažkokia bandomoji versija yra, bet tingėjau pildyti web formą.
</dd>

<dt><a href="http://www.hbedv.com/">H+BEDV</a></dt>
<dd>Komercinis.  Yra demo versija su gana miglota licencija.
</dd>

<dt><a href="http://www.mcafee.com/">McAfee VirusScan</a></dt>
<dd>Komercinis.  Linuxinė versija kažkur giliai giliai paslėpta.  Licencija
neaiški.  Kažkokios web formos.  Fu.
</dd>

<dt><a href="http://www.pandasoftware.com/download/linux/linux.asp">Panda Antivirus for Linux</a></dt>
<dd>Freeware.  Norint parsisiųsti reikia pildyti kažkokias kvailas formas.
</dd>

</dl>

<h3>Išvados</h3>

<p>Iš pirmo žvilgsnio atrodo, kad tik Dr. Web bei Panda Antivirus turi legalias
nemokamas versijas tinkamas naudojimui serveryje.
</p>

