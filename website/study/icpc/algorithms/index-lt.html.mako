<%inherit file="_templates/site.mako" />
<%def name="title()">Algoritmai</%def>
<%def name="short_title()">algoritmai</%def>

<div class="news toolbox shadow"><div class="inner">
<h2>Turinys</h2>
<ul>
  <li><a href="#dfs">Paieška į gylį (<abbr title="Depth-First Search">DFS</abbr>)</a></li>
  <li><a href="#bfs">Paieška į plotį (<abbr title="Breadth-First Search">BFS</abbr>)</a></li>
  <li><a href="#topological-sort">Topologinis rikiavimas</a></li>
  <li><a href="#scc">Stipriai susietų komponenčių radimas</a></li>
  <li><a href="#kruskal">Kruskalo algoritmas</a></li>
  <li><a href="#prim">Primo algoritmas</a></li>
  <li><a href="#dijkstra">Dijkstros algoritmas</a></li>
  <li><a href="#bellman-ford">Bellmano-Fordo algoritmas</a></li>
  <li><a href="#dag-shortest-path">Trumpiausio kelio radimas <abbr title="Directed Acyclic Graph">DAG</abbr>e</a></li>
  <li><a href="#floyd-warshall">Floydo-Warshallo algoritmas</a></li>
  <li><a href="#edmonds-karp">Edmondso-Karpo algoritmas</a></li>
</ul>
</div></div>

<h2>Algoritmai</h2>

<p>Pastaba: tai dar ankstyva versija, galinti turėti klaidų.</p>

<p>Tai yra trumpi konspektai, tinkami pasikartojimui, bet nelabai tinkami
mokymuisi.  Šie algoritmai daug geriau išdėstyti Cormen, Leiserson, Rivest
knygoje <em>Introduction to Algorithms</em>.  Paskaitų metu galiu pasistengti
juos išdėstyti.</p>

<h3>Žymėjimai</h3>

<p>Algoritmai užrašyti pseudokodu, kuris, beje, labai primena <a href="http://www.python.org/">Python</a> programavimo kalbą.</p>

<p>Skaitytojas turėtų būti susipažinęs su grafų teorijos pagrindais.</p>

<p>Raide <code>G</code> dažnai bus žymimas pradinis grafas, raidėmis
<code>V</code> ir <code>E</code> -- atitinkamai jo viršūnių ir briaunų aibės.
Užrašas <code>adj(u)</code> reiškia visų viršūnių, gretimų <code>u</code> aibę
(<code>adj(u) = {v : (u -&gt; v) in E}</code>).  Svoriniame grafe briaunos
<code>(u -&gt; v)</code> svorį žymėsime <code>weight[u, v]</code>.</p>

<p>Raide <code>Q</code> paprastai žymima <em>eilė</em>.  Eilė -- abstraktus
duomenų tipas, turintis tris operacijas: <code>enqueue</code> prideda elementą
į eilės galą, <code>dequeue</code> ištraukia elementą iš eilės pradžios,
<code>is not empty</code> patikrina, ar eilė nėra tuščia.</p>

Algoritmų efektyvumas užrašomas <a href="../analysis/index-lt.html">asimptotine
notacija</a>.  Pvz., užrašas O(|V|<sup>2</sup>) reiškia, jog padvigubinus
pradinio grafo viršūnių skaičių, algoritmo veikimo laikas padidės keturgubai,
t.y. kvadratu.

<a name="dynamic-programming"><h3>Dinaminis programavimas</h3></a>

<p>Tai - ne algoritmas, o greičiau užduočių sprendimo strategija.  Ji aprašyta
<a href="../dynamic-programming">atskirame puslapyje</a>.</p>

<a name="dfs"><h3>Paieška į gylį (Depth First Search)</h3></a>

<p>Taikymų pavyzdžiai: patikrinti, ar grafas jungus, identifikuoti neorientuoto
grafo jungumo komponentes, patikrinti, ar egzistuoja kelias grafe iš viršūnės
<code>u</code> iki viršūnės <code>v</code>.</p>

<pre class="example">
def DFS(G):

    def visit(u):
        visited[u] = True
        for v in adj(u):
            if not visited[v]:
                parent[v] = u
                visit(v)

    for u in V:
        visited[u] = False
        parent[u] = None
    for u in V:
        if not visited[u]:
            visit(u)

    return parent, visited
</pre>

