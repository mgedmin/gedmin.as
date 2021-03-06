<%inherit file="_templates/site.mako" />
<%def name="title()">Lietuviško teksto perkodavimas</%def>
<%def name="short_title()">LTT</%def>

<h2>Lietuviško teksto perkodavimas</h2>

<h3>Kas tai?</h3>

<p> Senais tamsiais laikais buvo vartojama daug skirtingų kodavimo
lentelių lietuviškiems tekstams saugoti.  LTT (Lithuanian Text Tool) yra
programėlė, atliekanti dvi funkcijas: </p>

<ul><li>ji bando nustatyti, kokia lentele yra užkoduotas tekstas</li></ul>

<blockquote class="example"><pre class="small">
<strong>$ ltt index.in</strong>
index.in
Probability   Charset                                      Seen characters&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    57%  *!   Latin-7/ISO-8859-13/Baltic-RIM/ANSI-1257     .........ąč.ėįšųūž
    38%       771/773/KBL                                  ..š...ų.........ū.
     4%       Latin-4/ISO-8859-4/Latin-6/ISO-8859-10       ..........č.....ž.
  * -- file contains Lithuanian letters unique to this charset
  ! -- file contains no Lithuanian letters outside of this charset
</pre></blockquote>

<ul><li>ji gali perkoduoti lietuviškas raides iš vienos lentelės į kitą</li></ul>

<blockquote class="example"><pre class="small">
<strong>$ ltt -c latin-7 latin-4 index.in</strong>
Latin-7/ISO-8859-13/Baltic-RIM/ANSI-1257 -&gt; Latin-4/ISO-8859-4/Latin-6/ISO-8859-10:
index.in

<strong>$ ltt index.in</strong>
index.in
Probability   Charset                                      Seen characters
    66%  *!   Latin-4/ISO-8859-4/Latin-6/ISO-8859-10       .........±č.ģē¹łž¾
    16%       771/773/KBL                                  ...............ł..
    11%       Latin-7/ISO-8859-13/Baltic-RIM/ANSI-1257     ..........č......ž
     5%       772/774/775                                  .....¾............
  * -- file contains Lithuanian letters unique to this charset
  ! -- file contains no Lithuanian letters outside of this charset
</pre></blockquote>

<h3> Įvairios pastabos: </h3>

<ul>
<li> Perkoduojant keičiamos tik lietuviškos raidės </li>
<li> Palaikomos šios kodų lentelės:
     <ul>
       <li>772, 774, 775</li>
       <li>770 (dar vadinama IBM Baltic)</li>
       <li>771 (dar vadinama KBL), 773</li>
       <li>ISO-8859-13 (dar vadinama Latin-7), Windows-1257 (dar vadinama
           Baltic RIM)</li>
       <li>ISO-8859-4 (dar vadinama Latin-4), ISO-8859-10 (dar vadinama
           Latin-6)</li>
     </ul>
     Vienoje eilutėje surašytos lentelės, kuriose lietuviškų raidžių kodai
     yra tie patys. </li>
<li> Taip pat yra galimybė perkoduoti į „šveplą“ tekstą (deja,
     perkoduoti atgal nebepavyks...) </li>
<li> Programa su vartotoju bendrauja angliškai (aš keistas žmogus) </li>
<li> Programėlė parašyta Paskaliu.  Ją galima sukompiliuoti DOS,
     Windows bei Linux terpėse naudojant Turbo Pascal, Borland Delphi arba Free
     Pascal.  </li>
<li> Programa yra laisva ir nemokama, jos licencija -- <a href="COPYING">GNU
     GPL</a>.</li>
</ul>

<h3> Instrukcija </h3>

<blockquote class="example"><pre class="small">
<strong>$ ltt</strong>
Lithuanian Text Tool version 0.9.0
Copyright (c) 1999-2001 Marius Gedminas &lt;<del title="New email: marius@gedmin.as">mgedmin@b4net.lt</del>&gt;
This is Free Software.  See the GNU General Public Licence for details.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

Try to autodetect charset:
  ltt [-q] &lt;filename&gt;

      -q        quick mode: only check first kilobyte

Convert between charsets:
  ltt -c &lt;charset1&gt; &lt;charset2&gt; [-b &lt;ext&gt;] &lt;filename&gt; ...

      -b &lt;ext&gt;  create backup files with extension &lt;ext&gt;
                (&lt;ext&gt; should begin with a dot, e.g. -b .bak)

Use `-' instead of &lt;filename&gt; for standard input

Possible charset values:
  772 774 775
  770
  771 773 kbl
  lat7 latin-7 iso-8859-13 brim baltic-rim 1257
  lat4 latin-4 iso-8859-4 lat6 latin-6 iso-8859-10
You can also use `ascii' for &lt;charset2&gt;

Note: only 18 Lithuanian national letters are affected.
</pre></blockquote>

<h3> Parsisiuntimas </h3>

<p> LTT versija 0.9.0 </p>
<ul>
  <li> <a href="ltt.pas">ltt.pas</a> (16K) -- pradinis kodas </li>
  <li> <a href="COPYING">COPYING</a> (18K) -- licencija (GNU GPL v2) </li>
  <li> <a href="ltt-0.9.0.zip">ltt-0.9.0.zip</a> (51K) -- ZIP archyvas
     su pradiniu kodu bei sukompiliuotomis Windows ir DOS versijomis. </li>
  <li> <a href="ltt-0.9.0.tar.gz">ltt-0.9.0.tar.gz</a> (46K) -- TAR.GZ
     archyvas su pradiniu kodu bei sukompiliuota Linux versija. </li>
</ul>
<p> Linux </p>
<ul>
  <li> <a href="ltt">ltt</a> (79K) -- statinė ELF programa i386 architektūrai </li>
</ul>
<p> Windows </p>
<ul>
  <li> <a href="ltt32.exe">ltt32.exe</a> (51K) -- Win32 programa </li>
</ul>
<p> DOS </p>
<ul>
  <li> <a href="ltt16.exe">ltt16.exe</a> (13K) -- DOS programa </li>
</ul>
