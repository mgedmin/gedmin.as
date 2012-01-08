<%inherit file="_templates/site.mako" />
<%def name="title()">Algoritmų analizė</%def>
<%def name="short_title()">algoritmų analizė</%def>

<h2>Algoritmų analizė</h2>

<!--
<p>Programa - - tai algoritmas, užrašytas kuria nors programavimo kalba.</p>
  -->

<p>Kaip galima būtų įvertinti algoritmų efektyvumą?  Paprastai žiūrima į
du dalykus:</p>
<ul>
  <li>veikimo laiką</li>
  <li>sunaudojamos atminties kiekį</li>
</ul>

<p>Konkrečiais matavimo vienetais (baitais ar sekundėmis) vertinti tai yra
sunku, nes konkretūs skaičiai priklauso nuo naudojamos programavimo kalbos,
kompiliatoriaus ir apskritai visos aplinkos, o taip pat „geležies“ galimybių.
Todėl yra įpasta naudoti <em>asimptotinę notaciją</em></p>


<p>Užrašas f(x) = O(g(x)) reiškia „funkcija f auga lėčiau už funkciją
g(x)“.</p>

<p>Pažymėkime algoritmo veikimo laiką funkcija T(n), kur n yra pradinių
duomenų dydis.  Užrašas T(n) = O(n) reiškia, jog ši funkcija yra daugiau ar
mažiau tiesiogiai proporcinga duomenų dydžiui, T(n) = O(n<sup>2</sup>) reikštų,
kad programos veikimo laikas yra proporcingas duomenų dydžio kvadratui ir t.t.
</p>

<p>Formaliai užrašas T(n) = O(f(n)) reiškia, jog egzistuoja tokios konstantos
c bei n<sub>0</sub>, kad visiems n &ge; n<sub>0</sub> teisinga nelygybė
T(n) &lt; c·f(n).  Išvertus į žmonių kalbą tai reiškia, kad esant pakankamai
dideliems n programos veikimo laikas yra proporcingas funkcijai f(n).</p>

<p>Nesunku įsitikinti, kad O(a f(n)) = O(f(n)), t.y. galime funkciją f(n)
dauginti ar dalinti iš bet kokios teigiamos konstantos a ir nieko tuo
nepakeisime.  Taip pat galime įsitikinti, kad O(f(n) + g(n)) = O(f(n)) +
O(g(n)).  Dar viena naudinga lygybė yra O(f(n) + g(n)) = O(f(n)) jei g(n) =
O(f(n)), t.y. pridėję lėčiau augančią funkciją g(n) prie greičiau augančios
funkcijos f(n) nieko nepakeisime.
</p>

<p>Praktiškai tai reiškia, kad jei f(n) yra bet koks n-tojo laipsnio
daugianaris, galime ignoruoti visus narius, išskyrus pirmąjį: O(2n<sup>4</sup>
+ n<sup>3</sup> - 10000n + 17) = O(n<sup>4</sup>).
</p>

<p>Panašiai užrašas f(x) = &#x03A9;(g(x)) reiškia, jog funkcija f(x) auga
greičiau už funkciją g(x): egzistuoja konstantos c bei n<sub>0</sub>, kad
visiems n &ge; n<sub>0</sub> teisinga f(x) &gt; c·g(x).</p>

<p>Užrašas f(x) = &#x0398;(g(x)) reiškia, jog funkcija f(x) auga tokiu pat
greičiu, kaip ir funkcija funkciją g(x): egzistuoja konstantos c<sub>1</sub>,
c<sub>2</sub> bei n<sub>0</sub>, kad visiems n &ge; n<sub>0</sub> teisinga
nelygybė c<sub>1</sub>·g(x) &lt; f(x) &lt; c<sub>2</sub>·g(x).</p>

<p>Asimptotiniai sąryšiai tarp funkcijų primena įprastus ženklus &le;, =,
&ge;.  Vienas skirtumas: ne visos funkcijos yra asimptotiškai sulyginimos,
tad kartais nei vienas iš aukščiau minėtų sąryšių netinka.</p>

<p>Dažniausiai pasitaikantys sąryšiai „didėjimo tvarka“: O(1), O(log n), O(n),
O(n log n), O(n<sup>2</sup>), ..., O(n<sup>1000</sup>), ...,
O(2<sup>n</sup>).
</p>

<!-- XXX įkišk ten sqrt(n), n!, 3^n, e^n, n^n -->

