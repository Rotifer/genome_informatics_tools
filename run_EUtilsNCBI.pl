#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use Data::Dump qw(dump);
use Cwd qw( abs_path );
use XML::XML2JSON;
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use EUtilsNCBI;

print "ok\n";
my $ncbi_gene_id = 952;
my $gene_summary_xml = EUtilsNCBI::get_gene_summary($ncbi_gene_id);
my $XML2JSON = XML::XML2JSON->new();
my $JSON = $XML2JSON->convert($gene_summary_xml);
my $gene_json_ref = decode_json $JSON;
dump $gene_json_ref;


