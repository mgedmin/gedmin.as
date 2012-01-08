<%inherit file="_templates/site.mako" />
<%def name="title()">Praktiniai patarimai</%def>
<%def name="short_title()">patarimai</%def>

<h2>Praktiniai patarimai</h2>

<h3>Dokumentacija</h3>

<p>Unixe/Linuxe yra nuostabi komanda <tt>man</tt> (santrumpa nuo "manual").
Jei norite sužinoti, kokiame C header faile yra deklaruota funkcija
<tt>recv</tt> ir kokius parametrus ji ima, terminale surinkite</p>

<blockquote><pre>
<span class="prompt">$</span> man recv
</pre></blockquote>

<p>Javai šis fokusas nesuveiks ir teks naudotis <a href="http://www.google.com">Google</a>.</p>

<h3>Kompiliavimas Linuxe/Unixe</h3>

<p>Tarkime, kad turite C programą sudarytą iš trijų modulių su atitinkamais .h failais (modulis1.c, modulis1.h ir t.t.)
Ji kompiliuojama taip:</p>

<blockquote><pre>
<span class="prompt">$</span> gcc -Wall -o manoprograma modulis1.c modulis2.c modulis3.c
</pre></blockquote>

o leidžiama

<blockquote><pre>
<span class="prompt">$</span> ./manoprograma <em>parametrai</em>
</pre></blockquote>

<p>C++e viskas tas pats, tik vietoje <tt>gcc</tt> reikia leisti <tt>g++</tt>.</p>

<p>Kadangi kiekvieną kartą rinkti tą patį komandų rinkinį atsibos, siūlau
susikurti failiuką <tt>Makefile</tt> su tokiu turiniu:</p>

<pre>
CFLAGS = -Wall

manoprograma: modulis1.c modulis2.c modulis3.c
	gcc $(CFLAGS) -o $@ $^

# Pastaba: viršuje esanti eilutė privalo prasidėti TAB simboliu!
</pre>

<p>Tuomet kompiliavimui pakaks komandos <tt>make</tt>.</p>

<h3>Kompiliavimas Windows terpėje</h3>

<p>Jei naudojate Dev-C++, nueikite į Tools -&gt; Compiler Options ir ten uždėkite
varnelę "Add these commands to the linker command line" ir tekstiniame
laukelyje įrašykite <tt>-lwsock32</tt>.  Arba, vietoje to galite savo C++ programoje
įrašyti kompiliatoriaus direktyvą</p>

<pre>
#pragma comment(lib, "wsock32.lib")
</pre>

<h3>Windows programų kompiliavimas Linuxe</h3>

<p>Jei programą rašėte Windowsuose, o atsiskaitinėjate Linux klasėje,
parsiųskite šį <a href="winsock.h">winsock.h</a> failą ir pakeiskite
</p>
<pre>
#include &lt;winsock.h&gt;
</pre>
<p>į</p>
<pre>
#include "winsock.h"
</pre>
<p>O taip pat išmeskite #pragma eilutę.</p>
<p>Gal suveiks.</p>

<h3>Pranešimų ribos - problema</h3>

<p>Dauguma studentų renkasi paprasčiausią variantą -- klientą ir serverį,
bendraujanti TCP protokolu.  Dauguma studentų daro tą pačią klaidą -- pamiršta,
kad TCP protokolas siunčia baitų srautą ir neturi pranešimo sąvokos.  Vadinasi,
jei programa A padarys
</p>
<pre>
    send(sock_fd, "Pranešimas 1", strlen("Pranešimas 1"), 0);
    send(sock_fd, "Pranešimas 2", strlen("Pranešimas 2"), 0);
</pre>
<p>
o programa B darys
</p>
<pre>
    char buf1[MAXSIZE];
    char buf2[MAXSIZE];
    int len;
    ...
    len = recv(sock_fd, buf, sizeof(buf1), 0);
    buf1[len] = '\0';
    printf("Gavau: [%s]\n", buf1);
    len = recv(sock_fd, buf, sizeof(buf2), 0);
    buf2[len] = '\0';
    printf("Gavau: [%s]\n", buf2);
</pre>
<p>tai <strong>nėra jokių garantijų</strong>, jog buf1 turinys bus "Pranešimas 1",
o buf2 turinys bus "Pranešimas 2".</p>

