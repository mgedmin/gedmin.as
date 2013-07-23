#!/usr/bin/perl -w
# Interprets strings like char-major-NNN and sound-slot-N-M
# Version 0.1
# Copyright (c) 2001 Marius Gedminas
# This program is licenced under the GNU GPL v2 or any later version
#
# $Id: explain-module.pl,v 1.2 2001/05/06 16:52:47 mg Exp $
use strict;

# devices
my $devices_txt = "/usr/src/linux/Documentation/devices.txt";

my %char_major;
my %block_major;
my %char_minor;
my %block_minor;
sub read_devices() {
    unless (open F, "<$devices_txt") {
	print STDERR "couldn't read $devices_txt\n";
	return
    }
    my $curdev;
    my $block = 0;
    while (my $line = <F>) {
	chomp($line);
	if ($line =~ /^\s*(\d+) char\s*(.+)$/) {
	    $curdev = $1;
	    $char_major{$curdev} = $2;
	    $block = 0;
	} elsif ($line =~ /^\s*block\s*(.+)$/ && defined $curdev) {
	    $block_major{$curdev} = $1;
	    $block = 1;
	} elsif ($line =~ /^\s+(\d+)\s*=\s*(.+)$/ && defined $curdev) {
	    if ($block) {
		$block_minor{$curdev}{$1} = $2;
	    } else {
		$char_minor{$curdev}{$1} = $2;
	    }
	}
    }
    close F;
}

# sound
my %sound_slot = (
	0 => 'Mixer control (/dev/mixer*)',
	1 => 'Audio sequencer (/dev/sequencer, /dev/patmgr*)',
	2 => 'First MIDI port (/dev/midi0?)',
	3 => 'Digital audio (/dev/dsp*, /dev/audio*)',
	# 4, 5 redirected to 3
	6 => 'Sound card status information (/dev/sndstat) [obsolete]',
	7 => 'SPARC audio control device (/dev/audioctl)',
	8 => 'Sequencer -- alternate device (/dev/sequencer2)'
	);

# Network protocol families
my %net_pf = (
	0  => "AF_UNSPEC",
	1  => "AF_UNIX -- Unix domain sockets",
	1  => "AF_LOCAL -- POSIX name for AF_UNIX",
	2  => "AF_INET -- Internet IP Protocol",
	3  => "AF_AX25 -- Amateur Radio AX.25",
	4  => "AF_IPX -- Novell IPX",
	5  => "AF_APPLETALK -- AppleTalk DDP",
	6  => "AF_NETROM -- Amateur Radio NET/ROM",
	7  => "AF_BRIDGE -- Multiprotocol bridge",
	8  => "AF_ATMPVC -- ATM PVCs",
	9  => "AF_X25 -- Reserved for X.25 project",
	10 => "AF_INET6 -- IP version 6",
	11 => "AF_ROSE -- Amateur Radio X.25 PLP",
	12 => "AF_DECnet -- Reserved for DECnet project",
	13 => "AF_NETBEUI -- Reserved for 802.2LLC project",
	14 => "AF_SECURITY -- Security callback pseudo AF",
	15 => "AF_KEY -- PF_KEY key management API",
	16 => "AF_NETLINK",
	17 => "AF_PACKET -- Packet family",
	18 => "AF_ASH -- Ash",
	19 => "AF_ECONET -- Acorn Econet",
	20 => "AF_ATMSVC -- ATM SVCs",
	22 => "AF_SNA -- Linux SNA Project (nutters!)",
	23 => "AF_IRDA -- IRDA sockets",
	# 32 => "AF_MAX -- For now..",
	);

# pseudo-modules in Linux 2.2.18
#   binfmt-%04x
# + block-major-%d
# + char-major-%d
#   char-major-%d-%d
#   md-personality-%d
# + net-pf-%d
#   tty-ldisc-%d
# - ppp-compress-%d
#   scsi_hostadapter		# loading a scsi device module
#   synth0			# opening /dev/sequencer
# + sound-slot-%i
# + sound-service-%i-%i
#   mixer%d
#   fb%d
#   nls_%s
#   ip_masq_%s
#   irda-dongle-%d
#   cls_%s
#   sch_%s
# are these real?
#   ide-probe? ide-disk? ide-cd? ide-tape? ide-floppy?
# huh?
#   comx-hw-%s
#   comx-proto-%s
# also
#   $network_interface_name

sub explain($) {
    my $name = shift;
    # major devices
    if ($name =~ /^char-major-(\d+)$/ && defined $char_major{$1}) {
	return $char_major{$1}
    }
    if ($name =~ /^block-major-(\d+)$/ && defined $block_major{$1}) {
	return $block_major{$1}
    }
    # minor devices
    if ($name =~ /^char-major-(\d+)-(\d+)$/) {
	return $char_minor{$1}{$2} if defined $char_minor{$1}{$2};
	return "unrecognized minor number for " . $char_major{$1} if defined $char_major{$1};
    }
    if ($name =~ /^block-major-(\d+)-(\d+)$/) {
	return $block_minor{$1}{$2} if defined $block_minor{$1}{$2};
	return "unrecognized minor number for " . $block_major{$1} if defined $block_major{$1};
    }
    # sound
    if ($name =~ /^sound-slot-(\d+)$/) {
	return "sound card #$1";
    }
    if ($name =~ /^sound-service-(\d+)-(\d+)$/) {
	return $sound_slot{$2} || "unknown service", " for card #$1";
    }
    # network protocol families
    if ($name =~ /^net-pf-(\d+)$/ && defined $net_pf{$1}) {
	return "protocol family $net_pf{$1}";
    }
    # too bad
    return "not recognized";
}

read_devices();

print "$_: ", explain($_), "\n" for @ARGV;
