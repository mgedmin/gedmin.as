<%inherit file="_templates/site.mako" />
<%def name="title()">Pirmoji paskaita (2004-09-06)</%def>
<%def name="short_title()">1</%def>

<p>Per pačią paskaitą nieko įdomaus nepasakiau, tačiau kitą dieną per pratybas
išdėsčiau sintaksės pagrindus.  Žmonėms, kurie jau žino Paskalį, C, C++ arba Javą
pačiai pradžiai to turėtų pakakti.</p>

<h3>Trumpa sintaksės apžvalga</h3>

<p>Susipažinti su Pythono sintakse geriau skaitant vieną iš pagrindiniame
puslapyje nurodytų šaltinių (<a href="http://docs.python.org/tut/tut.html">tutorialą</a> arba <a href="http://diveintopython.org/index.html">Dive into Python</a>), bet ši
trumpa apžvalga gal padės prisiminti ar pasikartoti.</p>

<p>Priskyrimo sakinys -- jokių siurprizų:</p>

<blockquote class="example"><pre>
<span class="name">x</span> = <span class="number">1</span> + <span class="number">2</span> * <span class="number">3</span> - <span class="number">5</span> ** <span class="number">2</span>   <span class="comment"># '**' yra kelimo laipsniu operatorius</span>
<span class="comment"># '#' pradeda komentarą, kuris tęsiasi iki eilutės pabaigos</span>
</pre></blockquote>

<p>Simbolių eilutės:</p>

<blockquote class="example"><pre>
<span class="name">a</span> = <span class="string">'simbolių eilutė'</span>
<span class="name">b</span> = <span class="string">"kita simbolių eilutė"</span>
<span class="name">c</span> = <span class="string">'kabutės ir apostrofas eilutėje: " \''</span>
</pre></blockquote>

<p>Skaičiai:</p>

<blockquote class="example"><pre>
<span class="name">x</span> = <span class="number">123</span>
<span class="name">y</span> = <span class="number">0xFFFF</span>
<span class="name">z</span> = -<span class="number">0.15</span>
</pre></blockquote>

<p>Išvedimas į ekraną:</p>

<blockquote class="example"><pre>
<span class="keyword">print</span> <span class="string">"x ="</span>, <span class="name">x</span>
</pre></blockquote>

<p>Sąlyginiai sakiniai:</p>

<blockquote class="example"><pre>
<span class="keyword">if</span> <span class="name">x</span> == <span class="number">42</span>:
    <span class="keyword">print</span> <span class="string">"Life, the Universe and Everything"</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">if</span> <span class="name">y</span> == <span class="number">8</span>:
    <span class="keyword">print</span> <span class="string">"y == 8"</span>
<span class="keyword">else</span>:
    <span class="keyword">print</span> <span class="string">"y != 8"</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">if</span> <span class="name">y</span> &lt; <span class="number">0</span>:
    <span class="keyword">print</span> <span class="string">"y &lt; 0"</span>
<span class="keyword">elif</span> <span class="name">y</span> &gt; <span class="number">0</span>:
    <span class="keyword">print</span> <span class="string">"y &gt; 0"</span>
<span class="keyword">else</span>:
    <span class="keyword">print</span> <span class="string">"y == 0"</span>
</pre></blockquote>

<p>Ciklai:</p>

<blockquote class="example"><pre>
<span class="name">x</span> = <span class="number">0</span>
<span class="keyword">while</span> <span class="name">x</span> &lt; <span class="number">10</span>:
    <span class="keyword">print</span> <span class="name">x</span>
    <span class="name">x</span> += <span class="number">1</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">for</span> <span class="name">x</span> <span class="keyword">in</span> [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>, <span class="number">5</span>, <span class="number">10</span>]:
    <span class="keyword">print</span> <span class="name">x</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">for</span> <span class="name">x</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">5</span>):  <span class="comment"># 0, 1, 2, 3, 4</span>
    <span class="keyword">print</span> <span class="name">x</span>
</pre></blockquote>

<p>Sąrašai:</p>

<blockquote class="example"><pre>
<span class="name">l</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]
<span class="name">l</span>.<span class="name">append</span>(<span class="number">4</span>)     <span class="comment"># l == [1, 2, 3, 4]</span>
<span class="name">l2</span> = [<span class="string">'labas'</span>, <span class="string">'rytas'</span>]
<span class="keyword">print</span> <span class="name">l2</span>[<span class="number">0</span>]     <span class="comment"># 'labas'</span>
<span class="keyword">if</span> <span class="name">range</span>(<span class="number">1</span>, <span class="number">5</span>) == [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>, <span class="number">4</span>]:
    <span class="keyword">print</span> <span class="string">"range funkcija veikia"</span>
</pre></blockquote>

<p>Žodynai:</p>

<blockquote class="example"><pre>
<span class="name">failu_skaicius_pagal_ispletima</span> = {<span class="string">'.c'</span>: <span class="number">7</span>, <span class="string">'.h'</span>: <span class="number">12</span>}
<span class="keyword">print</span> <span class="name">failu_skaicius_pagal_ispletima</span>[<span class="string">'.c'</span>]
<span class="name">failu_skaicius_pagal_ispletima</span>[<span class="string">'.c'</span>] += <span class="number">2</span>
<span class="keyword">if</span> <span class="string">'.c'</span> <span class="keyword">in</span> <span class="name">failu_skaicius_pagal_ispletima</span>:
    <span class="keyword">print</span> <span class="string">'C failu yra'</span>
