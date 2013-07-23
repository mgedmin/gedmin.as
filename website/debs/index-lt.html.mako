<%inherit file="_templates/site.mako" />
<%def name="title()">Debian paketai</%def>
<%def name="short_title()">APT</%def>

<p>Čia guli keli seni mano iškepti Debian paketai.  Norėdami juos patogiai
instaliuoti, įtraukite šias eilutes į /etc/apt/sources.list:
</p>

<blockquote class="example"><pre>
deb     http://gedmin.as debs/
deb-src http://gedmin.as debs/
</pre></blockquote>

<p>Bet geriau to nedarykite.  Aš jų nebeprižiūriu; aš dabar naudoju
<a href="https://launchpad.net/~mgedmin/+archive/ppa/">Launchpad'o PPA</a>.</p>

<h2>Paketai</h2>

<dl class="obsolete package" id="apt-checkupdates">
<dt>apt-checkupdates (0.6)
<a class="good" href="apt-checkupdates_0.6_all.deb">[deb]</a>
<a class="good" href="apt-checkupdates_0.6.dsc">[dsc]</a>
<a class="good" href="apt-checkupdates_0.6.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Automatiškai kiekvieną naktį arba po kiekvieno persikrovimo tikrina Debiano
  archyvus ir siunčiasi naujus paketus upgreidinimui, pranešdamas apie tai
  root'ui paštu.  Tikriausiai ekvivalentus <a href="http://packages.debian.org/search?keywords=apticron">apticron</a>,
  bet daug paprastesnis.  Naujesnė apt-checkupdates versija guli <a
  href="https://launchpad.net/~mgedmin/+archive/ppa/">mano PPA</a>.
  </dd>
</dl>

<dl class="obsolete package" id="ltz2003">
<dt>ltz2003 (0.1.0-1)
<a class="good" href="ltz2003_0.1.0-1_i386.deb">[deb]</a>
<a class="good" href="ltz2003_0.1.0-1.dsc">[dsc]</a>
<a class="good" href="ltz2003_0.1.0-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  <a href="../ltz/index-lt.html">Lietuvos laiko zonos aprašas</a>.  Šiais
  laikais nebereikalingas, nes visos Linux distribucijos turi visą reikiamą
  informaciją.
  </dd>
</dl>

<dl class="obsolete package" id="mg-keymap">
<dt>mg-keymap (0.9.5-1)
<a class="good" href="mg-keymap_0.9.5-1_i386.deb">[deb]</a>
<a class="good" href="mg-keymap_0.9.5-1.dsc">[dsc]</a>
<a class="good" href="mg-keymap_0.9.5-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Mano pamėgtas Lituanian (Programmers) klaviatūros išdėstymas X'ams.  Taip
  pat pakete guli ir rusiškas fonetinis išdėstymas.  Šiais laikais nebeveikia,
  nes X pakeitė klaviatūros išdėstymų tvarką.
  </dd>
</dl>

<dl class="obsolete package" id="mgacct">
<dt>mgacct (0.4-1)
<a class="good" href="mgacct_0.4-1_i386.deb">[deb]</a>
<a class="good" href="mgacct_0.4-1.dsc">[dsc]</a>
<a class="good" href="mgacct_0.4-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Renka Internetinio trafiko statistiką su iptables bei paišo grafikėlius su
  rrdtool.  Smarkiai neišbaigtas eksperimentas.
  </dd>
</dl>

<dl class="obsolete package" id="mgstats">
<dt>mgstats (0.12-1)
<a class="good" href="mgstats_0.12-1_i386.deb">[deb]</a>
<a class="good" href="mgstats_0.12-1.dsc">[dsc]</a>
<a class="good" href="mgstats_0.12-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Renka įvairią sistemos resursų statistiką (atmintis, diskas, tinklas ir t.t.)
  ir paišo grafikėlius su rrdtool.  Vietoje manojo eksperimento rekomenduočiau
  geriau naudoti <a href="http://collectd.org/">collectd</a>.
  </dd>
</dl>
