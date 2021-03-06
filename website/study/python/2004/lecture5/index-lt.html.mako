<%inherit file="_templates/site.mako" />
<%def name="title()">Penktoji paskaita (2004-10-04)</%def>
<%def name="short_title()">5</%def>

<h2>Darbas su Internetu</h2>

<p><a href="http://python.org/doc/current/lib/internet.html">Standartinėje
  bibliotekoje</a> yra realizuota nemažai Interneto protokolų.</p>

<p><a href="http://python.org/doc/current/lib/module-urllib.html">urllib</a>
modulis leidžia atsidaryti web puslapį ar failą iš FTP serverio taip, tarsi
tai būtų failas lokaliame diske:</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">urllib</span>

<span class="keyword">for</span> <span class="name">line</span> <span class="keyword">in</span> <span class="name">urllib</span>.<span class="name">urlopen</span>(<span class="string">'http://gedmin.as/python'</span>):
    <span class="keyword">print</span> <span class="name">line</span>
</pre></blockquote>

<p>urlopen funkcijos grąžinami objektai turi visus įprastinius metodus
darbui su failais -- readline, read, close ir t.t.  urllib moka dirbti su
http, https, ftp ir kai kuriais kitais protokolais.</p>

<p><a href="http://python.org/doc/current/lib/module-urllib2.html">urllib2</a>
modulis yra labai panašus į urllib, tačiau lengviau išplėčiamas.  Jį apsimoka
naudoti, jei norite apdoroti situacijas, su kuriomis urllib modulis
nesusidoroja (cookies, nestandartiniai HTTP statuso kodai).</p>

<p><a href="http://python.org/doc/current/lib/module-httplib.html">httplib</a>
modulis realizuoja HTTP protokolą.  Naudokite jį, jei urllib jums yra per
aukšto lygio.</p>

<h2>Darbas su HTML duomenimis</h2>

<p>Parsisiuntus puslapį reikia jį kažkaip apdoroti.  Standartinė Python
biblioteka pateikia nemažą rinkinį priemonių: <a href="http://python.org/doc/current/lib/module-HTMLParser.html">HTMLParser</a>,
<a href="http://python.org/doc/current/lib/module-htmllib.html">htmllib</a>,
<a href="http://python.org/doc/current/lib/module-sgmllib.html">sgmllib</a>.</p>

<p>Štai kaip galima iškrapštyti visus paveiksliukus iš HTML dokumento naudojant
sgmllib:</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">sgmllib</span>
<span class="keyword">import</span> <span class="name">urllib</span>

<span class="def">class</span> <span class="name">MyParser</span>(<span class="name">sgmllib</span>.<span class="name">SGMLParser</span>):

    <span class="def">def</span> <span class="name">start_img</span>(<span class="name">self</span>, <span class="name">attrs</span>):
        <span class="keyword">print</span> <span class="name">dict</span>(<span class="name">attrs</span>)[<span class="string">'src'</span>]

<span class="name">parser</span> = <span class="name">MyParser</span>()
<span class="name">parser</span>.<span class="name">feed</span>(<span class="name">urllib</span>.<span class="name">urlopen</span>(<span class="string">'http://gedmin.as/python'</span>).<span class="name">read</span>())
<span class="name">parser</span>.<span class="name">close</span>()
</pre></blockquote>

<p>htmllib bei HTMLParser naudoti yra kiek nepatogiau, nes neveikia magija,
leidžianti apsirašyti start_<em>elementovardas</em> metodus ir tenka žaisti su
if sakiniais.  Be to htmllib yra prisižaista aukštame abstrakcijos lygyje
ir tenka vozotis su formatavimo bei rašymo klasėmis.</p>

<h2>Darbas su XML duomenimis</h2>

<p>Pythonas palaiko iš kitų programavimo kalbų kilusius DOM bei SAX standartus
(nesu tikras, ar „standartas“ yra tinkamas žodis) darbui su XML duomenimis.</p><p></p>

<p>DOM (Document Object Model) iš XML duomenų failo sudaro rinkinį objektų
atmintyje:</p>

<blockquote class="example"><pre>
<span class="keyword">from</span> <span class="name">xml</span>.<span class="name">dom</span>.<span class="name">minidom</span> <span class="keyword">import</span> <span class="name">parseString</span>

<span class="name">xml_data</span> = <span class="string">"""
&lt;studentai&gt;
  &lt;studentas vardas="</span><span class="name">Jonas</span><span class="string">" /&gt;
  &lt;studentas vardas="</span><span class="name">Petras</span><span class="string">"&gt;
    &lt;laptopas tipas="</span><span class="name">ThinkPad</span> <span class="name">X31</span><span class="string">" /&gt;
    Paprastas tekstas.
  &lt;/studentas&gt;
&lt;/studentai&gt;
"""</span>

<span class="name">dom</span> = <span class="name">parseString</span>(<span class="name">xml_data</span>)

<span class="keyword">for</span> <span class="name">student</span> <span class="keyword">in</span> <span class="name">dom</span>.<span class="name">getElementsByTagName</span>(<span class="string">'studentas'</span>):
    <span class="keyword">print</span> <span class="name">student</span>.<span class="name">getAttribute</span>(<span class="string">'vardas'</span>)
</pre></blockquote>

<p>Dideli duomenų medžiai suryja daug atminties, tad jei mums nereikia viso
medžio iškart, apsimoka apdoroti jį palaipsniui po vieną elementą:</p>

<blockquote class="example"><pre>
<span class="keyword">from</span> <span class="name">xml</span>.<span class="name">dom</span>.<span class="name">pulldom</span> <span class="keyword">import</span> <span class="name">parseString</span>

<span class="name">xml_data</span> = <span class="string">"""
&lt;studentai&gt;
  &lt;studentas vardas="</span><span class="name">Jonas</span><span class="string">" /&gt;
  &lt;studentas vardas="</span><span class="name">Petras</span><span class="string">"&gt;
    &lt;laptopas tipas="</span><span class="name">ThinkPad</span> <span class="name">X31</span><span class="string">" /&gt;
    Paprastas tekstas.
  &lt;/studentas&gt;
&lt;/studentai&gt;
"""</span>

<span class="keyword">for</span> <span class="name">type</span>, <span class="name">node</span> <span class="keyword">in</span> <span class="name">parseString</span>(<span class="name">xml_data</span>):
    <span class="keyword">if</span> <span class="name">type</span> == <span class="string">'START_ELEMENT'</span> <span class="keyword">and</span> <span class="name">node</span>.<span class="name">nodeName</span> == <span class="string">'studentas'</span>:
        <span class="keyword">print</span> <span class="name">node</span>.<span class="name">getAttribute</span>(<span class="string">'vardas'</span>)
</pre></blockquote>

<p>Panašius privalumus turi <a href="http://python.org/doc/current/lib/module-xml.sax.html">xml.sax</a> bei 
<a href="http://python.org/doc/current/lib/module-xmllib.html">xmllib</a>
moduliai, bet vietoje vieno ciklo tenka rašyti savo klasę, kurios metodai bus
iškvietinėjami iš standartinės bibliotekos gelmių.</p>
