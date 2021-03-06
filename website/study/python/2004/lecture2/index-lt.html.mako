<%inherit file="_templates/site.mako" />
<%def name="title()">Antroji paskaita (2004-09-13)</%def>
<%def name="short_title()">2</%def>

<h2>Viskas yra objektai</h2>

<p>Python yra objektinė kalba.  Jūs ne tik kad galite apsirašyti savo klases,
bet beveik visi Pythone sutinkami dalykai jau yra objektai -- skaičiai,
simbolių eilutės, sąrašai, funkcijos, klasės, objektai, metodai, moduliai.</p>

<p>Kas yra <em>objektas</em>?  Bet kas, ką galima priskirti kintamajam, arba
perduoti kaip argumentą funkcijai.  Objektai turi metodus ir atributus --
metodus galima iškviesti, atributų reikšmes galima pasižiūrėti arba
pakeisti.</p>

<blockquote class="example"><pre>
<span class="name">x</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]           <span class="comment"># sąrašas yra objektas, jį galime priskirti kintamajam</span>
<span class="name">x</span>.<span class="name">append</span>(<span class="number">5</span>)             <span class="comment"># jis turi metodų</span>
</pre></blockquote>

<p><code class="name">datetime</code> yra modulis (vienas iš Python 2.3
standartinės bibliotekos modulių).  Moduliai taip pat yra objektai.  Modulių
atributai yra visi kintamieji, funkcijos bei klasės, aprašytos modulyje.
</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">datetime</span>
<span class="name">dt</span> = <span class="name">datetime</span>.<span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">13</span>)
<span class="keyword">print</span> <span class="name">dt</span>.<span class="name">year</span>           <span class="comment"># 2004</span>
<span class="keyword">print</span> <span class="name">dt</span>.<span class="name">weekday</span>()      <span class="comment"># savaitės diena (0 - pirmadienis, 6 - sekmadienis)</span>
</pre></blockquote>
<p>
<code><span class="name">datetime</span>.<span class="name">date</span></code>
yra klasė.  Kintamajam <code class="name">dt</code> priskiriamas šios klasės
egzempliorius.  Matome, kad <code class="name">date</code> klasės egzempliorai
turi ir atributų, ir metodų.</p>

<p>Klasės taip pat objektai.  Klasių egzemplioriai sukuriami iškviečiant klasę
kaip funkciją.</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">datetime</span>
<span class="name">cls</span> = <span class="name">datetime</span>.<span class="name">date</span>
<span class="name">dt</span> = <span class="name">cls</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">13</span>)
</pre></blockquote>

<p>Funkcijos irgi objektai.  Jas galima priskyrinėti kintamiesiems ir paskui
iškvietinėti.</p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">math</span>
<span class="name">fn</span> = <span class="name">math</span>.<span class="name">sin</span>
<span class="keyword">print</span> <span class="name">fn</span>(<span class="number">0</span>)             <span class="comment"># 0.0</span>
<span class="name">fn</span> = <span class="name">math</span>.<span class="name">cos</span>
<span class="keyword">print</span> <span class="name">fn</span>(<span class="number">0</span>)             <span class="comment"># 1.0</span>
</pre></blockquote>

<p>Objektų metodai irgi yra objektai -- labai panašūs į funkcijas.</p>

<blockquote class="example"><pre>
<span class="name">a</span> = <span class="string">'labas'</span>.<span class="name">upper</span>
<span class="name">b</span> = <span class="string">'rytas'</span>.<span class="name">capitalize</span>
<span class="keyword">print</span> <span class="name">a</span>(), <span class="name">b</span>()          <span class="comment"># LABAS Rytas</span>
</pre></blockquote>

<p>Tiesą sakant, skirtumas tarp objektų metodų ir atributų yra labai nežymus.</p>
<p></p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">global_function</span>():
    <span class="keyword">print</span> <span class="string">"global_function()"</span>

<span class="def">class</span> <span class="name">MyClass</span>:

    <span class="def">def</span> <span class="name">method</span>(<span class="name">self</span>):
        <span class="keyword">print</span> <span class="string">"method()"</span>
        <span class="keyword">print</span> <span class="name">self</span>.<span class="name">n</span>

