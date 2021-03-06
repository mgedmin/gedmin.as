<%inherit file="_templates/site.mako" />
<%def name="title()">MEdit</%def>
<%def name="short_title()">MEdit</%def>

<h2>MEdit</h2>

<p>MEdit was the apogee of my DOS programming.  I always wanted to
write a text editor - and I succeeded.  Well, I haven't comletely finished
it...  After I switched from DOS to Linux, I also switched from MEdit to
<a href="http://www.vim.org/">VIM</a>.
</p>

<h2>Features</h2>

<ul>
  <li>Lithuanian language support: fonts and keyboard input</li>
  <li><strong>Macro language</strong> (keys, commands, loops, conditions,
      command definition, etc. Almost a programming language, if it only had
      variables...)</li>
  <li>Customizable: colors, key mappings, other options</li>
  <li>Syntax highlight (Pascal, C, C++, Assembler, .BAT files, CONFIG.SYS,
      .INI files, MEdit macro files, TvHc help source files)</li>
  <li>Line drawing</li>
  <li>Text formatting, word wrap, etc.</li>
  <li>Regular expression search (looks very powerful to me)</li>
  <li>Built-in calculator (Real/Dec/Hex/Bin/Oct, 28 operations, 28
      functions, just type an expression)</li>
  <li>Multiple Undo/Redo</li>
  <li>Can share Windows clipboard</li>
  <li>Two types of blocks (normal and column)</li>
  <li>Block operations:
    <ul>
      <li>Sorting</li>
      <li>Indent/unindent</li>
      <li>Filling with character/duplicating first line</li>
      <li>Aligning parts of lines</li>
      <li>Drawing a border around block</li>
      <li>Enumerating block lines</li>
      <li>Summing (sum, count, min, max, average)</li>
      <li>etc.</li>
    </ul></li>
  <li>Context sensitive online help, multi-windowing, mouse support, any
      standard/non standard text mode support, etc. - nothing very special</li>
</ul>

<h2>Restrictions</h2>

<ul>
  <li>A maximum of 32766 lines per file</li>
  <li>A maximum of 255 characters per line</li>
  <li>All opened files must fit into computer memory (EMS/XMS)</li>
  <li>TAB characters aren't special - except that you may expand them to
      corresponding number of spaces</li>
  <li>Syntax highlight is not too fast. Also, yet there is no way of
      specifying custom file formats for highlighting.</li>
</ul>

<h2>System Requirements</h2>

<ul>
  <li>286 or newer CPU</li>
  <li>At least 2 megabytes of free extended memory</li>
  <li>MS-DOS 3.0 or later</li>
  <li>Some hard disk space (a megabyte should be really enough)</li>
</ul>

<h2>Download</h2>

<ul>
  <li><a href="med200l.zip">MEdit 2.00 Lithuanian version (253K)</a></li>
  <li><a href="medit200.zip">MEdit 2.00 English version (212K)</a></li>
  <li><a href="dpmi.zip">Borland DPMI runtime files (required; 63K)</a></li>
</ul>

<p>Unfortunatelly, source is not available — I'd like to, but MEdit's sources
include a modified copy of Borland Turbo Vision source code, which I cannot
distribute.</p>

<h2>Future</h2>

<p>The work is stalled on version 2.04 alpha:</p>

<ul>
  <li>Mail reader</li>
  <li>Window minimization. When loading desktop minimized windows are not
      loaded automatically, thus saving time. They are actually loaded only
      when you restore them</li>
  <li>Extended 101 key keyboard support</li>
  <li>More complex macro conditions (conditional operators allowed)</li>
  <li>New key binding method: each kind of window
      (editor/calc/mailbox/letter/icon) has its own keymap.</li>
  <li>A primitive macro disassembling</li>
</ul>

<p>Unfortunately, I don't think this version will ever be finished. :(
</p>
