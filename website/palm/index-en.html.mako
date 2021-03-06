<%inherit file="_templates/site.mako" />
<%def name="title()">My Palm</%def>
<%def name="short_title()">Palm</%def>

<div style="float:right; margin: 0 2ex 1em 1em; padding: 4px 4px 0px 4px; border: 1px solid #ccc"><img src="tungsten-t.jpg" alt="My Palm" width="98" height="145" /></div>

<h2>Palm Tungsten T</h2>

<p><span style="text-decoration: line-through">Recently</span> A couple of
years ago I bougth a new <a href="http://www.palm.com/products/handhelds/tungsten-t/">Palm Tungsten T</a>
from <a href="http://www.handheld.lt/TungstenT.html">Mindaugas
Kilikevičius</a>.</p>

<p>My reasons for choosing this model</p>

<ul>
<li>Small form factor (102mm x 75 mm x 15 mm; 157 g)</li>
<li>Pretty nice design (I still like Palm m5xx series better)</li>
<li>Builtin Bluetooth</li>
<li>Nice bright colour "high-resolution" (320x320) TFT screen</li>
<li>Graffiti input method</li>
<li>It can play Ogg and MP3 files</li>
<li>It runs Palm OS 5.0 and not WinCE <small>(Linux would be better, but I've
    yet to see a Linux handheld with such a nice form factor and design, plus
    I'm a bit uncertain about the software side)</small></li>
<li>It uses the same cradle/charger as my old m500</li>
</ul>

<p>First impressions</p>
<ul>
<li><a href="http://gutenpalm.sourceforge.net/">Weasel Reader</a> works fine.
    <a href="http://linkesoft.com/xmaster/">X-Master</a> doesn't.  Palm OS 5
    no longer supports hacks.  Well, the only hack that I miss a lot is <a href="http://www.mikemccollister.com/palm/#McPhling">McPhling</a>, and
    there's a separate application , McPhling 5, that works on Palm OS 5.</li>
<li>Another program that fails to start is <a href="http://matrix.netsoc.tcd.ie/~fortytwo/code/">Clip</a>.
    </li>
<li>The battery is good for about 10 hours of book reading with backlight on.
    A bit short for my tastes.  Perhaps its just the first few times, before
    the battery gets its full capacity?</li>
<li>I've noticed that you have to click on the top left corner of the screen
    to access menus.  Palm website writes that this is a bug, and provides
    a patch for it.  Visit the Palm website and go to Support -&gt; Products
    -&gt; Tungsten T -&gt; Palm Tungsten T Update.</li>
<li>The "Down" button is somewhat capricious.  I wonder if that's a hardware
    problem.</li>
</ul>

<p>Reflections after some longer use</p>

<ul>
<li>It is too thick ant too heavy for my tastes.  m500 was so much better
    in this respect.</li>
<li>Tungsten is better for book reading (white LCD background, nice backlight,
    higher resolution, nicer fonts, more memory, much faster reading from
    memory card).</li>
<li>Backlight is really necessary unless you're in direct sunlight (in which
    case you cannot tell whether the backlight is on or off).  I think this
    contributes to shorted battery life.</li>
<li>The 5-way navigator is a big improvement.  You can do a lot of things
    (switch between apps, choose another book, go to some bookmark, etc)
    without having to pull out the stylus.</li>
<li>The transparent plastic cover has its positive sides (you can read books
    without taking it off), but it also has its negative sides (inconvenience,
    poor protection, it gets less transparent after longer use).  Leather flip
    cover of the m500 is superior.  My m500 still looks shiny after 1.5 years
    of use, while Tungsten looks definitely worn after several months. </li>
<li>E-books are still my main use for a PDA.  Secondary uses include SMS
    storage (Bluetooth is nice, albeit SLOW), and the four standard apps
    (calendar, address book, to do, memo).</li>
<li>I no longer notice any problems with the "Down" button.  It might have been
    just a delay while Weasel Reader uncompressed some more text while
    scrolling down that I noticed.</li>
