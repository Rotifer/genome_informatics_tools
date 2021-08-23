#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use Data::Dump qw(dump);
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use EnsemblRestQueries;

my $ensembl_id = 'ENSG00000157764';
my $gene_xrefs = EnsemblRestQueries::get_xrefs_for_ensembl_id($ensembl_id);
my $gene_xrefs_ds = decode_json($gene_xrefs); 
my $ref_type = ref $gene_xrefs_ds;
print "$ref_type\n";
my $first_element = $gene_xrefs_ds->[0];
print "The gene xrefs are:\n";
foreach my $gene_xref (@{$gene_xrefs_ds}) {
    dump($gene_xref);
}

my $json_file_name = 'gene_xref_json_example_' . $ensembl_id . '.json';
open(my $fh, '>', $json_file_name);
print $fh  $gene_xrefs;
close($fh);

my $ensembl_id = 'ENSMUSG00000017167';
print EnsemblRestQueries::get_archive_ensembl_id_version($ensembl_id), "\n";

my @ensembl_id_list = qw(ENSG00000157764 ENSG00000248378);
print EnsemblRestQueries::get_archive_ensembl_id_version_for_list(@ensembl_id_list);


