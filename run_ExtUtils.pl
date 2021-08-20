#!/usr/local/bin/perl
use strict;
use warnings;
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use ExtUtils;

my @utils = qw(jq sqlite3 gnuplot kke);
foreach my $util (@utils) {
    if (  ExtUtils::is_util_available($util) ) {
        print "Util name: $util Version: ", ExtUtils::util_version($util), "\n";
    } else {
        print "Util name: $util not located\n";
    }
}