</ul>

<h3>Hotsync with Linux</h3>

<p>If you have an ancient kernel (e.g. 2.4.20 or older), you will need to
<a href="http://www.ussg.iu.edu/hypermail/linux/kernel/0302.2/1422.html">patch
  the kernel</a> for working USB hotsync. </p>

<p>Previously I used <a href="http://www.coldsync.org">ColdSync</a> with my
m500.  Unfortunately it does not work with Tungsten T.  I used coldsync
2.3.1+20020318-1 from Debian unstable.  (I haven't tried any recent versions,
as I'm quite happy with pilot-link.)</p>

<p><a href="http://www.pilot-link.org">Pilot-link</a> works.  Just make
/dev/pilot a symlink to /dev/ttyUSB0 (m500 and Tungsten T3 use /dev/ttyUSB1
instead).  I used pilot-link 0.11.7-3 from Debian unstable.</p>

<p><small>visor.o from 2.4.20 still oopses occassionally.  Both with m500,
and with Tungsten T.  Newer kernels have this problem fixed, as I haven't seen
it in a long while.
</small></p>

<p>I've also successfully hotsynced with it through IrDA on my ThinkPad.  Just
make /dev/pilot a symlink to /dev/ircomm0.  Again, pilot-link works while
coldsync doesn't.</p>

<p><small>IrDA hotsync is more reliable and easier to use, but it is also
slower.  Data transfer speeds are only 3-5 kilobytes per second.
</small></p>

<p>Bluetooth hotsync is much harder to set up (you have to make your computer
a PPP dialup server, then use network hotsync).  Data transfer speed is
the same as over IrDA, but there are no cables, and you don't have to keep
your Palm aligned the right way to point at the IrDA window.  I now mostly
use Bluetooth hotsync to upload new programs/databases to the Palm.</p>

<p>I have not yet found a way to upload a file into the extension card.  This
is needed by all ogg/mp3 players that I've found.  I use a USB SD card reader.
(And I use <a href="http://tcpmp.corecodec.org/">TCPMP</a> or AeroPlayer for
audio playback.)</p>

<p>Next, Internet!</p>

<h2>Palm Tungsten T + Sony-Ericsson T68i + Bitė GPRS</h2>

<p>This is a description for configuring Internet access (GPRS at Bitė, one
of the largest GSM operators in Lithuania) on a Palm Tungsten T with a mobile
phone (Sony-Ericsson T68i).</p>

<p><small>I wrote this from memory, after several hours of intense
<span style="text-decoration: line-through">torture</span> experiments.  I did
not try them from scratch.</small></p>

<p>First you need to configure GPRS on the phone.</p>

<ol>
<li>Menu -&gt; Connect (8) -&gt; Data comm. (7) -&gt; Data accounts (1)
    -&gt; Add account -&gt; GPRS data</li>
<li>Name: <kbd>Banga GPRS</kbd></li>
<li>APN: <kbd>banga</kbd></li>
<li>User id: <em>(empty)</em></li>
<li>Password: <em>(empty)</em></li>
<li><strong>Save</strong></li>
<li>Make sure that the new account has CID=1
    <br /><small>
      If not, remember the number.
    </small></li>
</ol>

<p>Then you have to configure Bluetooth to make the phone talk to the Palm.
   <br /><small>
     If Infrared is enough for you, you can skip this section.
   </small></p>

<ol>
<li>On your Palm select į Preferences -&gt; Communication -&gt; Connection</li>
<li><strong>New</strong></li>
<li>Name: <kbd>Bluetooth to my phone</kbd></li>
<li>Connect to: <kbd>Phone</kbd></li>
<li>Via: <kbd>Bluetooth</kbd></li>
<li>Enable Bluetooth on the phone:
    Menu -&gt; Connect (8) -&gt; Bluetooth (4) -&gt; Options -&gt; Operation
    mode -&gt; Automatic; then Menu -&gt; Connect (8) -&gt; Bluetooth (4)
    -&gt; Discoverable </li>
<li>Device: <strong>Tap to find</strong> and select your phone
    <br /><small>
      Most likely you'll be asked to enter a password.  Make something up.
      Then your phone should ask you for a password.  Type the same string
      you entered on the palm.  If you have the chance, select Add pair or
      anything similair.  I did this much earlier and do not remember all the
      details at the moment.
    </small></li>
<li>Model: <kbd>Standard GSM</kbd> works, despite the warning</li>
</ol>

<p>And finally configure network on the Palm.</p>

<ol>
<li>Preferences -&gt; Communication -&gt; Network</li>
<li><strong>New</strong></li>
<li>Service: <kbd>Banga GPRS</kbd></li>
<li>User name: <kbd>gprs</kbd></li>
<li>Password: <kbd>gprs</kbd>
    <br /><small>
      It does not matter what username and password you enter, but they both must
      be nonempty.
    </small></li>
<li>Connection: <kbd>Infrared to GSM Phone</kbd> or
                <kbd>Bluetooth to my phone</kbd></li>
<li>Phone: <kbd>*99#</kbd>
    <br /><small>
      If the GPRS account on you phone had CID different from 1, for example, 42,
      then enter <kbd>*99***42#</kbd>.
    </small></li>
<li>You could also select <strong>Details</strong> and change the PPP timeout to
    <kbd>Never</kbd> -- with GPRS you pay for the number of bytes transferred
    and not for time spent online.</li>
<li>Enable Infrared/Bluetooth on the phone
    <br /><small>
      E.g., <strong>Options</strong> -&gt; Receive item (3)
    </small></li>
<li>Click <strong>Connect</strong> and see if it works.  It does (or should).</li>
<li>Click <strong>Disconnect</strong> and be happy.</li>
</ol>

<p>Some useful programs I've used</p>

<ul>
<li><a href="http://www.citi.umich.edu/u/rees/pilot/">sntp</a> lets you
    synchronize the clock with an NTP server (e.g. ntp.delfi.lt).
    <em>Open source</em>.
    </li>
<li><a href="http://www.eudora.com/internetsuite/eudoraweb.html">EudoraWeb</a>
    is a web browser.  It does not require any proprietary proxy servers
    (but it does support standard HTTP proxies, should you wish to use one).
    <em>Crippleware</em>.
    BTW the Software Essentials CD that came with the bundle already includes
    a web browser called Web Pro.
    </li>
<li><a href="http://www.ai/~iang/TGssh/">Top Gun ssh</a> is a SSH client.
    It only supports SSH version one, though, and its terminal emulation is
    pretty weak (plain VT100).
    <em>Open source</em>.
    </li>
<li><a href="http://www.sealiesoftware.com/pssh/">pssh</a> is a SSHv2 client.
    Its terminal emulation is based on PuTTY, therefore it supports colours and
    80-column wide screen (with tiny fonts).  Requires Palm OS 5.
    <em>Open source</em>.
    </li>
</ul>

<p>There are some free email programs: <a href="http://www.eudora.com/internetsuite/eudora4palm.html">Eudora</a>, <a href="http://rallypilot.sourceforge.net/#GnuGotMail">GNUGotMail</a>.  I do
not use them because I read my mail on my home machine only (directly or
via SSH).</p>

<p>Some things I'd like to find, but haven't looked for yet</p>

<ul>
<li><span style="text-decoration: line-through">SSHv2 client with a good
    terminal emulation and RSA authentication.</span> <strong>(I found
    pssh)</strong></li>
<li>Email client that supports IMAP over SSL, MIME and several different
    charsets (UTF-8, ISO-8859-13).</li>
<li>Web browser that supports charset conversion and allows you to install Palm
    software directly from the web.</li>
</ul>

<p>Feedback: <del>mgedmin&#64;b4net.lt</del> marius@gedmin.as</p>
