package EnsemblRestQueries;
use HTTP::Tiny;

# A module to execute Ensemble REST API calls for specific end-points

my $base_url = "https://rest.ensembl.org/"; # Need a better way of setting this value

# Return a JSON string for a given end-point.
# All end-oint calls are routed through this subroutine
sub get_json_for_endpoint {
    my $endpoint_url = shift;
    my $url = $base_url . $endpoint_url;
    my $http = HTTP::Tiny->new();
    my $response = $http->get($url, {
                   headers => { 'Content-type' => 'application/json' }
         });
    die "URL: $url call failed! Error: $!\n" unless $response->{success};
    if(length $response->{content}) {
        return $response->{content};
    }
}

# Return all cross-references for a given Ensembl ID, for example: gene, transcript, variant for any species.
sub get_xrefs_for_ensembl_id {
    my $ensembl_id = shift;
    my $end_point_url = "xrefs/id/$ensembl_id?";
    return get_json_for_endpoint($end_point_url);
}

1;
