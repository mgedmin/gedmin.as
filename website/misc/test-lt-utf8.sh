#!/bin/sh
# Lietuvių kalbos palaikymo testai Linuxui.  Versija 0.1.2
# Copyright (c) 2002 Marius Gedminas <mgedmin@delfi.lt>
# Šis skriptas GPLintas.

# UTF-8 versija

# Testai

test_locale()
{
    charmap=`locale charmap`
    if [ -z "$charmap" ]; then
	echo "Nepavyko nustatyti lokalės naudojamo kodavimo.  Gal pas jus OpenBSD?"
    elif [ "$charmap" = "ANSI_X3.4-1968" ]; then
	echo "Lokalės naudojama koduotė yra US-ASCII ($charmap), o ne UTF-8".
	echo "Tikriausiai nenurodėte arba neteisingai nurodėte lokalės pavadinimą."
    elif [ "$charmap" != "UTF-8" ]; then
	echo "Lokalės naudojama koduotė yra $charmap, o ne UTF-8."
    else
	return 0
    fi
    echo "Papildoma informacija (svarbus pirmas netuščias kintamasis):"
    echo "  LC_ALL=$LC_ALL"
    echo "  LC_CTYPE=$LC_CTYPE"
    echo "  LANG=$LANG"
    echo "Sistemos palaikomų lokalių sąrašą pamatysite surinkę komandą"
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
    /* Žr. Xlib.ps puslapį 274: X'ams svarbi tik LC_CTYPE kategorija. */
    if (!(locale = setlocale(LC_CTYPE, ""))) {
	printf("C biblioteka nepalaiko lokalės.\n");
	return 1;
    }

    if (!XSupportsLocale()) {
	printf("X Window System nepalaiko lokalės.  Palaikomų lokalių vardus galite\n"
	       "surasti /usr/X11R6/lib/X11/ kataloge, locale.dir bei locale.alias failuose.\n");
	return 1;
    }

    modifiers = XSetLocaleModifiers("");
    if (!modifiers) {
	printf("XSetLocaleModifiers grąžino klaidos kodą.  Patikrinkite XMODIFIERS aplinkos\n"
	       "kintamąjį.\n");
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
	echo "Nepavyko sukompiliuoti bandomosios programos, gal pas jus nėra X bibliotekų?"
	rc=1
    fi
    rm -f $TMPDIR/test_xlocale $TMPDIR/test_xlocale.c 2>/dev/null
    return $rc
}

test_xfonts()
{
    if [ -n "`xlsfonts -fn '-*-iso10646-1'`" ]; then
	return 0
    fi
    echo "Neradau nė vieno ISO-10646-1 šrifto."
    if [ -f /etc/debian_version; ]; then
	echo "Instaliuokite xfonts-{base,75dpi,100dpi} paketus:"
	echo "  sudo apt-get install xfonts-.*"
    fi
    return 1
}

test_xkb()
{
    if [ -n "`xmodmap -pk | grep agrave`" ]; then
	echo "Jūsų klaviatūros išdėstymas neteisingas -- naudoja agrave vietoje aogonek"
    elif [ -z "`xmodmap -pk | grep aogonek`" ]; then
	echo "Jūsų klaviatūros išdėstymas neturi lietuviškų raidžių"
    else
	return 0
    fi
    echo "Pabandykite komandą"
    echo "  setxkbmap -option grp:alt_shift_toggle lt"
    echo "(Lietuviškos raidės vietoje skaičių; režimai perjungiami su Alt-Shift)"
    return 1
}

test_bash()
{
    output="`bash -ic 'bind -v'|grep meta`"
    if [ $? -ne 0 ]; then
	echo "Neradau bash -- gal neinstaliuotas, arba nėra \$PATHe"
	return 1
    fi
    if [ -z "`echo "$output"|grep 'set input-meta on'`" ]; then
	echo "Jūsų ~/.inputrc trūksta eilutės"
	echo "  set input-meta on"
    elif [ -z "`echo "$output"|grep 'set output-meta on'`" ]; then
	echo "Jūsų ~/.inputrc trūksta eilutės"
	echo "  set output-meta on"
    elif [ -z "`echo "$output"|grep 'set meta-flag on'`" ]; then
	echo "Jūsų ~/.inputrc trūksta eilutės"
	echo "  set meta-flag on"
    elif [ -z "`echo "$output"|grep 'set convert-meta off'`" ]; then
	echo "Jūsų ~/.inputrc trūksta eilutės"
	echo "  set convert-meta off"
    else
	return 0
    fi
    return 1
}

# Pati esmė

echo "--- Lokalė (C biblioteka)"
test_locale && echo "Tvarkoje"
echo

echo "--- Lokalė (X Window System)"
test_xlocale && echo "Tvarkoje"
echo

echo "--- ISO-8859-13 X Window System šriftai"
test_xfonts && echo "Tvarkoje"
echo

echo --- X11 klaviatūra
test_xkb && echo "Tvarkoje"
echo

echo --- GNU bash bei kitos readline naudojančios programos
test_bash && echo "Tvarkoje"
echo

echo "--- UTF-8 lietuviškos raidės bei kabutės"
echo "Mažosios: ąčęėįšųūž"
echo "Didžiosios: ĄČĘĖĮŠŲŪŽ"
echo "Atidarančios ir uždarančios kabutės: „“"
echo