<span class="name">obj</span> = <span class="name">MyClass</span>()
<span class="name">obj</span>.<span class="name">n</span> = <span class="number">43</span>                  <span class="comment"># atributas, kurio reikšmė - skaičius</span>
<span class="name">obj</span>.<span class="name">f</span> = <span class="name">global_function</span>     <span class="comment"># atributas, kurio reikšmė - funkcija</span>

<span class="name">obj</span>.<span class="name">method</span>()                <span class="comment"># kviečiam metodą</span>
<span class="name">obj</span>.<span class="name">f</span>()                     <span class="comment"># kviečiam funkciją</span>
</pre></blockquote>

<p>Kai kviečiame metodą, jis gauna argumentą <code class="name">self</code>,
kai kviečiame funkciją, priskirtą objekto atributui, funkcija šio argumento
negauna.</p>

<blockquote class="example"><pre>
<span class="keyword">from</span> <span class="name">datetime</span> <span class="keyword">import</span> <span class="name">date</span>
<span class="name">a_date</span> = <span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">14</span>)
<span class="name">another_date</span> = <span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">15</span>)

<span class="name">bound_method</span> = <span class="name">a_date</span>.<span class="name">weekday</span>   <span class="comment"># objekto atributas -- susietas metodas</span>
<span class="name">unbound_method</span> = <span class="name">date</span>.<span class="name">weekday</span>   <span class="comment"># klasės atributas -- nesusietas metodas</span>

<span class="keyword">print</span> <span class="name">bound_method</span>()            <span class="comment"># susietas metodas žino self reikšmę</span>
<span class="keyword">print</span> <span class="name">unbound_method</span>(<span class="name">a_date</span>)    <span class="comment"># nesusietam metodui reikia nurodyti self</span>
</pre></blockquote>

<p>Galima funkciją paversti metodu:</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">global_function</span>(<span class="name">self</span>):
    <span class="keyword">print</span> <span class="name">self</span>.<span class="name">n</span>

<span class="def">class</span> <span class="name">MyClass</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>, <span class="name">n</span>):      <span class="comment"># konstruktorius</span>
        <span class="name">self</span>.<span class="name">n</span> = <span class="name">n</span>

    <span class="def">def</span> <span class="name">method</span>(<span class="name">self</span>):
        <span class="keyword">print</span> <span class="name">self</span>.<span class="name">n</span>

<span class="name">obj</span> = <span class="name">MyClass</span>(<span class="number">42</span>)
<span class="name">obj</span>.<span class="name">method</span>()                    <span class="comment"># spausdins 42</span>
<span class="name">MyClass</span>.<span class="name">f</span> = <span class="name">global_function</span>     <span class="comment"># priskiriame atributą klasei, o ne objektui</span>
<span class="name">obj</span>.<span class="name">f</span>()                         <span class="comment"># visi tos klasės objektai įgauna naują metodą</span>
</pre></blockquote>

<h3>Introspekcija</h3>

<p>Kai turime bet kokį objektą, galime sužinoti visus jo atributus ir
metodus.</p>

<blockquote class="example"><pre>
<span class="name">x</span> = <span class="string">"labas"</span>
<span class="keyword">print</span> <span class="name">dir</span>(<span class="name">x</span>)        <span class="comment"># atspausdins krūvą metodų, tarp jų ir 'upper'</span>
<span class="name">y</span> = <span class="number">42</span>
<span class="keyword">print</span> <span class="name">dir</span>(<span class="name">x</span>)        <span class="comment"># atspausdins krūvą specialių metodų, realizuojančių</span>
                    <span class="comment"># aritmetines ir kitas operacijas</span>
</pre></blockquote>

<p>Gauti objekto atributą žinant jo vardą galima su funkcija <code class="name">getattr</code></p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">datetime</span>
<span class="name">a_date</span> = <span class="name">datetime</span>.<span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">11</span>)
<span class="name">attribute</span> = <span class="string">'year'</span>
<span class="keyword">print</span> <span class="name">getattr</span>(<span class="name">a_date</span>, <span class="name">attribute</span>)
</pre></blockquote>

