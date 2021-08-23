package EUtilsNCBI;
use strict;
use warnings;

sub get_gene_summary {
    my $ncbi_gene_id = shift;
    my $cmd = "esummary -db  gene -id  $ncbi_gene_id";
    my $xml_reult = `$cmd`;
}
1;
