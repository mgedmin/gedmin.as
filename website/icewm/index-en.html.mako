<%%inherit file="_templates/site.mako" />
<%def name="title()">IceWM</%def>
<%def name="short_title()">IceWM</%def>

<div class="news toolbox shadow"><div class="inner">
Information on this page is a bit outdated.  Some of the patches are applied
upstream, some are obsolete, I now use a different theme, and I use Mozilla
instead of Links for normal browsing; and <a href="http://www.icewm.org/">www.icewm.org</a> is online now.
</div></div>

<h2>Contents</h2>

<ol>
<li><a href="#news">News</a></li>
<li><a href="#history">How I found IceWM</a></li>
<li><a href="#life">My lifestyle</a></li>
<li><a href="#patches">My IceWM patches</a></li>
<li><a href="#config">My IceWM configuration</a></li>
<li><a href="#links">Links</a></li>
</ol>

<h2><a id="news">News</a></h2>

<dl class="news">
<dt>2000-06-26</dt>
<dd>
Fixed a bug in one of the patches: <a href="patch-1.0.4.mg.winlist.2">patch-1.0.4.mg.winlist.2</a>: IceWM could
crash when closing windows.
</dd>

<dt>2000-06-25</dt>
<dd>
Created this page.
</dd>
</dl>

<h2><a id="history">How I found IceWM</a></h2>

<p>I didn't use the X Window System for a long time.  There were
several reasons - my video card (S3 Trio3D) was poorly supported, X wasn't
very comfortable, besides, I always preferred the keyboard and command line
interface.  I have tried KDE and GNOME, but was unimpressed and promptly
went back to the console.  However once I saw an IceWM announcement in
<a href="http://freshmeat.net">Freshmeat</a> or somewhere else, and the
words "mouse is optional" interested me.  I downloaded IceWM, tried it and
was hooked.  I forgot the console and use X ever since (but I haven't
forgotten the command line - multiple xterms, or rather <a href="http://www.eterm.org/">Eterms</a>, are the way to live).
</p>

<p>
<a href="http://icewm.sourceforge.net">IceWM</a> is a window manager for the
X Window System.  Its goals are speed and convenience, but looks do not
suffer much.  (And Enlightenment, for example, lost both speed and
convenience while pursuing looks...).  The default theme looks a bit ugly,
but due to lucky chance I stumbled upon <em>blueHeart</em> theme.  Due to
another lucky chance, I did not have some of the fonts installed, and
<em>blueHeart</em> was forced to fall back to standard fonts.  Later I
installed those missing fonts out of curiosity, looked at them, and promptly
removed them.  They may be nice, but they were completely unreadable.  Today
I use a slightly modified <em>blueHeart</em> theme (see bellow).
</p>

<h2><a id="life">My lifestyle</a></h2>

<p>Enough talks about looks - it's time to show them.  This is
mostly what my usual desktop looks like:
<br />
<a href="icewm-big.png"><img src="icewm-small.jpg" alt="My desktop" /></a>
<br />
You can see Netscape Navigator in the background.  I use it only on very
rare special occasions, and use <a href="http://artax.karlin.mff.cuni.cz/~mikulas/links/">Links</a> for
everyday browsing.
In the left you see IceWM's window list, in the right - an Eterm, where
I have just started typing this web page (BTW my preferred text editor is
<a href="http://www.vim.org/">VIM</a>).  On the bottom you can see IceWM's
taskbar and GNOME panel stacked on top of each other.
</p>

<p>Is is time to notice that IceWM is very configurable.  Everyting
you read or see on this page is due to my configuration.  IceWM can look and
feel quite differently on your system.  Besides, I have slighlty <a href="#patches">modified</a> my IceWM (long live <a href="http://www.opensource.org/">Open Source</a>!).
</p>

<p>Let's look at IceWM's taskbar more closely:
</p>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td align="left">
<a href="taskbar.png"><img src="taskbar-left.png" alt="Left side" /></a></td>
<td align="right">
<a href="taskbar.png"><img src="taskbar-right.png" alt="Right side" /></a></td></tr>
</table>