<p>Patikrinti, ar objektas yra iškviečiamas, galime su funkcija <code class="name">callable</code>.  Iškviečiami objektai yra funkcijos, metodai,
klasės, o taip pat klasių egzemplioriai, turintys metodą su specialiu
pavadinimu <code class="name">__call__</code>.</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">methods_of_an_object</span>(<span class="name">obj</span>):
    <span class="name">methods</span> = []
    <span class="keyword">for</span> <span class="name">name</span> <span class="keyword">in</span> <span class="name">dir</span>(<span class="name">obj</span>):
        <span class="name">attribute</span> = <span class="name">getattr</span>(<span class="name">obj</span>, <span class="name">name</span>)
        <span class="keyword">if</span> <span class="name">callable</span>(<span class="name">attribute</span>):
            <span class="name">methods</span>.<span class="name">append</span>(<span class="name">name</span>)
    <span class="keyword">return</span> <span class="name">methods</span>

<span class="keyword">import</span> <span class="name">datetime</span>
<span class="keyword">print</span> <span class="name">methods_of_an_object</span>(<span class="name">datetime</span>.<span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">8</span>))
<span class="comment"># Spausdins metodus tokius kaip weekday, bet neminės atributų, tokių kaip year</span>
</pre></blockquote>

<p>Galima tai užrašyti trumpiau, pritaikius konstrukciją, angliškai vadinama
<em>list comprehension</em></p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">methods_of_an_object</span>(<span class="name">obj</span>):
    <span class="keyword">return</span> [<span class="name">name</span> <span class="keyword">for</span> <span class="name">name</span> <span class="keyword">in</span> <span class="name">dir</span>(<span class="name">obj</span>) <span class="keyword">if</span> <span class="name">callable</span>(<span class="name">getattr</span>(<span class="name">obj</span>, <span class="name">name</span>))]

<span class="keyword">import</span> <span class="name">datetime</span>
<span class="keyword">print</span> <span class="name">methods_of_an_object</span>(<span class="name">datetime</span>.<span class="name">date</span>(<span class="number">2004</span>, <span class="number">9</span>, <span class="number">8</span>))
<span class="comment"># Spausdins metodus tokius kaip weekday, bet neminės atributų, tokių kaip year</span>
</pre></blockquote>

<p>Klasių, funkcijų bei metodų dokumentacija pasiekiama kaip atributas
<code class="name">__doc__</code></p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">sum</span>(<span class="name">x</span>, <span class="name">y</span>):
    <span class="string">""</span><span class="string">"Return the sum of two arguments"</span><span class="string">""</span>
    <span class="keyword">return</span> <span class="name">x</span> + <span class="name">y</span>

<span class="keyword">print</span> <span class="name">sum</span>.<span class="name">__doc__</span>
</pre></blockquote>

<p>Vadinasi, turint bet kokį objektą (modulį, klasę, funkciją) galima sukurti
jo aprašymą, mininti to objekto atributus, metodus ir tų metodų dokumentaciją.
Pythonas jau turi tokią funkciją -- <code class="name">help</code></p>

<blockquote class="example"><pre>
<span class="keyword">import</span> <span class="name">sys</span>
<span class="name">help</span>(<span class="name">sys</span>)           <span class="comment"># sys modulio dokumentacija</span>
<span class="name">help</span>(<span class="name">str</span>)           <span class="comment"># str klasės dokumentacija</span>
</pre></blockquote>

<p>Ši dokumentacija taip pat pasiekiama iš komandų eilutės, naudojant programą
<code>pydoc</code></p>

<h3>Vardai ir objektai</h3>

<p>Python kintamieji (o taip pat ir atributai) iš tiesų tėra tik vardai,
priskirti objektams.  Tam pačiam objektui galima priskirti kelis vardus:</p>

<blockquote class="example"><pre>
<span class="name">x</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]
<span class="name">y</span> = <span class="name">x</span>               <span class="comment"># sąrašas [1, 2, 3] turi du vardus -- x ir y</span>
<span class="name">z</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]       <span class="comment"># kitas sąrašas su tokiu pat turiniu turi vardą z</span>
<span class="name">x</span>.<span class="name">append</span>(<span class="number">4</span>)         <span class="comment"># pakeičiame sąrašą</span>
<span class="keyword">print</span> <span class="name">x</span>             <span class="comment"># spausdins [1, 2, 3, 4]</span>
<span class="keyword">print</span> <span class="name">y</span>             <span class="comment"># spausdins [1, 2, 3, 4], nes tai tas pats objektas</span>
<span class="keyword">print</span> <span class="name">z</span>             <span class="comment"># spausdins [1, 2, 3], nes tai kitas objektas</span>
</pre></blockquote>

