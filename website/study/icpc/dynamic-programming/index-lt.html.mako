<%inherit file="_templates/site.mako" />
<%def name="title()">Dinaminis programavimas</%def>
<%def name="short_title()">dinaminis programavimas</%def>

<h2>Dinaminis programavimas</h2>

<p><em>Dinaminis programavimas</em> (angl. <em>dynamic programming</em>) yra
gudrus triukas, panašus į „skaldyk ir valdyk“.  Priminsiu, kas yra „skaldyk ir
valdyk“: problema skaidoma į mažesnes dalis, tos dalys sprendžiamos
rekursyviai, mažesniųjų problemų sprendimai apjungiami ir gaunamas pirmosios
problemos sprendimas.  Tačiau kartais „skaldyk ir valdyk“ algoritmai būna labai
neefektyvūs.</p>

<div class="example">
Pavyzdys: Fibonačio skaičiai.  Jei tiesiog užrašysime rekursinę funkciją
<blockquote class="example"><pre>
function Fib(n: Integer): Integer;
begin
  Fib := Fib(n - 1) + Fib(n - 2);
end;
</pre></blockquote>
tai mūsų sprendimas bus labai neefektyvus, nes skaičiuos tas pačias Fib(n)
reikšmes po daugybę kartų.
</div>

<p>Dinaminį programavimą reikia taikyti, jei tos mažesnės problemos dalys
nėra nepriklausomos, o kertasi tarpusavyje.  Šio metodo esmė yra ta, kad
visos mažesnės problemos yra sprendžiamos ne daugiau nei vieną kartą, jų
sprendimai surašomi į lentelę ir vėliau naudojami didesnių subproblemų
sprendimams suskaičiuoti.</p>

<div class="example">
Pavyzdys: Fibonačio skaičiai -- rekursija su įsiminimu (angl.
<em>memoization</em>).
<blockquote class="example"><pre>
var
  FibTable: array[1..MaxN] of Integer;

function Fib(n: Integer): Integer;
begin
  if FibTable[n] = -1 then
    FibTable[n] := Fib(n - 1) + Fib(n - 2);
  Fib := FibTable[n];
end;

...

begin
  for n := 1 to MaxN do
    FibTable[n] := -1;
  FibTable[1] := 1;
  FibTable[2] := 1;
  ...
</pre></blockquote>
Jau geriau, bet šiek tiek griozdiška.
</div>

<div class="example">
Pavyzdys: Fibonačio skaičiai -- lentelės užpildymas „iš apačios į viršų“
<blockquote class="example"><pre>
var
  FibTable: array[1..MaxN] of Integer;

function Fib(n: Integer): Integer;
begin
  Fib := FibTable[n];
end;

...

begin
  FibTable[1] := 1;
  FibTable[2] := 1;
  for n := 3 to MaxN do
    FibTable[n] := FibTable[n - 1] + FibTable[n - 2];
  ...
</pre></blockquote>
</div>

<p>Dinaminis programavimas dažnai taikomas <em>optimizavimo uždaviniams</em>
spręsti.  Tokiuose uždaviniuose sprendimų gali būti daug, su kiekvienu
sprendimu yra susieta jo vertė, ir mes norime rasti sprendimą su optimalia
(didžiausia ar mažiausia) verte.  Beje, optimalių sprendimų gali būti daug;
mums tinka bet kuris iš jų.</p>

<p>Dinaminio programavimo taikymas:</p>
<ol>
  <li> Nustatome optimalaus sprendimo struktūrą. </li>
  <li> Išreiškiame optimalaus sprendimo vertę rekursyvia formule. </li>
  <li> Suskaičiuojame optimalaus sprendimo vertę „iš apačios į viršų“. </li>
  <li> Sukonstruojame patį optimalų sprendimą. </li>
</ol>

<p>Kartais mus domina tik optimalaus sprendimo vertė, bet ne jo struktūra.
Tuomet ketvirtą žingsnį galime praleisti.</p>
<p></p>

<div class="example">
Pavyzdys: 0-1-knapsack problem.

<p>Vagis įsigauna naktį į parduotuvę ir randa ten n daiktų.  Kiekvienas daiktas
vertas kažkiek litų ir sveria kažkiek kilogramų.  Vagis nori pasiimti kiek
galima vertingesnį krovinį, bet jis gali panešti tik W kilogramų.  Ką jis
turėtų pasiimti?  </p>

