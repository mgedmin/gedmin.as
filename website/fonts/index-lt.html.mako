<%%inherit file="_templates/site.mako" />
<%def name="title()">Lietuviški šriftai xdosemu</%def>
<%def name="short_title()">Fonts</%def>

<h2>Lietuviški šriftai xdosemu</h2>

<p>Čia pora nelabai gražių šriftų, skirtų xdosemu.  Tai tiesiog
standartinis vga11x19 šriftas, kuriame su bdfeditu reikiamose vietose įstatytos
lietuviškos raidės.
</p>

<p>Diegimo instrukcija: įmeskite PCF failus į X11 šriftų katalogą
(pvz., <tt>/usr/X11R6/lib/X11/fonts/misc/</tt>) ir paleiskite
<tt>mkfontdir</tt>.  Tuomet galite į <tt>dosemu.conf</tt> failą įrašyti
</p>
<blockquote class="example"><pre>
$_X_font = "vga11x19-cp775"
</pre></blockquote>
<p>arba</p>
<blockquote class="example"><pre>
$_X_font = "vga11x19-cp773"
</pre></blockquote>

<p>Viskas viename faile</p>

<ul>
  <li><a href="vga11x19-lt.tar.gz">vga11x19-lt.tar.gz (22K)</a> </li>
</ul>

<p>Šriftai PCF formatu</p>

<ul>
  <li> <a href="vga11x19-cp773.pcf.gz">vga11x19-cp773.pcf.gz (6K)</a> </li>
  <li> <a href="vga11x19-cp775.pcf.gz">vga11x19-cp775.pcf.gz (6K)</a> </li>
</ul>

<p>Šriftai BDF formatu</p>

<ul>
  <li> <a href="vga11x19-cp773.bdf.gz">vga11x19-cp773.bdf.gz (5K)</a> </li>
  <li> <a href="vga11x19-cp775.bdf.gz">vga11x19-cp775.bdf.gz (5K)</a> </li>
</ul>