<ul>
<li> On the left top side you see a traditional <em>Start</em>
menu, which can be activated by hitting Ctrl+Esc (I use Win95 keys for
better purposes).  Not very useful thing, but sometimes it is needed.
<br /><img src="startmenu.png" alt="Start menu" />
</li>

<li> A little to the right you see the window list button.  It is
faster to open a separate window list window with Win+Esc though.
<br /><img src="winlistmenu.png" alt="Window list menu" />
</li>

<li> Further to the right you see quick launch buttons (defined in
the <a href="#config">~/.icewm/toolbar file</a>).  Keyboard lovers won'y use
them, but will rather hit hot keys defined in the <a href="#config">~/.icewm/keys file</a>.  Win+t = Eterm, Win+m = Mutt.
</li>

<li> There is a command line even further to the right.  You can
start X programs from here, or text mode programs within a new xterm if you hit
Ctrl+Enter instead of Enter.  The command line is easily reachable by hittng
Win+Space.  Unfortunatelly, there is no history, nor file name completion.
</li>

<li> On the second row you see four buttons for four workspaces.
The fourth workspace is now active.  You can switch them with
Win+Left/Right, and <a href="#patches">Win+Down</a> will alternate between
current and previously active workspace.  At any time you can go to any of
the workspaces by hitting Win+1..4.  And if you hold down the Shift key
while toggling workspaces, you will take the active window with you.
</li>

<li> Next comes the task list.  Nothing special.  You can switch
windows with Alt+Tab (or Alt+Esc).  Minimized windows are shown in a darker
colour.  Hidden windows are not shown at all, you can access them only via
the window list.
</li>
</ul>

<ul>
<li> There's a clock on the right side.  You can also see the date
if you hold the mouse over it.
<br /><img src="datetooltip.png" alt="Date and time tooltip" />
</li>

<li> There's a mail icon to the left.  Hey, I've got mail!  Seven messages even! :)
<br /><img src="mailtooltip.png" alt="Mail tooltip" />
</li>

<li> More to the left you see a CPU load graph for last 10 seconds.
<br /><img src="cpuloadtooltip.png" alt="CPU load tooltip" />
</li>

<li> And even more to the left there is - my favourite - network
traffic monitor.  Its tooltip is less informative by default, but that's
what <a href="#patches">source code</a> is for.
<br /><img src="nettooltip.png" alt="Network monitor tooltip" />
</li>
</ul>

<p>After shrinking the GNOME panel to 24 pixels and choosing
appropriate colours, it blends very nicely with the IceWM taskbar.
BTW, I use GNOME panel almost solely for the ICQ (<a href="http://gnomeicu.gdev.net/">GnomeICU</a>) applet.
</p>

<p>Other IceWM features</p>

<ul>
<li> Window menu (show by hitting Alt+Space).  As you can see, all
operations can be achieved with the keyboard only.
<br /><img src="winmenu.png" alt="Window menu" />
</li>

<li> When dragging windows on screen, they automatically snap to
other windows or screen border.  Very convenient.  And if you don' like
that, just hold down the Alt key.
</li>

<li> Window list, opened by hitting Win+Esc.  You can activate
any window, or select a couple of them and
hide/minimize/arrange/tile/cascade them together, etc..
<br /><img src="winlist.png" alt="Window list" />
</li>

<li> By hitting the magical three finger salute Ctrl+Alt+Del (or
just Win+Del), you can do many interesting things, like, reboot or shut
down, restart IceWM, log out or just lock the screen.
<br /><img src="ctrlaltdel.png" alt="Ctrl+Alt+Del menu" />
</li>
</ul>

<h2><a id="patches">My IceWM patches</a></h2>

