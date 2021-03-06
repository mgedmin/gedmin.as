<%inherit file="_templates/site.mako" />
<%def name="title()">Debian</%def>
<%def name="short_title()">Debian</%def>

<h2>Contents</h2>

<ol>
<li><a href="#news">News</a></li>
<li><a href="#whatisit">What is Debian</a></li>
<li><a href="#intro">A Long Introduction</a></li>
<li><a href="#whydebian">Why I like Debian so much?</a></li>
<li><a href="#nothingperfect">Nothing's Perfect</a></li>
<li><a href="#foryou">Is Debian Good For You?</a></li>
</ol>

<h2><a id="news">News</a></h2>

<dl class="news">

<dt>2008-10-29</dt>
<dd>Corrected broken links.</dd>

<dt>2002-07-25</dt>
<dd>A couple of small fixes.</dd>

<dt>2002-05-04</dt>
<dd>Filtered through a spell checker.  Grammar bugs left alone.</dd>

<dt>2002-05-03</dt>
<dd>
Created this page.  Too tired to even do a simple spell check.  Mail me if
you find bugs in the text.
</dd>

</dl>

<h2><a id="whatisit">What is Debian</a></h2>

<p><a href="http://www.debian.org/">Debian GNU/Linux</a> is my
favorite operating system.  In this page I'll try to explain why.</p>

<h2><a id="intro">A Long Introduction</a></h2>

<p>I started from MS-DOS.  Later came Windows 95.  At about that time
two books on the Unix operating system fell into my hands.  I was fascinated
reading them.  Fascinated by the power, elegance, simplicity.  In other words,
fascinated by the <a href="http://en.wikipedia.org/wiki/Unix_philosophy">Unix
philosophy</a>.  I understood then that <em>everything</em> I liked in MS-DOS
was just a shadow cast by Unix.  A bit later I came upon <a href="http://catb.org/jargon/">The Jargon File</a>, which I
"swallowed" with great pleasure.  I learned what <a href="http://catb.org/esr/writings/hacker-history/">hackers</a>
were (do not confuse them with <a href="http://catb.org/jargon/html/C/cracker.html">H4x0rS</a>,
which also like to call themselves "hackers") and wanted to become one.
While reading <a href="http://catb.org/esr/writings/hacker-history/">How To
Become A Hacker</a> I found there an advice to try Linux or some other free
Unix clone.</p>

<p>In late 1997 I finally made up my mind.  I downloaded Slackware 3.4
(or 3.2?) boot and root disks and played with them all night wandering in the
shell and admiring the colours of ls output (I didn't have the actual floppies
with all the packages -- dialup... my father downloaded them at work later).
Next morning I left for Cape Town (for the students' International Olympiad in
Informatics), but after coming back immediately continued the installation
etc.  Initially I lived with Slackware in 340 Mb hard drive in my 66 MHz 486
with 16 MB RAM.  Later I purchased a 7 Linux CD set from Cheap*Bytes which
contained Slackware 3.4, Red Hat 5.0, Debian 1.3 2 CD (binary &amp; source),
and three CDs full or Linux software from various FTP sites.  When I got a new
bigger hard drive I decided to try out Red Hat.  I liked it more than Slackware.
For a long time I used Red Hat, and then tried Mandrake 6.0 or maybe 6.1 and
later made the jump to Mandrake.  I had been happily using Mandrake 7.1 for a
long time on my desktop and my small notebook (Pentium 75, 40 MB RAM, 1.2 GB
hdd).</p>

<p>By then I was no longer a neophyte in Linux.  I got the impression
that most Linux users migrate to Debian, and later to FreeBSD.  I wasn't sure
about BSD (and I'm still not sure it's better), but I decided then that
there must be a good reason for that and that earlier or later I would switch
to Debian.</p>

<p>I tried it once.  After dealing with Debian 2.1 install process I
was strongly disappointed and returned back to Mandrake.  By the way I was
still a poor dial-up user at that time and installed Debian from CDs.</p>

<p>2001, spring.  I was back from a semester's studies in Denmark.
I decided to put my old 486 as a router for my 24-hour Internet connection
(which I managed to get a short time before leaving for Denmark).  I decided
to give Debian another chance.  I downloaded and burned all three Debian 2.2
CDs, installed the system (the process failed to impress me again, but it was
much better this time) and started looking around.  I liked it.  In a month
I couldn't do anything but switch my desktop to Debian (from the same 2.2 CDs,
but I upgraded it to unstable (by mistake) on the same day).  Today I've been
using Debian for more than a year -- both at home and at work, where I share
half of sysadmin duties for 10 workstations and 3 servers, and I also oversee
a couple of Linux servers for friends and acquaintances.</p>

<h2><a id="whydebian">Why I like Debian so much?</a></h2>

