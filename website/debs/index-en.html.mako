<%%inherit file="_templates/site.mako" />
<%def name="title()">Debian packages</%def>
<%def name="short_title()">APT</%def>

<p>Here are several old Debian packages produced by yours truly.  To install
them conveniently, add the following lines to your /etc/apt/sources.list:</p>

<blockquote class="example"><pre>
deb     http://gedmin.as debs/
deb-src http://gedmin.as debs/
</pre></blockquote>

<h2>Packages</h2>

<dl class="package" id="apt-checkupdates">
<dt>apt-checkupdates (0.6)
<a class="good" href="apt-checkupdates_0.6_all.deb">[deb]</a>
<a class="good" href="apt-checkupdates_0.6.dsc">[dsc]</a>
<a class="good" href="apt-checkupdates_0.6.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Automatically checks and downloads Debian updates every night (or after every
  reboot) and notifies the system administrator by email.  More or less
  equivalent to <a href="http://packages.debian.org/search?keywords=apticron">apticron</a>,
  but simpler.
  </dd>
</dl>

<dl class="obsolete package" id="ltz2003">
<dt>ltz2003 (0.1.0-1)
<a class="good" href="ltz2003_0.1.0-1_i386.deb">[deb]</a>
<a class="good" href="ltz2003_0.1.0-1.dsc">[dsc]</a>
<a class="good" href="ltz2003_0.1.0-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  <a href="../ltz/index-en.html">Lithuanian time zone update</a>.  No longer
  needed, since all Linux distros have the updated information.
  </dd>
</dl>

<dl class="obsolete package" id="mg-keymap">
<dt>mg-keymap (0.9.5-1)
<a class="good" href="mg-keymap_0.9.5-1_i386.deb">[deb]</a>
<a class="good" href="mg-keymap_0.9.5-1.dsc">[dsc]</a>
<a class="good" href="mg-keymap_0.9.5-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  My favourite Lithuanian (Programmers) keyboard layout for X.  It also
  contains a phonetic Cyrillic layout.  Doesn't work any more with modern X
  packages that have changed the location and structure of keymaps.
  </dd>
</dl>

<dl class="obsolete package" id="mgacct">
<dt>mgacct (0.4-1)
<a class="good" href="mgacct_0.4-1_i386.deb">[deb]</a>
<a class="good" href="mgacct_0.4-1.dsc">[dsc]</a>
<a class="good" href="mgacct_0.4-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Collects Internet traffic stats with iptables and generates graphs with
  rrdtool.  Unpolished early beta version.
  </dd>
</dl>

<dl class="obsolete package" id="mgstats">
<dt>mgstats (0.12-1)
<a class="good" href="mgstats_0.12-1_i386.deb">[deb]</a>
<a class="good" href="mgstats_0.12-1.dsc">[dsc]</a>
<a class="good" href="mgstats_0.12-1.tar.gz">[tar.gz]</a>
</dt>
  <dd>
  Collects system resource usage statistics (memory, disk, network, etc.)
  and generates graphs with rrdtool.  It was an interesting experiment, but
  I'd suggest using <a href="http://collectd.org/">collectd</a> instead.
  </dd>
</dl>