<p>TCP protokolas siunčiamus ir gaunamus pranešimus gali skaldyti ir klijuoti
taip, kaip jam patinka.  Antroji programa greičiausiai gaus suklijuotus abu
pranešimus.</p>
<pre>
   Gavau: [Pranešimas 1Pranešimas 2]
   Gavau: []
</pre>
<p>Jei siunčiančioji programa darys ilgą pauzę tarp pirmojo ir antrojo
pranešimo arba, dar geriau, bandys pati laukti programos B atsakymo, tuomet
pranešimų „suklijavimo“ tikimybė smarkiai krinta ir <strong>atrodys</strong>,
kad programa veikia sekmingai.</p>

<p>Jei jūsų pranešimai trumpi, tikimybė, kad jie pakeliui bus suskaidyti į
mažesnius, irgi labai maža.  Gal tik džiunglėse per satelitinį mobulųjį telefoną
su prastos kokybės ryšiu ir atitinkamai maža <abbr title="Maximum Segment Size">MSS</abbr>
reikšme antroji programa gali imti ir pamatyti</p>
<pre>
   Gavau: [Praneš]
   Gavau: [imas 1]
</pre>

<h3>Pranešimų ribos - sprendimas</h3>

<p>Norėdami patikimai atskirti savo programos pranešimų ribas TCP protokolo
pateikiamame baitų sraute susigalvokite savo <em>protokolą</em>.  Pavyzdžiai:</p>

<ul>
  <li>Kiekvienas pranešimas yra eilutė teksto, užbaigta '\n' simboliu.
      <strong>Aš rekomenduoju rinktis šį variantą.</strong></li>
  <li>Kiekvienas pranešimas yra eilutė teksto, užbaigta '\0' simboliu.</li>
  <li>Kiekvienas pranešimas yra fiksuoto ilgio (pvz. 256 baitai).</li>
  <li>Kiekvieno pranešimo pradžioje yra dviejų baitų pločio pranešimo ilgis
      tinklo baitų tvarka, po kurio seka pats pranešimas.</li>
</ul>

<p>Jei rinksitės "pranešimas yra eilutė teksto" variantą, galėsite savo
programas testuoti (debuginti) naudodami standartines <tt>telnet</tt> ar
<tt>netcat</tt> programėles, arba perimti jų siunčiamus duomenis ir juos
lengvai interpretuoti naudodami, pvz., <a href="http://hathawaymix.org/Software/TCPWatch">TCPWatch</a>.</p>

<h3>Eilutinis protokolas - C</h3>

<p>Siuntimas yra labai paprastas:</p>

<blockquote><pre>
/**
 * Send a message.  The message should not contain any '\n' characters.
 * Example:
 *    send_line(sock_fd, "Hello, world!");
 */
void send_line(int sock_fd, char * buf)
{
    send(sock_fd, buf, strlen(buf), 0);
    send(sock_fd, "\n", 1, 0);
}
</pre></blockquote>

<p>Gavimas yra kiek sudėtingesnis, bet nelabai.</p>

<blockquote><pre>
/**
 * Receive a message terminated by a newline.  Returns an empty string if the
 * connection is lost of closed.  If the message is longer than fits into
 * bufsize bytes, the first part of the message is returned, and the rest is
 * lost forever.
 *
 * Example:
 *    char buf[BUF_SIZE];
 *    recv_line(sock_fd, buf, sizeof(buf));
 *    if (!*buf) {
 *        printf("Connection lost!\n");
 *        return;
 *    } else if (strncmp(buf, "EHLO", 4) == 0) {
 *        ...
 *    }
 */
void recv_line(int sock_fd, char * buf, int bufsize)
{
    int len = 0;
    while (1) {
        int n = recv(sock_fd, &amp;buf[len], 1, 0);
        if (n &lt;= 0 || buf[len] == '\n')
            break;
        if (len &lt; bufsize - 1)
            len++;
    }
    buf[len] = '\0';
}
</pre></blockquote>

<p>(Funkcijas ką tik parašiau, bet netestavau.  Net nebandžiau kompiliuoti.)</p>

<h3>Eilutinis protokolas - Java</h3>

<p>Socket klasė duoda jums InputStream ir OutputStream klasių objektus.  Sumaitinkite
InputStreamą į InputStreamReader, o šį į BufferedReader, ir tuomet galite kviesti
pastarojo <tt>readLine</tt> metodą nerašinėdami rankutėmis jokių skaitymo ciklų.
Rašymo pusėje irgi turėtų būti analogiški wrapperiai.</p>
