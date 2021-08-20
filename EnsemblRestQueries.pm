package EnsemblRestQueries;
use HTTP::Tiny;


my $base_url = "https://rest.ensembl.org/";

sub get_json_for_endpoint {
    my $endpoint_url = shift;
    my $url = $base_url . $endpoint_url;
    my $http = HTTP::Tiny->new();
    my $response = $http->get($url, {
                   headers => { 'Content-type' => 'application/json' }
         });
 #die "Failed!\n" unless $response->{success};
    if(length $response->{content}) {
        return $response->{content};
    }
}

sub get_xrefs_for_ensembl_id {
    my $ensembl_id = shift;
    my $end_point_url = "xrefs/id/$ensembl_id?";
    return get_json_for_endpoint($end_point_url);
}

1;
