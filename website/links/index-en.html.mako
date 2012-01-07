<%%inherit file="_templates/site.mako" />
<%def name="title()">Links</%def>
<%def name="short_title()">Links</%def>

<div class="news toolbox shadow"><div class="inner">
In the mean-time Links has forked into a number of branches: links (the
original 0.9x series are still being maintained I think), elinks (lua scripting
+ other features), links2 (graphics + javascript), links-hacked (no idea, but
heard it mentioned on the mailing list).  I need to catch up with all this.
Currently I mostly use Mozilla for browsing.
</div></div>

<h2>What is it</h2>

<p>No, this is not a yet another collection of hyperlinks.  <a href="http://artax.karlin.mff.cuni.cz/~mikulas/links/">Links</a> is a text-mode web browser.  It's main features
are</p>
<ul>
<li> Background downloading. </li>
<li> Immediate rendering. </li>
<li> Menu/dialog interface. </li>
<li> Mouse support. </li>
<li> Visual HTML table and frame rendering. </li>
</ul>
Disadvantages:
<ul>
<li> Inconvenient cursor control (if you tried <a href="http://ei5nazha.yz.yamagata-u.ac.jp/~aito/w3m/eng/">w3m</a>,
     you won't want to go back to <a href="http://lynx.browser.org/">lynx</a>-style keys). </li>
<li> There are some limit to a text-only browser </li>
</ul>
<p>
One feature of Links - independency - is both an advantage and a disadvantage.
By independency I mean independency from OS features, other programs, and
libraries.  The advantage is that Links is easy to compile and use on
different operating systems (Windows, OS/2, Unix).  The disadvantage - Links
does not use information from <em>terminfo</em>, <em>mime.types</em>,
<em>mailcap</em>, and you have to configure it independently.
</p>

<p>Here's my wishlist for Links:
</p>
<ul>
<li> Better color support. </li>
<li> CSS support. </li>
<li> Persistent disk cache. </li>
<li> Persistent history and different visited/unvisited hyperlink colors. </li>
<li> Configuring key commands and interface colors. </li>
</ul>

<p>Thanks to <a href="http://www.opensource.org/">Open Source</a> one
can not only ask the author (what, by the way, I haven't done yet), but also
(try to) implement one's wishes himself. </p>

<ul>
<li> <a href="links-0.91-mg.underline.1">links-0.91-mg.underline.1</a> <br />
          
     
     This patch does two things:
     <ol>
     <li> Makes all hyperlinks (+ form controls/image maps/etc) underlined. </li>
     <li> Uses default color instead of black for background. </li>
     </ol>
     <p>
     This is useful only for users of <em>xterm</em> (and clones).
     If this patch was made properly, it'd add options for the
     changes listed above.  But it is not made properly. :)  It's
     more a proof-of-concept type thing.
     </p>
     

          <p>
     <a href="links-original.png"><img src="links-original-small.png" alt="Screenshot of unpatched Links" /></a><br />
     Slashdot in unpatched Links in an <a href="http://www.eterm.org/">Eterm</a> window.
     </p>

     <p>
     <a href="links-patched.png"><img src="links-patched-small.png" alt="Screenshot of patched Links" /></a><br />
     Slashdot in patched Links in an <a href="http://www.eterm.org/">Eterm</a>
     window.
     </p></li>

</ul>

<p> When I find time, I'll try to rewrite this patch for current
version of Links (now 0.95). </p>
<p>
I was also planning to continue exploring Links' color handling code.
I'd like to make it display proper background colors.  First, Links should
be able to use all 16 background colors.  I don't know yet when I can find time
for this. </p>