<p>Grafas yra jungus, jei išoriniame cikle sąlyga <code>if not
visited[u]</code> bus patenkinta ne daugiau nei vieną kartą.</p>

<p>Masyvas <code>parent</code> sudaro medį (jei grafas jungus) arba mišką (jei
ne).  Kiekvienas miško medis atitinka atskirą jungumo komponentę.</p>

<p>Jei norime tik sužinoti, kurias viršūnes galima pasiekti iš viršūnės
<code>s</code>, galime apsieiti be išorinio ciklo ir tiesiog iškviesti
<code>visit(s)</code>.  Tuomet <code>visited</code> masyvas nurodys visas
pasiekiamas viršūnes.</p>

<p>Efektyvumas -- O(|V|+|E|)</p>

<a name="bfs"><h3>Paieška į plotį (Breadth First Search)</h3></a>

<p>Taikymų pavyzdžiai: rasti trumpiausią kelią iš viršūnės <code>s</code> iki
visų kitų viršūnių, kai visų briaunų svoriai vienodi.</p>

<pre class="example">
def BFS(G, s):
    for u in V:
        visited[u] = False
        parent[u] = None
        distance[u] = Infinity
    visited[s] = True
    distance[s] = 0
    Q = [s]
    while Q is not empty:
        u = Q.dequeue()
        for v in adj(u):
            if not visited[v]:
                visited[v] = True
                parent[v] = u
                distance[v] = distance[u] + 1
                Q.enqueue(v)

    return parent, visited, distance
</pre>

<p>Masyvas <code>visited</code> nurodo, kurios viršūnės yra pasiekiamos.</p>

<p>Masyvas <code>distance</code> nurodo trumpiausių kelio ilgius.</p>

<p>Masyvas <code>parent</code> aprašo trumpiausių kelių medį.  Trumpiausias
kelias iš viršūnės <code>s</code> į viršūnę <code>t</code> yra <code>s -&gt;
... parent[parent[parent[t]]] -&gt; parent[parent[t]] -&gt; parent[t] ... -&gt;
t</code>, jį reikia „išvynioti“ nuo galo.</p>

<p>Efektyvumas -- O(|V|+|E|)</p>

<a name="topological-sort"><h3>Topologinis rikiavimas (Topological
Sort)</h3></a>

<p>Taikymų pavyzdžiai: darbų rikiavimas pagal priklausomybes.</p>

<p>Grafo viršūnės atitinka darbus, briaunos -- priklausomybes tarp jų.  Jei
grafe yra briauna <code>u -&gt; v</code>, vadinasi, darbas <code>u</code>
turi būti atliktas prieš atliekant darbą <code>v</code>.  Grafas yra kryptinis
ir beciklis.</p>

<p>Algoritmo esmė: paieška į gylį.  Kai baigiame darbą su viršūne (aplankę
visas iš jos pasiekiamas viršūnes), dedame ją į rezultatų sąrašo pradžią.</p>

<pre class="example">
def TopologicalSort(G):

    def visit(u):
        visited[u] = True
        for v in adj(u):
            if not visited[v]:
                visit(v)
        <strong>result.insert_in_front(u)</strong>

    <strong>result = []</strong>
    for u in V:
        visited[u] = False
    for u in V:
        if not visited[u]:
            visit(u)
    <strong>return result</strong>
</pre>

<p>Efektyvumas -- O(|V|+|E|)</p>

<a name="scc"><h3>Stipriai susietų komponenčių radimas (Strongly Connected
Components)</h3></a>

<p>Kryptiniame grafe reikia surasti stipriai susietas komponentes -- viršūnių
poaibius, pasižyminčius tokiomis savybėmis:</p>
<ul>
  <li>iš kiekvienos poaibio viršūnės galima pasiekti bet kurią kitą to paties
      poaibio viršūnę ir</li>
  <li>poaibis yra maksimalus, t.y. prijungus bet kurią kitą viršūnę prie
      poaibio pirmoji savybė nebebus tenkinama.</li>
</ul>

<p>Algoritmo esmė: dvi paieškos į gylį.  Pirmoji analogiška topologiniam
rikiavimui.  Antroji daroma "topologine tvarka" (kabutėse, nes cikliniame grafe
topologinė tvarka neegzistuoja) atvirkštiniame grafe <code>G<sup>T</sup></code>
ir suranda stipriai susietas komponentes.</p>