<p>I'll try to list the reasons I like Debian.</p>

<ul>
<li> <em>Package installation.</em>  Say, you want some program <em>foo</em>
     -- you type apt-get install foo and in several seconds Poof! you have it
     on your machine.  No wandering through CDs/the web/FTP sites.  There are
     more than 10,000 packages made for Debian.  Of course, a good Internet
     connection helps here a lot.</li>
<li> <em>Upgrades.</em>  I remember putting off the upgrade of Mandrake 7.1
     -&gt; 7.2, because that required a reboot, repeating at least a third of
     the installation process etc.  And reading lots of terrible warning notes
     saying "BACK UP YOUR DATA BEFORE CONTINUING".  I've done a couple of Red
     Hat/Mandrake upgrades before, and the process itself is not very difficult,
     but for some reason I do not want to repeat it too often.  With Debian
     I did apt-get update; apt-get dist-upgrade and after a download of 300 Mb
     my computer was running Debian unstable instead of Debian Potato.</li>
<li> <em>Order/cleanliness.</em> In Slackware the sysadmin is responsible for
     creating and maintaining order -- if he does not create and maintain the
     order, (s)he'll get a mess.  Red Hat is a bit better, but all the script
     magic is deep and cryptic there.  Debian glitters.  When I use Debian I
     feel that this is not some random Linux with lots of packages thrown in
     without much thought.  Every package here follows the same rules which
     are detailed in Debian Policy manual.  All the files are placed according
     to the Filesystem Hierarchy Standard.  Script magic is shallow,
     transparent, and encompassing everything that needs it.  The alternatives
     system -- for example the admin may choose which of several packages
     should provide /bin/vi symlink.  (BTW RedHat recently decided to copy
     Debian's alternative system.)  Or dpkg diversions -- packages or the
     sysadmin may rename files that belong in other packages, and as a result
     frequent X upgrades do not overwrite my hacked
     /usr/X11R6/lib/X11/locale/iso8859-13/Compose file.  Or dpkg package
     database -- everything is stored in two plain text files.  Speed suffers,
     but you can use all the standard Unix tools to manipulate them (and I
     appreciate that a lot).  RPM is faster, but when you mount your partition
     from another OS, you can pry nothing from that opaque binary database.</li>
<li> <em>Consistency.</em> Debian is not just a collection of software.  It's
     a uniform system.  It is the first Linux distribution where I see such
     consistency.  One policy document, one easily accessible bug database for
     all packages (by the way if a bug tracking system requires a web browser
     to submit a bug, it is not easily accessible -- for me), standard
     README.Debian.gz files in /usr/share/doc/package-name/ subdirs.  11
     supported architectures1</li>
<li> <em>Convenience.</em> From this uniformity convenience arises.  I do not
     need to remember what signal to send or what command with what arguments
     to execute after editing a config file for some random daemon.  I can just
     do /etc/init.d/daemon reload.  I do not need to find out how to compile
     NVidia drivers and what OpenGL libraries I need to remove and somehow
     prevent from reappearing on the next upgrade -- there's a Debian package
     that does all that.  There's a package for building and installing the
     kernel.  There's a package for downloading and installing Real Player.
     There's a package for Audiogalaxy Satellite.  There's a package for
     Quake ][ shareware game data download and installation.  Still, most
     of the convenience comes from apt-get.  When I get tired of battling
     with exim config, I can replace it with postfix by using a single apt-get
     install command.</li>
<li> <em>Ideology.</em> Debian is the most free Linux distribution.  The
     Open Source Definition is based on Debian Free Software Guidelines.
     Debian project has its constitution.  There are democratic elections of
     Debian Project Leader.  Debian is not governed by marketing solutions, but
     by its developers -- people who want to make life easier for themselves
     and for other Linux users.  Seeing Debian today I hope it will continue
     to go in the same direction.</li>
</ul>

<h2><a id="nothingperfect">Nothing's Perfect</a></h2>

<p> Debian is not flawless.  For example its old package selection
interface (dselect) gives me the creeps.  Hardware setup is not automated
enough (actually, all automatization is hidden in packages that are not widely
known).  There is no single place (setup/control panel) to access all
configuration mechanisms so you have to find the commands and files all by
yourself.  Sometimes it is difficult to choose one package from several
alternatives (e.g. of a POP3 server).  Stable release occur too infrequently,
and not everyone wants to run unstable betas.</p>

<h2><a id="foryou">Is Debian Good For You?</a></h2>

<p> The answer is -- I don't know.  But if you want some sort of Unix
instead of a replacement for Windows, if you are an advanced user/programmer/sysadmin,
if you are not afraid of the initial step of installation/configuration, if
you have unlimited access to the Internet, then give Debian a try.</p>
