<%inherit file="_templates/site.mako" />
<%def name="title()">VU MIF informatikos magistrantams (2002 m. ruduo)</%def>
<%def name="short_title()">2002r</%def>
<%def name="extra_head()">
<style>
  .urgent { color: red; }
  .passed { color: gray; }
  .near   { color: orange; }
</style>
</%def>

<h2>VU MIF informatikos magistrantams</h2>
<h3>2002 m. rudens semestras</h2>
<p>Nuorodos</p>
<ul>
<li><a href="http://ieva.mif.vu.lt/mailman/listinfo/inf98/">INF98 pašto konferencija</a> (inf98 <em>at</em> ieva.mif.vu.lt)
<li><a href="http://www.mif.vu.lt/mif/st-m-inform.pdf">Studijų programa (PDF)</a>
<li><a href="http://www.mif.vu.lt/mif/tv2002rs/htm/inf5k1g.htm">1 gr. tvarkaraštis (2002 m. ruduo)</a>
<li><a href="http://www.mif.vu.lt/mif/tv2002rs/htm/inf5k2g.htm">2 gr. tvarkaraštis (2002 m. ruduo)</a>
</ul>
<p>Informacija</p>
<ul>
<li><a href="../physics">Rinktiniai fizikos skyriai</a>
<li><a href="../odb">Objektinės duomenų bazės</a>
<li><a href="../mpm">Mokymosi proceso modeliavimas</a>
<li><a href="../ood">Objektinės technologijos</a>
<li><a href="../disma">Diskrečioji matematika</a>
</ul>
<p>Dalykai</p>
<blockquote>
<table>
<tr><th>Dalykas</th>
    <th>Kred</th>
    <th>Egz?</th>
    <th colspan=3>Paskaitos</th>
    <th>Deadlainai</th>
</tr>
<tr><td title="(A. Orliukas)">Rinktiniai fizikos skyriai</td>
    <td>2</td>
    <td>Įsk</td>
    <td>III</td><td>17:00</td><td>(309)</td>
    <td><span class=passed>2002-12-18</span> (įskaita), <span class=passed>2002-12-23</span> (įskaita)</td>
</tr>
<tr><td title="(M. Bloznelis)">Rinktiniai matematikos skyriai</td>
    <td>2</td>
    <td>Įsk</td>
    <td>IV</td><td>18:45</td><td>(308)</td>
    <td><span class=passed>2002-12-21</span> (įskaita)</td>
</tr>
<tr><td title="(G. Skersys)">Diskrečioji matematika</td>
    <td>2</td>
    <td>Įsk</td>
    <td>IV</td><td>17:00</td><td>(308)</td>
    <td><span class=passed>2002-12-01<span></td>
</tr>
<tr><td title="Magistro tezių temos">Mokslo tiriamasis darbas</td>
    <td>2</td>
    <td>Įsk</td>
    <td colspan=3></td>
    <td><span class=passed>2002-12-16</span>, <span class=passed>2002-12-23</span></td>
</tr>
<tr><td title="(M. Plukas)">Objektinės technologijos</td>
    <td>4</td>
    <td>Egz</td>
    <td>II</td><td>15:00</td><td>(308)</td>
    <td><span class=passed>2002-11-21</span>, <span class=passed>2002-12-17</span></td>
</tr>
<tr><td><em>Alternatyviai pasirenkami dalykai</em> *</td>
    <td>3+3</td>
    <td>Egz</td>
    <td colspan=3></td>
    <td></td>
</tr>
<tr><td title="(A. Janeliūnas)">&nbsp;&nbsp;&nbsp;&nbsp;Objektinės duomenų bazės *</td>
    <td>3</td>
    <td>Egz</td>
    <td>V</td><td>15:00</td><td>(308)</td>
    <td><span class=passed>2002-12-15</span></td>
</tr>
<tr><td title="(E. Manstavičius)">&nbsp;&nbsp;&nbsp;&nbsp;Grafų teorija *</td>
    <td>3</td>
    <td>Egz</td>
    <td>I</td><td>17:00</td><td>(317)</td>
    <td></td>
</tr>
<tr><td title="(A. Dienys)">&nbsp;&nbsp;&nbsp;&nbsp;Programų sistemų kokybės valdymas *</td>
    <td>3</td>
    <td>Egz</td>
    <td>III</td><td>18:45</td><td>(309)</td>
    <td>?</td>
</tr>
<tr><td title="(A. Juozapavičius)">&nbsp;&nbsp;&nbsp;&nbsp;Duomenų struktūros ir algoritmai *</td>
    <td>3</td>
    <td>Egz</td>
    <td colspan=3>?</td>
<!--<td>II</td><td><span title="(1 grupei)">17:00</span>/<br><span title="(2 grupei)">18:45</span></td><td>(13)</td>-->
    <td>?</td>
</tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Simbolinio programavimo kalbos *</td>
    <td>3</td>
    <td>Egz</td>
    <td colspan=3>?</td>
    <td>?</td>
</tr>
<tr><td><em>Laisvai pasirenkamas dalykas</em> **</td>
    <td>2</td>
    <td>Įsk</td>
    <td colspan=3></td>
    <td></td>
</tr>
<tr><td title="(S. Zubė)">&nbsp;&nbsp;&nbsp;&nbsp;LaTeX **</td>
    <td>2</td>
    <td>Įsk</td>
    <td>III</td><td>13:00</td><td>(3, 8)</td>
    <td>?</td>
</tr>
<tr><td title="(Raudys)">&nbsp;&nbsp;&nbsp;&nbsp;Mokymosi procesų modeliavimas **</td>
    <td>2</td>
    <td>Įsk</td>
    <td colspan=3>(nebėra)</td>
    <td><span class=passed>2002-12-16</span> (įskaita)</td>
</tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Biokibernetika **</td>
    <td>3</td>
    <td>Įsk</td>
    <td>IV</td><td>7:30</td><td>?</td>
    <td><span class=passed>2002-12-20</span> (įskaita), <span class=passed>2002-12-23</span> (įskaita)</td>
</tr>
</table>
<blockquote>
* - alternatyviai pasirenkami dalykai <br>
** - laisvai pasirenkami dalykai
</blockquote>
</blockquote>
<p>Egzaminai</p>
<blockquote>
<table>
<tr><th>Data</th>
    <th>Dalykas</th>
</tr>
<tr><td>2003-01-06, 9 val.</td>
    <td title="(M. Plukas)">Objektinės technologijos</td>
</tr>
<tr><td>2003-01-10, 10 val.</td>
    <td title="(A. Janeliūnas)">Objektinės duomenų bazės</td>
</tr>
<tr><td>2003-01-17, 10 val.</td>
    <td title="(E. Manstavičius)">Grafų teorija</td>
</tr>
<tr><td>2003-01-21</td>
    <td title="(A. Juozapavičius)">Duomenų struktūros ir algoritmai</td>
</tr>
<tr><td>?</td>
    <td title="(A. Dienys)">Programų sistemų kokybės valdymas</td>
</tr>
<tr><td>?</td>
    <td>Simbolinio programavimo kalbos</td>
</tr>
</table>
</blockquote>
<p>Šiuo puslapiu rūpinasi Marius Gedminas (marius at gedmin.as; marius at pov.lt)</p>

