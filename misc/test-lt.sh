#!/bin/sh
# Lietuvi� kalbos palaikymo testai Linuxui.  Versija 0.1.2
# Copyright (c) 2002 Marius Gedminas <marius@gedmin.as>
# �is skriptas GPLintas.

# UTF-8 norintiems naudoti dr�suoliams �is skriptas nepad�s, nes jis
# pritaikytas ISO-8859-13

# Testai

test_locale()
{
    charmap=`locale charmap`
    if [ -z "$charmap" ]; then
	echo "Nepavyko nustatyti lokal�s naudojamo kodavimo.  Gal pas jus OpenBSD?"
    elif [ "$charmap" = "ANSI_X3.4-1968" ]; then
	echo "Lokal�s naudojama koduot� yra US-ASCII ($charmap), o ne ISO-8859-13".
	echo "Tikriausiai nenurod�te arba neteisingai nurod�te lokal�s pavadinim�."
    elif [ "$charmap" != "ISO-8859-13" ]; then
	echo "Lokal�s naudojama koduot� yra $charmap, o ne ISO-8859-13."
    else
	return 0
    fi
    echo "Papildoma informacija (svarbus pirmas netu��ias kintamasis):"
    echo "  LC_ALL=$LC_ALL"
    echo "  LC_CTYPE=$LC_CTYPE"
    echo "  LANG=$LANG"
    echo "Sistemos palaikom� lokali� s�ra�� pamatysite surink� komand�"
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
    /* �r. Xlib.ps puslap� 274: X'ams svarbi tik LC_CTYPE kategorija. */
    if (!(locale = setlocale(LC_CTYPE, ""))) {
	printf("C biblioteka nepalaiko lokal�s.\n");
	return 1;
    }

    if (!XSupportsLocale()) {
	printf("X Window System nepalaiko lokal�s.  Palaikom� lokali� vardus galite\n"
	       "surasti /usr/X11R6/lib/X11/ kataloge, locale.dir bei locale.alias failuose.\n");
	return 1;
    }

    modifiers = XSetLocaleModifiers("");
    if (!modifiers) {
	printf("XSetLocaleModifiers gr��ino klaidos kod�.  Patikrinkite XMODIFIERS aplinkos\n"
	       "kintam�j�.\n");
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
	echo "Nepavyko sukompiliuoti bandomosios programos, gal pas jus n�ra X bibliotek�?"
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
    echo "Neradau n� vieno ISO-8859-13 �rifto."
    if [ -f /etc/debian_version; ]; then
	echo "Instaliuokite xfonts-{base,75dpi,100dpi}-transcoded paketus:"
	echo "  sudo apt-get install xfonts-.*-transcoded"
    fi
    return 1
}

test_xkb()
{
    if [ -n "`xmodmap -pk | grep agrave`" ]; then
	echo "J�s� klaviat�ros i�d�stymas neteisingas -- naudoja agrave vietoje aogonek"
    elif [ -z "`xmodmap -pk | grep aogonek`" ]; then
	echo "J�s� klaviat�ros i�d�stymas neturi lietuvi�k� raid�i�"
    else
	return 0
    fi
    echo "Pabandykite komand�"
    echo "  setxkbmap -option grp:alt_shift_toggle lt"
    echo "(Lietuvi�kos raid�s vietoje skai�i�; re�imai perjungiami su Alt-Shift)"
    return 1
}

test_bash()
{
    output="`bash -ic 'bind -v'|grep meta`"
    if [ $? -ne 0 ]; then
	echo "Neradau bash -- gal neinstaliuotas, arba n�ra \$PATHe"
	return 1
    fi
    if [ -z "`echo "$output"|grep 'set input-meta on'`" ]; then
	echo "J�s� ~/.inputrc tr�ksta eilut�s"
	echo "  set input-meta on"
    elif [ -z "`echo "$output"|grep 'set output-meta on'`" ]; then
	echo "J�s� ~/.inputrc tr�ksta eilut�s"
	echo "  set output-meta on"
    elif [ -z "`echo "$output"|grep 'set meta-flag on'`" ]; then
	echo "J�s� ~/.inputrc tr�ksta eilut�s"
	echo "  set meta-flag on"
    elif [ -z "`echo "$output"|grep 'set convert-meta off'`" ]; then
	echo "J�s� ~/.inputrc tr�ksta eilut�s"
	echo "  set convert-meta off"
    else
	return 0
    fi
    return 1
}

# Pati esm�

echo "--- Lokal� (C biblioteka)"
test_locale && echo "Tvarkoje"
echo

echo "--- Lokal� (X Window System)"
test_xlocale && echo "Tvarkoje"
echo

echo "--- ISO-8859-13 X Window System �riftai"
test_xfonts && echo "Tvarkoje"
echo

echo --- X11 klaviat�ra
test_xkb && echo "Tvarkoje"
echo

echo --- GNU bash bei kitos readline naudojan�ios programos
test_bash && echo "Tvarkoje"
echo

echo "--- ISO-8859-13 lietuvi�kos raid�s bei kabut�s"
echo "Ma�osios: ���������"
echo "Did�iosios: ���������"
echo "Atidaran�ios ir u�daran�ios kabut�s: ��"
echo
