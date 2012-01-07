<%inherit file="_templates/site.mako" />
<%def name="title()">Linux kernel patches</%def>
<%def name="short_title()">Kernel</%def>

<h2>Linux kernel patches</h2>

<h3>ISO9660 kernel patch</h3>

<p>
Two things bugged me with Joliet CD-ROMs:
</p>
<ul>
  <li> All files were executable (mode=0444 fixed only files with dots in
       their names) despite the setting of <tt>noexec</tt> flag. </li>
  <li> Often there would be 8.3 DOSish filenames in ALL UPPER CASE (at least
       on home made CD-Rs). </li>
</ul>

<p>
This patch addresses both issues:
</p>
<ul>
  <li> None of the regular files are given execute permissions if <tt>noexec</tt>
       mount flag is active. </li>
  <li> A new iso9660 mount flag is added: <tt>lowercase</tt>.  If set, it translates
       all-uppercase file names on Joliet CD-ROMs to lower case.  Plain
       ISO9660 already has <tt>map=normal</tt>, and Rock Ridge doesn't need this
       (being case sensitive et al), thus only Joliet CDs are affected. </li>
</ul>

<ul>
<li><a href="isofs-2.2.19mg1.patch">isofs-2.2.19mg1.patch (5K)</a></li>
</ul>

<p>Older kernel versions</p>
<ul>
<li><a href="isofs-2.2.14mg1.patch">isofs-2.2.14mg1.patch (5K)</a></li>
<li><a href="isofs-2.2.9mg1.patch">isofs-2.2.9mg1.patch (5K)</a></li>
</ul>