<p>Here you will find a couple of my patches for IceWM.  File name
consists of the word "patch", IceWM version number (against which the diff
was made), initials of the author (<em>mg</em> - that's me ;), the name and
version of the patch itself.  Don't panic - all patches work with the latest
IceWM 1.0.4, just a couple of line numbers may be off.
</p>

<ul>
<li> <a href="patch-1.0.0.mg.lastconsole.1">patch-1.0.0.mg.lastconsole.1</a>
     allows toggling current and previous workspace with Win+Down. </li>
<li> <a href="patch-1.0.1.mg.tooltip.1">patch-1.0.1.mg.tooltip.1</a>
     allows tooltips to show forever when ToolTipTime = 0. </li>
<li> <a href="patch-1.0.4.mg.winlist.2">patch-1.0.4.mg.winlist.2</a>
     shows additional information in window list: workspace and status
     (hidden/minimized). </li>
<li> <a href="patch-1.0.4.mg.movesize.1">patch-1.0.4.mg.movesize.1</a>
     adds a couple of key commands during window size/move. </li>
<li> <a href="patch-1.0.4.mg.ppp.2">patch-1.0.4.mg.ppp.2</a>
     makes ppp status tooltip more informative:
     <br /><img src="nettooltip.png" alt="Network status tooltip" /> </li>
<li> <a href="patch-1.0.4.mg.alttab.2">patch-1.0.4.mg.alttab.2</a>
     improved (visually) Andy Oliver's patch for Alt+Tab window to make it look
     like this:
     <br /><img src="alttab.png" alt="Alt+Tab window" /> </li>
</ul>

<h2><a id="config">My IceWM configuration</a></h2>

<p>Here you will find the contents of my ~/.icewm/ directory:</p>

<ul>
<li> <a href="preferences">preferences</a> file defines global IceWM settings
</li>

<li> <a href="winoptions">winoptions</a> file defines settings for various
     programs.  Mine is not very orderly :)
</li>

<li> <a href="toolbar">toolbar</a> file defines quick launch buttons on
     taskbar.
</li>

<li> <a href="keys">keys</a> file defines program launch hot keys.
</li>

<li> <em>menu</em> file defines the contents of the Start menu.
     On my system this file is generated by <a href="make.sh">make.sh</a>
     shell script from <a href="menu.src">menu.src</a>, by inserting GNOME
     and KDE menus in appropriate places.  Not very ordely too.
     BTW I forgot where I found <em>gno2ice.pl</em> and <em>kde2ice.pl</em>
     scripts.
</li>

<li> <a href="programs">programs</a> file configures another part of the Start
     menu.  This one's quite old and obsolete - I do not use Start menu.
</li>

<li> <em>icons/</em> directory contains 1243 random icons.  Almost
     all of them are unused, and I do not have some needed ones (e.g. for
     XMMS)...
</li>

<li> <em>mailbox/</em> directory contains slightly modified mail
     icons for the taskbar (when using the standard ones it is quite hard to
     see from a distance whether there is mail, or not).
</li>

<li> <em>themes/</em> directory contains various themes from <a href="http://icewm.themes.org/">all places</a>.
     I use only my modification of <em>blueHeart</em> theme.  If you want to
     try it out, download <a href="http://icewm.themes.org/themes.phtml?themeid=946463904">blueHeart
     from icewm.themes.org</a>, and use my <a href="mg.theme">mg.theme</a>
     instead of <em>default.theme</em>.
</li>
</ul>

<h2><a id="links">Links</a></h2>

<p>What's a web page without links :)</p>

<ul>
<li> <a href="http://icewm.sourceforge.net/">icewm.sourceforge.net</a>
 - the official IceWM home page.
</li>

<li> <a href="http://icewm.cjb.net/">IceWM Network</a>
 - home of the IceWM network.
</li>

<li> <a href="http://icewmfaq.cjb.net/">IceWM FAQ</a>
 - IceWM frequently asked questions.
</li>

<li> <a href="http://home.mho.net/zrpg/icewm/">IceWM Xtravaganza</a>
 - links and more.
</li>
</ul>

<p>AFAIK VA Linux has registered icewm.org domain, however there is
no web page at that address yet.
</p>