<p>Objektus galima kopijuoti</p>

<blockquote class="example"><pre>
<span class="name">x</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]
<span class="name">y</span> = <span class="name">list</span>(<span class="name">x</span>)         <span class="comment"># sąrašo x kopija; dar tai galima užrašyti y = x[:]</span>
<span class="name">x</span>.<span class="name">append</span>(<span class="number">4</span>)         <span class="comment"># pakeičiame sąrašą</span>
<span class="keyword">print</span> <span class="name">x</span>             <span class="comment"># spausdins [1, 2, 3, 4]</span>
<span class="keyword">print</span> <span class="name">y</span>             <span class="comment"># spausdins [1, 2, 3], nes tai kitas objektas</span>
</pre></blockquote>

<p>Standartinėje bibliotekoje yra modulis <code class="name">copy</code>,
leidžiantis kopijuoti gilius objektų grafus.  Praktikoje jo prireikia labai
retai.</p>

<p>Objektus galima lyginti pagal jų reikšmę, arba pagal jų identitetą</p>

<blockquote class="example"><pre>
<span class="name">x</span> = [<span class="number">1</span>, <span class="number">2</span>, <span class="number">3</span>]
<span class="name">y</span> = <span class="name">x</span>
<span class="name">z</span> = <span class="name">list</span>(<span class="name">x</span>)
<span class="keyword">print</span> <span class="name">x</span> == <span class="name">y</span>        <span class="comment"># True</span>
<span class="keyword">print</span> <span class="name">x</span> == <span class="name">z</span>        <span class="comment"># True</span>
<span class="keyword">print</span> <span class="name">x</span> <span class="keyword">is</span> <span class="name">y</span>        <span class="comment"># True, nes tai tas pats objektas</span>
<span class="keyword">print</span> <span class="name">x</span> <span class="keyword">is</span> <span class="name">z</span>        <span class="comment"># False, nes tai skirtingi objektai</span>
</pre></blockquote>

<h3>None</h3>

<p>Pythonas turi konstantą <code class="name">None</code>, kuri daugmaž
atitinka SQLo bei C/C++ NULL arba Paskalio nil.  Ši konstanta -- vienintėlis
egzistuojantis NoneType klasės objektas.  Idiomatiškas palyginimas, ar
kintamojo reikšmė yra <code class="name">None</code>, yra
</p>

<blockquote class="example"><pre>
<span class="keyword">if</span> <span class="name">obj</span> <span class="keyword">is</span> <span class="name">None</span>:
    <span class="keyword">print</span> <span class="string">"None"</span>
<span class="keyword">else</span>:
    <span class="keyword">print</span> <span class="string">"ne None"</span>
</pre></blockquote>

<p><code class="name">None</code> dažnai naudojama kaip nutylėta (angl. <em>default</em>) funkcijos
argumento reikšmė</p>