<span class="keyword">if</span> <span class="string">'.pas'</span> <span class="keyword">not</span> <span class="keyword">in</span> <span class="name">failu_skaicius_pagal_ispletima</span>:
    <span class="keyword">print</span> <span class="string">'o Paskalio nera'</span>
</pre></blockquote>

<p>Tuplai</p>

<blockquote class="example"><pre>
<span class="name">x</span> = (<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>)
(<span class="name">a</span>, <span class="name">b</span>, <span class="name">c</span>) = <span class="name">x</span>
(<span class="name">a</span>, <span class="name">b</span>, <span class="name">c</span>) = (<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>)

<span class="name">indeksas</span> = {}
<span class="name">indeksas</span>[(<span class="name">vardas</span>, <span class="name">pavarde</span>)] = <span class="name">duomenys</span>

<span class="name">x</span>, <span class="name">y</span> = <span class="name">y</span>, <span class="name">x</span>            <span class="comment"># sukeitimas vietomis</span>
</pre></blockquote>

<p>Funkcijos</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">faktorialas</span>(<span class="name">n</span>):
    <span class="name">x</span> = <span class="number">1</span>
    <span class="keyword">for</span> <span class="name">i</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">1</span>, <span class="name">n</span>+<span class="number">1</span>):
        <span class="name">x</span> *= <span class="name">i</span>
    <span class="keyword">return</span> <span class="name">x</span>

<span class="keyword">print</span> <span class="string">"5! ="</span>, <span class="name">faktorialas</span>(<span class="number">5</span>)
</pre></blockquote>

<p>Klasės</p>

<blockquote class="example"><pre>
<span class="def">class</span> <span class="name">Taskas</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>, <span class="name">x</span>, <span class="name">y</span>):
        <span class="name">self</span>.<span class="name">x</span> = <span class="name">x</span>
        <span class="name">self</span>.<span class="name">y</span> = <span class="name">y</span>

    <span class="def">def</span> <span class="name">atspindys</span>(<span class="name">self</span>):
        <span class="keyword">return</span> <span class="name">Taskas</span>(-<span class="name">self</span>.<span class="name">x</span>, -<span class="name">self</span>.<span class="name">y</span>)

<span class="name">taskas1</span> = <span class="name">Taskas</span>(<span class="number">5</span>, <span class="number">2</span>)
<span class="name">taskas2</span> = <span class="name">taskas1</span>.<span class="name">atspindys</span>()
</pre></blockquote>

<p>Darbas su failais</p>

<blockquote class="example"><pre>
<span class="name">f</span> = <span class="name">open</span>(<span class="string">'mano.txt'</span>)
<span class="name">first_line</span> = <span class="name">f</span>.<span class="name">readline</span>()
<span class="keyword">for</span> <span class="name">line</span> <span class="keyword">in</span> <span class="name">f</span>:
    <span class="keyword">print</span> <span class="name">line</span>.<span class="name">rstrip</span>().<span class="name">upper</span>()
<span class="name">f</span>.<span class="name">close</span>()
</pre></blockquote>

<blockquote class="example"><pre>
<span class="name">f</span> = <span class="name">open</span>(<span class="string">'tavo.txt'</span>, <span class="string">'w'</span>)
<span class="name">f</span>.<span class="name">write</span>(<span class="string">"eilute\n"</span>)
<span class="keyword">for</span> <span class="name">x</span> <span class="keyword">in</span> <span class="name">range</span>(<span class="number">5</span>):
    <span class="keyword">print</span> &gt;&gt; <span class="name">f</span>, <span class="name">x</span>
<span class="name">f</span>.<span class="name">close</span>()
</pre></blockquote>

<p>Moduliai</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">datetime</span>
<span class="name">dt</span> = <span class="name">datetime</span>.<span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">7</span>)
<span class="keyword">print</span> <span class="name">dt</span>.<span class="name">year</span>  <span class="comment"># 2004</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">from</span> <span class="name">datetime</span> <span class="keyword">import</span> <span class="name">date</span>
<span class="name">dt</span> = <span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">7</span>)
<span class="keyword">print</span> <span class="name">dt</span>.<span class="name">year</span>  <span class="comment"># 2004</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">manomodulis</span>
<span class="comment"># ieškos failo manomodulis.py dabartiniame kataloge</span>
<span class="comment"># arba kataloguose, išvardintuose PYTHONPATH aplinkos kintamajame</span>
</pre></blockquote>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">manopaketas</span>.<span class="name">manomodulis</span>
<span class="comment"># ieškos katalogo manopaketas su failu manomodulis.py dabartiniame kataloge</span>
<span class="comment"># arba kataloguose, išvardintuose PYTHONPATH aplinkos kintamajame</span>
<span class="comment"># kataloge manopaketas turi būti failas __init__.py (jis gali būti tuščias)</span>
</pre></blockquote>