<pre class="example">
def SCC(G):

    def visit1(u):
        visited[u] = True
        for v in adj(u):
            if not visited[v]:
                visit1(v)
        l.insert_in_front(u)

    def visit2(u):
        visited[u] = True
        component.add(u)
        for v in adj'(u):
            if not visited[v]:
                visit2(v)

    # rikiuojam viršūnes
    for u in V:
        visited[u] = False
    l = []
    for u in V:
        if not visited[u]:
            visit1(u)

    # randam komponentes
    for u in V:
        visited[u] = False
    components = []
    for u in l:
        if not visited[u]:
            component = []
            visit2(u)
            components.add(component)
    return components
</pre>

<p>Jei <code>adj(u) = {v : (u -&gt; v) in E}</code>, tai
       <code>adj'(u) = {v : (v -&gt; u) in E}</code>.</p>

<p>Efektyvumas -- O(|V|+|E|)</p>

<a name="kruskal"><h3>Minimalus jungiamasis medis: Kruskalo algoritmas</h3></a>

<p>Esmė: nagrinėjame visas briaunas svorių didėjimo tvarka.  Jei galime briauną
prijungti prie konstruojamo medžio (t.y. ją prijungus nesusidarys ciklas), ją
prijungiame, jei ne -- išmetame.</p>

<pre class="example">
def Kruskal(G):
    for u in V:
        make_set(u)
    tree = []
    for (u, v) in E, in order by nondecreasing weight[u, v]:
        if find_set(u) != find_set(v):
            union(u, v)
            tree.add((u, v))
    return tree
</pre>

<p>Naudojame <em>disjoint sets</em> duomenų struktūrą (operacijos make_set,
find_set, union).</p>

<p>Algoritmo efektyvumas: O(|E| log |E|).</p>

<a name="prim"><h3>Minimalus jungiamasis medis: Primo algoritmas</h3></a>

<pre class="example">
def Prim(G, r):
    for u in V:
        key[u] = Infinity
    key[r] = 0
    parent[r] = None
    while Q is not empty:
        u = Q.extract_min()
        for v in adj(u):
            if v in Q and weight[u, v] &lt; key[v]:
                parent[v] = u
                key[v] = weight[u, v]
    return parent
</pre>

<p>Viršūnė <code>r</code> bus sukonstruoto medžio šaknis.  Tai gali būti bet
kuri grafo viršūnė.</p>

<p>Efektyvumas priklauso nuo prioritetinės eilės realizacijos.  Naudodami
<em>binary heap</em> gausime O(|E| log |V|), naudodami <em>Fibonacci heap</em>
gausime O(|E| + |V| log |V|).</p>

<a name="dijkstra"><h3>Trumpiausio kelio paieška: Dijkstros algoritmas</h3></a>

<p>Taikymų pavyzdžiai: rasti trumpiausią kelią iš viršūnės <code>s</code> iki
visų kitų viršūnių, kai briaunų svoriai yra skirtingi.</p>

<p>Algoritmas neveikia, jei grafe yra neigiamo svorio ciklų.</p>

<p>Čia naudojama prioritetinė eilė.  Operacija <code>extract_min</code> suranda
elementą <code>u</code>, kurio svoris (<code>distance[u]</code>) yra
mažiausias.</p>

<pre class="example">
def Dijkstra(G, s):
    for u in V:
        parent[u] = None
        distance[u] = Infinity
    distance[s] = 0
    Q = V
    while Q is not empty:
        u = Q.extract_min()
        for v in adj(u):
            if distance[u] + weight[u, v] &lt; distance[v]:
                distance[v] = distance[u] + weight[u, v]
                parent[v] = u

    return parent, distance
</pre>

<p>Masyvas <code>distance</code> nurodo trumpiausių kelių ilgius.</p>

<p>Masyvas <code>parent</code> aprašo trumpiausių kelių medį.  Trumpiausias
kelias iš viršūnės <code>s</code> į viršūnę <code>t</code> yra <code>s -&gt;
... parent[parent[parent[t]]] -&gt; parent[parent[t]] -&gt; parent[t] ... -&gt;
t</code>, jį reikia „išvynioti“ nuo galo.</p>

<p>Efektyvumas priklauso nuo prioritetinės eilės realizacijos.  Ja pakeitus
paprastu perėjimu per viršūnes gausime O(|V|<sup>2</sup>), naudodami <em>binary
heap</em> gausime O(|E| log |V|), naudodami <em>Fibonacci heap</em> gausime
O(|E| + |V| log |V|).</p>