<p>Nesunku pamatyti, kad sprendimai yra visi aibės {1, ..., n} poaibiai, tad
jei perrinkinėsime visus įmanomus poaibius ir skaičiuosime jų vertę, mūsų
algoritmas bus neefektyvus -- O(2<sup>n</sup>).  </p>

<p>Galime bandyti pirma imti vertingiausius dalykus (žiūrėdami į jų vertę
arba vertės ir svorio santykį), bet nesunku sugalvoti pavyzdžių, rodančių,
jog ši „godi“ strategija ne visada duoda teisingą atsakymą.</p>

<p>Apibrėžkime optimalaus sprendimo vertę.  Pažymėkime daiktų vertes
v<sub>i</sub>, jų svorius w<sub>i</sub>, optimalaus sprendimo vertę, jei
nagrinėjame daiktus 1..j ir galime panešti k kilogramų V(j, k).  Skaičiuodami
V(j, k) turime du pasirinkimus:</p>
<ul>
  <li> j-tąjį daiktą palikti: tuomet iš j-1 daikto galime susirinkti krovinį,
       sveriantį k kilogramų -- t.y. V(j, k) = V(j-1, k).</li>
  <li> j-tąjį daiktą pasiimti: tuomet iš j-1 daiko galime susirinkti krovinį,
       sverianti k-w<sub>j</sub> kilogramų, ir prie jo vertės pridėti j-tojo
       daikto vertę v<sub>j</sub> -- t.y. V(j, k) = V(j-1, k-w<sub>j</sub>) +
       v<sub>j</sub>.</li>
</ul>
<p> Kadangi mes norime maksimizuoti V(j, k), turime paprastą rekursyvią
formulę</p>
<blockquote><p>
V(j, k) = max(V(j-1, k), V(j-1, k-w<sub>j</sub>) + v<sub>j</sub>)
<br />
V(0, k) = 0
</p></blockquote>
<p>Mums tereikia suskaičiuoti V(n, W) pasinaudojant įsiminimu arba užpildant
lentelę iš apačios į viršų.  Algoritmo efektyvumas -- O(nW).</p>
<blockquote class="example"><pre>
var
  V: array[0..MaxN, 0..MaxW] of Integer;
  Value, Weight: array[1..MaxN] of Integer;
  N, W, J, K: Integer;
begin
  ... perskaitom pradinius duomenis ...
  for K := 0 to W do
    V[0, K] := 0;
  for J := 1 to N do
    begin
      V[J, K] := V[J-1, K];
      if Weight[J] &lt;= K then
        V[J, K] := Max(V[J, K], V[J-1, K-Weight[J]] + Value[J]);
    end;
...
</pre></blockquote>

<p>Dabar turime optimalaus sprendimo vertę, bet kaip gauti patį sprendimą --
kuriuos būtent daiktus turime pasiimti?</p>

<p>Vienas būdas yra toks: pasiimame papildomą lentelę B[J, K] ir joje įrašome,
ar skaičiuodami V[J, K] reikšmę mes ėmėme j-tąjį daiktą, ar neėmėme:</p>
<blockquote class="example"><pre>
var
  B: array[0..MaxN, 0..MaxW] of Boolean;

...

  for J := 1 to N do
    begin
      V[J, K] := V[J-1, K];
      B[J, K] := False;
      if (Weight[J] &lt;= K) and
         (V[J-1, K-Weight[J]] + Value[J] &gt; V[J, K]) then
        begin
          V[J, K] := V[J-1, K-Weight[J]] + Value[J] &gt; V[J, K];
          B[J, K] := True;
        end;
    end;

...
</pre></blockquote>
<p>Turėdami šią lentelę galime lengvai sukonstruoti atsakymą pasinaudoję
rekursyvia funkcija</p><p></p>
<blockquote class="example"><pre>
procedure PrintAnswer(J, K: Integer);
begin
  if J &gt; 0 then
    begin
      if B[J, K] then
        begin
          PrintAnswer(J-1, K-Weight[J]);
          WriteLn('Imame daiktą ', J);
        end
      else
        PrintAnswer(J-1, K);
    end;
end;
</pre></blockquote>

<p>Taip pat galime sutaupyti vietos ir apsieiti be lentelės B.</p>
<blockquote class="example"><pre>
procedure PrintAnswer(J, K: Integer);
begin
  if J &gt; 0 then
    begin
      if V[J, K] &lt;&gt; V[J-1, K] then
        begin
          PrintAnswer(J-1, K-Weight[J]);
          WriteLn('Imame daiktą ', J);
        end
      else
        PrintAnswer(J-1, K);
    end;
end;
</pre></blockquote>

</div>
