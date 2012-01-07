<%inherit file="_templates/site.mako" />
<%def name="title()">Miscellaneous scripts</%def>
<%def name="short_title()">Misc</%def>

<h2>Miscellaneous scripts</h2>

<h3 id="test-lt">test-lt</h3>

<p>A couple of shell scripts that can diagnose most common problems with
Lithuanian computing environment.  One of them is for ISO 8859-13 locales,
another is for UTF-8 locales.  If you don't know which one you want,
most likely it's the ISO 8859-13 one.  Example output:
</p>

<blockquote class="example">
<pre>
$ sh test-lt.sh
--- Lokalė (C biblioteka)
Tvarkoje

--- Lokalė (X Window System)
Tvarkoje

--- ISO-8859-13 X Window System šriftai
Tvarkoje

--- X11 klaviatūra
Tvarkoje

--- GNU bash bei kitos readline naudojančios programos
Tvarkoje

--- UTF-8 lietuviškos raidės bei kabutės
Mažosios: ąčęėįšųūž
Didžiosios: ĄČĘĖĮŠŲŪŽ
Atidarančios ir uždarančios kabutės: „“
</pre>
</blockquote>

<ul>
<li><a href="test-lt.sh">test-lt.sh</a></li>
<li><a href="test-lt-utf8.sh">test-lt-utf8.sh</a></li>
</ul>


<h3 id="explain-module">explain-module</h3>

<p>It is a Perl script that explains what the kernel is looking for
when it tries to load a pseudo-module like "char-major-6", "net-pf-10", or
"sound-service-0-3".  Example:</p>

<blockquote class="example">
<pre>
$ explain-module char-major-6 net-pf-10 sound-service-0-3
char-major-6: Parallel printer devices
net-pf-10: protocol family AF_INET6 -- IP version 6
sound-service-0-3: Digital audio (/dev/dsp*, /dev/audio*) for card #0
</pre>
</blockquote>

<ul>
<li><a href="explain-module.pl">explain-module.pl</a></li>
</ul>
