<%inherit file="_templates/site.mako" />
<%def name="title()">Lithuanian fonts for xdosemu</%def>
<%def name="short_title()">Fonts</%def>

<h2>Lithuanian fonts for xdosemu</h2>

<p>Here you'll find a couple of (not very nice) fonts for xdosemu.
It's just a standard vga11x19 font edited with bdfedit to add Lithuanian
letters.
</p>

<p>Installation: save the PCF files to your X11 font directory
(e.g. <tt>/usr/X11R6/lib/X11/fonts/misc/</tt>) and run <tt>mkfontdir</tt>.
Then edit <tt>dosemu.conf</tt> to contain
</p>
<blockquote class="example"><pre>
$_X_font = "vga11x19-cp775"
</pre></blockquote>
<p>or</p>
<blockquote class="example"><pre>
$_X_font = "vga11x19-cp773"
</pre></blockquote>

<p>Everything in one file</p>

<ul>
  <li><a href="vga11x19-lt.tar.gz">vga11x19-lt.tar.gz (22K)</a> </li>
</ul>

<p>Fonts in PCF format</p>

<ul>
  <li> <a href="vga11x19-cp773.pcf.gz">vga11x19-cp773.pcf.gz (6K)</a> </li>
  <li> <a href="vga11x19-cp775.pcf.gz">vga11x19-cp775.pcf.gz (6K)</a> </li>
</ul>

<p>Fonts in BDF format</p>

<ul>
  <li> <a href="vga11x19-cp773.bdf.gz">vga11x19-cp773.bdf.gz (5K)</a> </li>
  <li> <a href="vga11x19-cp775.bdf.gz">vga11x19-cp775.bdf.gz (5K)</a> </li>
</ul>
