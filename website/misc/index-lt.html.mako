<%inherit file="_templates/site.mako" />
<%def name="title()">Įvairūs skriptai</%def>
<%def name="short_title()">Įvairūs</%def>

<h2>Įvairūs skriptai</h2>

<h3 id="test-lt">test-lt</h3>

<p>Pora shell skriptų, padedančių diagnozuoti „lietuvinimo“ problemas.
Vienas iš jų skirtas žmonėms, norintiems naudoti įprastą ISO 8859-13 koduotę,
kitas -- drąsuoliams, norintiems naudoti UTF-8 koduotę.  Pavyzdys:
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

<p>Tai — Perl skriptas, paaiškinantis, ko ieško Linux kernelis,
bandydamas užkrauti pseudo-modulį panašų į „char-major-6“,
„net-pf-10“ ar „sound-service-0-3“.  Pvz.:
</p>

<blockquote class="example"><pre>
$ explain-module char-major-6 net-pf-10 sound-service-0-3
char-major-6: Parallel printer devices
net-pf-10: protocol family AF_INET6 -- IP version 6
sound-service-0-3: Digital audio (/dev/dsp*, /dev/audio*) for card #0
</pre></blockquote>

<ul>
<li><a href="explain-module.pl">explain-module.pl</a></li>
</ul>