<a name="bellman-ford"><h3>Trumpiausio kelio paieška: Bellmano-Fordo
algoritmas</h3></a>

<p>Algoritmas rasti trumpiausią kelią iš viršūnės <code>s</code> iki
visų kitų viršūnių, kai briaunų svoriai yra skirtingi.</p>

<p>Algoritmas gali atpažinti neigiamo svorio ciklo egzistavimą.</p>

<pre class="example">
def BellmanFord(G, s):
    for u in V:
        distance[u] = Infinity
        parent[u] = None
    distance[s] = 0
    for i in 1 .. |V| - 1:
        for (u, v) in E:
            if distance[v] &gt; distance[u] + weight[u, v]:
                distance[v] = distance[u] + weight[u, v]
                parent[v] = u
    for (u, v) in E:
        if distance[v] &gt; distance[u] + weight[u, v]:
            raise "neigiamo svorio ciklas!"
    return distance, parent
</pre>

<p>Efektyvumas -- O(|V| |E|)</p>

<a name="dag-shortest-path"><h3>Trumpiausio kelio paieška becikliame
grafe</h3></a>

<p>Algoritmas rasti trumpiausią kelią iš viršūnės <code>s</code> iki
visų kitų viršūnių, kai briaunų svoriai yra skirtingi.</p>

<p>Grafas turi būti beciklis (<abbr title="Directed Acyclic Graph">DAG</abbr>'as).</p>

<pre class="example">
def DAGShortestPath(G, s):
    for u in V:
        distance[u] = Infinity
        parent[u] = None
    distance[s] = 0
    vertex_ordering = TopologicalSort(G)
    for u in vertex_ordering:
        for v in adj(u):
            if distance[v] &gt; distance[u] + weight[u, v]:
                distance[v] = distance[u] + weight[u, v]
                parent[v] = u
    return distance, parent
</pre>

<p>Efektyvumas -- O(|V|+|E|)</p>

<a name="floyd-warshall"><h3>Visų trumpiausių kelių paieška: Floyd-Warshall
algoritmas</h3></a>

<p>Algoritmas randa trumpiausių kelių ilgius tarp visų viršūnių porų.</p>

<p><code>weight[u, v]</code> -- briaunos (u -&gt; v) ilgis (jei tokia briauna
egzistuoja) arba begalybė (jei ne).  <code>weight[u, u]</code> = 0.</p>

<pre class="example">
def FloydWarshall(G, s):
    for u in V:
        for v in V:
            d[u, v] = weight[u, v]
    for w in V:
        for u in V:
            for v in V:
                d[u, v] = min(d[u, v], d[u, w] + d[w, v])
    return d
</pre>

<p>Efektyvumas -- O(|V|<sup>3</sup>)</p>

<a name="edmonds-karp"><h3>Maksimalus srautas: Edmonds-Karp algoritmas</h3></a>

<p>Edmundo-Karpo algoritmas yra platesnio Fordo-Fulkersono metodo taikymas.</p>

<p>G - grafas, s - šaltinio viršūnė, t - tikslo viršūnė, c[u, v] -- briaunos (u
-&gt; v) talpa.</p>

<pre class="example">
def EdmundKarp(G, s, t, c):
    for (u, v) in E:
         f[u, v] = f[v, u] = 0
    while True:

        # konstruojam liekamąjį grafą
        Eresidual = []
        for u in V:
            for v in V:
                cresidual[u, v] = c[u, v] - f[u, v]
                if cresidual[u, v] &gt; 0:
                    Eresidual += (u, v)
        Gresidual = (V, Eresidual)

        # ieškom jame trumpiausio kelio iš s į t
        parent, visited, distance = BFS(Gresidual, s)
        if not visited[t]:
            # jei kelio nėra, reiškia, srautas f jau maksimalus
            return f
        path = []
        v = t
        while v != s:
            u = parent[v]
            path += (u, v)
            v = u

        # randame jo talpą
        cpath = Infinity
        for (u, v) in path:
            cpath = min(cpath, cresidual[u, v])

        # plečiame srautą
        for (u, v) in path:
            f[u, v] += cpath
            f[v, u] = -f[u, v]
</pre>

<p>Efektyvumas -- O(|V| |E|<sup>2</sup>)</p>
