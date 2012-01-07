#!/bin/sh
perl gno2ice.pl > menu.gnome
perl kde2ice.pl > menu.kde
[ -f menu ] && chmod +w menu
perl -ne 'if (/\@GNOME\@/) { print `cat menu.gnome` } elsif (/\@KDE\@/) { print `cat menu.kde` } else { print }' menu.src > menu
chmod -w menu