<blockquote class="example"><pre>
<span class="def">def</span> <span class="name">trikampis</span>(<span class="name">a</span>, <span class="name">b</span>, <span class="name">c</span>=<span class="name">None</span>):
    <span class="string">""</span><span class="string">"Skaičiuoja trikampio su kraštinėmis a, b ir c plotą.

    Jei kraštinė c nenurodyta, laikoma, kad a ir b yra stataus trikampio
    statiniai, ir įžambinė c suskaičiuojama automatiškai.
    "</span><span class="string">""</span>
    <span class="keyword">if</span> <span class="name">c</span> <span class="keyword">is</span> <span class="name">None</span>:
        <span class="name">c</span> = (<span class="name">a</span> ** <span class="number">2</span> + <span class="name">b</span> ** <span class="number">2</span>) ** <span class="number">0.5</span>
    <span class="name">s</span> = (<span class="name">a</span> + <span class="name">b</span> + <span class="name">c</span>) / <span class="number">2.0</span>
    <span class="keyword">return</span> (<span class="name">s</span> * (<span class="name">s</span> - <span class="name">a</span>) * (<span class="name">s</span> - <span class="name">b</span>) * (<span class="name">s</span> - <span class="name">c</span>)) ** <span class="number">0.5</span>
</pre></blockquote>

<h3>Specialūs metodai</h3>

<p>Tarkime, kad jūs turite klasę <code class="name">Vector</code>.  Kaip
paaiškinti Pythonui, kaip reikia lyginti vektorius?</p>

<blockquote class="example"><pre>
<span class="def">class</span> <span class="name">Vector</span>:

    <span class="def">def</span> <span class="name">__init__</span>(<span class="name">self</span>, <span class="name">x</span>, <span class="name">y</span>):
        <span class="name">self</span>.<span class="name">x</span> = <span class="name">x</span>
        <span class="name">self</span>.<span class="name">y</span> = <span class="name">y</span>

    <span class="def">def</span> <span class="name">__eq__</span>(<span class="name">self</span>, <span class="name">other</span>):
        <span class="string">""</span><span class="string">"v1 == v2"</span><span class="string">""</span>
        <span class="keyword">return</span> <span class="name">self</span>.<span class="name">x</span> == <span class="name">other</span>.<span class="name">x</span> <span class="keyword">and</span> <span class="name">self</span>.<span class="name">y</span> == <span class="name">other</span>.<span class="name">y</span>

    <span class="def">def</span> <span class="name">__ne__</span>(<span class="name">self</span>, <span class="name">other</span>):
        <span class="string">""</span><span class="string">"v1 != v2"</span><span class="string">""</span>
        <span class="keyword">return</span> <span class="name">self</span>.<span class="name">x</span> != <span class="name">other</span>.<span class="name">x</span> <span class="keyword">or</span> <span class="name">self</span>.<span class="name">y</span> != <span class="name">other</span>.<span class="name">y</span>
        <span class="comment"># arba</span>
        <span class="comment">#   return not self == other</span>
        <span class="comment"># arba</span>
        <span class="comment">#   return not self.__eq__(other)</span>

</pre></blockquote>

<p>Jei neaprašysime metodo <code class="name">__eq__</code>, Pytonas lygins
vektorius pagal identitetą.</p>

<p>Yra nemažas rinkinys operatorių, kuriuos galima realizuoti aprašant metodus
specialiais vardais -- <code class="name">__add__</code>, <code class="name">__sub__</code>, <code class="name">__mul__</code>, <code class="name">__div__</code>, <code class="name">__mod__</code> ir taip
toliau.  Pilną jų sąrašą rasite <a href="http://python.org/doc/current/ref/specialnames.html">Python
  dokumentacijoje</a>.  </p>


<h3>Kintami bei nekintami objektai</h3>

<p>Kai kuriuos objektus galima keisti (pvz., aukščiau aprašytos <code class="name">Vector</code> klasės objektams galime pakeisti atributo
<code class="name">x</code> reikšmę) -- jie yra kintami (angl.
<em>mutable</em>).  Kitų objektų keisti negalima (pvz., simbolių eilučių,
skaičių, tuplų, datų) -- jie yra nekintami (angl. <em>immutable</em>).
</p>

<p>Su nekintamais objektais dirbti paprasčiau -- nereikia kvaršinti galvos,
ar jie priskirti tik vienam, ar keliems kintamiesiems, kaip kad reikėjo
pavyzdyje su sąrašais.</p>

<p>Tik nekintamus objektus galima naudoti kaip žodynų raktus.</p>


<!--
<h3>Truputis funkcinio programavimo</h3>

Jėgų nebeturiu
-->
