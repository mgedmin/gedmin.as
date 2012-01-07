<%%inherit file="_templates/site.mako" />
<%def name="title()">Keyboard Utils</%def>
<%def name="short_title()">KeyUtils</%def>

<h2>Keyboard Utils</h2>

<p>A collection of useful DOS keyboard utilities:</p>
<ul>
<li> <strong>isshift</strong> allows checking the state of Shift/Ctrl/Alt/xxxLock
     from .BAT files </li>
<li> <strong>keypeek</strong> shows key codes appearing in the keyboard buffer,
     and values returned by BIOS INT 16h functions </li>
<li> <strong>keyshow</strong> shows the view of the keyboard with keys
     depressed, and also shows key scan codes, the contents of the keyboard
     buffer and the state of shift-register bits. </li>
<li> <strong>putkb</strong> places keys given on the command line into keyboard
     buffer. </li>
</ul>
<p>
The archive contains source code (Turbo Pascal + TASM) and precompiled
DOS binaries.
</p>

<ul>
  <li><a href="keyutils.zip">keyutils.zip (45K)</a></li>
</ul>
