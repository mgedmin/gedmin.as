#!/bin/sh
# Lietuviø kalbos palaikymo testai Linuxui.  Versija 0.1.2
# Copyright (c) 2002 Marius Gedminas <marius@gedmin.as>
# Ðis skriptas GPLintas.

# UTF-8 norintiems naudoti dràsuoliams ðis skriptas nepadës, nes jis
# pritaikytas ISO-8859-13

# Testai

test_locale()
{
    charmap=`locale charmap`
    if [ -z "$charmap" ]; then
	echo "Nepavyko nustatyti lokalës naudojamo kodavimo.  Gal pas jus OpenBSD?"
    elif [ "$charmap" = "ANSI_X3.4-1968" ]; then
	echo "Lokalës naudojama koduotë yra US-ASCII ($charmap), o ne ISO-8859-13".
	echo "Tikriausiai nenurodëte arba neteisingai nurodëte lokalës pavadinimà."
    elif [ "$charmap" != "ISO-8859-13" ]; then
	echo "Lokalës naudojama koduotë yra $charmap, o ne ISO-8859-13."
    else
	return 0
    fi
    echo "Papildoma informacija (svarbus pirmas netuðèias kintamasis):"
    echo "  LC_ALL=$LC_ALL"
    echo "  LC_CTYPE=$LC_CTYPE"
    echo "  LANG=$LANG"
    echo "Sistemos palaikomø lokaliø sàraðà pamatysite surinkæ komandà"
    echo "  locale -a"
    return 1
}

test_xlocale()
{
    TMPDIR=${TMPDIR:-/tmp}
    cat > $TMPDIR/test_xlocale.c <<END
#include <stdio.h>
#include <locale.h>
#include <X11/Xlib.h>

int main()
{
    char * locale;
    char * modifiers;
    /* Þr. Xlib.ps puslapá 274: X'ams svarbi tik LC_CTYPE kategorija. */
    if (!(locale = setlocale(LC_CTYPE, ""))) {
	printf("C biblioteka nepalaiko lokalës.\n");
	return 1;
    }

    if (!XSupportsLocale()) {
	printf("X Window System nepalaiko lokalës.  Palaikomø lokaliø vardus galite\n"
	       "surasti /usr/X11R6/lib/X11/ kataloge, locale.dir bei locale.alias failuose.\n");
	return 1;
    }

    modifiers = XSetLocaleModifiers("");
    if (!modifiers) {
	printf("XSetLocaleModifiers gràþino klaidos kodà.  Patikrinkite XMODIFIERS aplinkos\n"
	       "kintamàjá.\n");
	return 1;
    }
    return 0;
}
END
    if ${CC:-cc} $CFLAGS -o $TMPDIR/test_xlocale $TMPDIR/test_xlocale.c -L/usr/X11R6/lib -lX11
    then
	$TMPDIR/test_xlocale
	rc=$?
    else
	echo "Nepavyko sukompiliuoti bandomosios programos, gal pas jus nëra X bibliotekø?"
	rc=1
    fi
    rm -f $TMPDIR/test_xlocale $TMPDIR/test_xlocale.c 2>/dev/null
    return $rc
}

test_xfonts()
{
    if [ -n "`xlsfonts -fn '-*-iso8859-13'`" ]; then
	return 0
    fi
    echo "Neradau në vieno ISO-8859-13 ðrifto."
    if [ -f /etc/debian_version; ]; then
	echo "Instaliuokite xfonts-{base,75dpi,100dpi}-transcoded paketus:"
	echo "  sudo apt-get install xfonts-.*-transcoded"
    fi
    return 1
}

test_xkb()
{
    if [ -n "`xmodmap -pk | grep agrave`" ]; then
	echo "Jûsø klaviatûros iðdëstymas neteisingas -- naudoja agrave vietoje aogonek"
    elif [ -z "`xmodmap -pk | grep aogonek`" ]; then
	echo "Jûsø klaviatûros iðdëstymas neturi lietuviðkø raidþiø"
    else
	return 0
    fi
    echo "Pabandykite komandà"
    echo "  setxkbmap -option grp:alt_shift_toggle lt"
    echo "(Lietuviðkos raidës vietoje skaièiø; reþimai perjungiami su Alt-Shift)"
    return 1
}

test_bash()
{
    output="`bash -ic 'bind -v'|grep meta`"
    if [ $? -ne 0 ]; then
	echo "Neradau bash -- gal neinstaliuotas, arba nëra \$PATHe"
	return 1
    fi
    if [ -z "`echo "$output"|grep 'set input-meta on'`" ]; then
	echo "Jûsø ~/.inputrc trûksta eilutës"
	echo "  set input-meta on"
    elif [ -z "`echo "$output"|grep 'set output-meta on'`" ]; then
	echo "Jûsø ~/.inputrc trûksta eilutës"
	echo "  set output-meta on"
    elif [ -z "`echo "$output"|grep 'set meta-flag on'`" ]; then
	echo "Jûsø ~/.inputrc trûksta eilutës"
	echo "  set meta-flag on"
    elif [ -z "`echo "$output"|grep 'set convert-meta off'`" ]; then
	echo "Jûsø ~/.inputrc trûksta eilutës"
	echo "  set convert-meta off"
    else
	return 0
    fi
    return 1
}

# Pati esmë

echo "--- Lokalë (C biblioteka)"
test_locale && echo "Tvarkoje"
echo

echo "--- Lokalë (X Window System)"
test_xlocale && echo "Tvarkoje"
echo

echo "--- ISO-8859-13 X Window System ðriftai"
test_xfonts && echo "Tvarkoje"
echo

echo --- X11 klaviatûra
test_xkb && echo "Tvarkoje"
echo

echo --- GNU bash bei kitos readline naudojanèios programos
test_bash && echo "Tvarkoje"
echo

echo "--- ISO-8859-13 lietuviðkos raidës bei kabutës"
echo "Maþosios: àèæëáðøûþ"
echo "Didþiosios: ÀÈÆËÁÐØÛÞ"
echo "Atidaranèios ir uþdaranèios kabutës: ¥´"
echo
