#!/usr/bin/perl
use strict;
use warnings;
use Data::Dump qw(dump);
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use EnsemblRestQueries;

my $ensembl_id = 'ENSG00000157764';
dump EnsemblRestQueries::get_xrefs_for_ensembl_id($ensembl_id);
