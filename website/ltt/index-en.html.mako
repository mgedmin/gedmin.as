<%inherit file="_templates/site.mako" />
<%def name="title()">Lithuanian Text Tool</%def>
<%def name="short_title()">LTT</%def>

<h2>Lithuanian Text Tool</h2>

<h3>What is it?</h3>

<p> In the old dark times many different encodings were used for
Lithuanian texts.  LTT (Lithuanian Text Tool) is a small program that does two
things:</p>

<ul><li>it tries to guess which encoding was used for the text</li></ul>

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

<ul><li>it can recode Lithuanian letters from one encoding to another</li></ul>

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

<h3>Notes</h3>

<ul>
<li> Only Lithuanian national letters are recoded </li>
<li> The following encodings are supported:
     <ul>
       <li> 772, 774, 775 </li>
       <li> 770 (also known as IBM Baltic)</li>
       <li> 771 (also known as KBL), 773</li>
       <li> ISO-8859-13 (also known as Latin-7), Windows-1257 (also known as Baltic RIM) </li>
       <li> ISO-8859-4 (also known as Latin-4), ISO-8859-10 (also known as Latin-6) </li>
     </ul>
     Encodings that share the same Lithuanian letter positions are listed on
     one line. </li>
<li> It is also possible to convert text to plain ASCII (but,
     unfortunatelly, not back) </li>
<li> User interface is in English (that might seem strange considering
     its purpose and target audience) </li>
<li> Ltt is written in Pascal.  It can be compiled for DOS, Windows
     Linux by using Turbo Pascal, Borland Delphi and Free Pascal.
     </li>
<li> Ltt is Free Software licenced under the <a href="COPYING">GNU
     GPL</a>.</li>
</ul>

<h3>Usage</h3>

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

<h3>Download</h3>

<p> LTT version 0.9.0 </p>
<ul>
  <li> <a href="ltt.pas">ltt.pas</a> (16K) -- source code </li>
  <li> <a href="COPYING">COPYING</a> (18K) -- licence (GNU GPL v2) </li>
  <li> <a href="ltt-0.9.0.zip">ltt-0.9.0.zip</a> (51K) -- ZIP archive
     containing source code and precompiled Windows and DOS executables. </li>
  <li> <a href="ltt-0.9.0.tar.gz">ltt-0.9.0.tar.gz</a> (46K) -- TAR.GZ
     archive containing source code and precompiled Linux executable. </li>
</ul>
<p> Linux </p>
<ul>
  <li> <a href="ltt">ltt</a> (79K) -- static ELF executable for i386 </li>
</ul>
<p> Windows </p>
<ul>
  <li> <a href="ltt32.exe">ltt32.exe</a> (51K) -- Win32 executable </li>
</ul>
<p> DOS </p>
<ul>
  <li> <a href="ltt16.exe">ltt16.exe</a> (13K) -- DOS executable </li>
</ul>
