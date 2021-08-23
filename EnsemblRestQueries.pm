package EnsemblRestQueries;
use strict;
use warnings;
use HTTP::Tiny;

# A module to execute Ensemble REST API calls for specific end-points
# Subroutine documentation is copied directly from the Ensembl end-point descriptions (https://rest.ensembl.org)
#
my $base_url = "https://rest.ensembl.org/"; # Need a better way of setting this value


# Return a JSON string for a given end-point.
# All GET end-point calls are routed through this subroutine
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

# Return a JSON string for a given POST end-point.
# All POST end-point calls are routed through this subroutine
sub post_json_for_endpoint {
    my $endpoint_url = shift;
    my $content = shift;
    my $url = $base_url . $endpoint_url;
    my $http = HTTP::Tiny->new();
    my $response = $http->request('POST', $url, {
         headers => { 
  	   'Content-type' => 'application/json',
  	  'Accept' => 'application/json'
          },
       content => $content
       });
    die "URL: $url call failed! Error: $!\n" unless $response->{success};
    if(length $response->{content}) {
        return $response->{content};
    }
}

# Create and return the "content =>" section for a POST request for a given list
sub wrap_post_request_content_list {
    my @request_list = @_;
    my $post_request_content_list = '[' . join(', ', map {'"' . $_ . '"'} @request_list) . ']';
    $post_request_content_list  = '{ "id" : ' . $post_request_content_list . ' }';
    return $post_request_content_list;
}


########## Archive #########
# GET archive/id/:id Uses the given identifier to return its latest version
sub get_archive_ensembl_id_version {
    my $ensembl_id = shift;
    my $endpoint_url = "/archive/id/$ensembl_id?";
    return get_json_for_endpoint($endpoint_url);
}

# POST archive/id Retrieve the latest version for a set of identifiers
sub  post_archive_ensembl_id_version {
    my @ensembl_ids = @_;  
    my $content = wrap_post_request_content_list(@ensembl_ids);
    my $endpoint_url = '/archive/id';
    return  post_json_for_endpoint($endpoint_url, $content);

}


########## xref #########

#GET xrefs/id/:id Perform lookups of Ensembl Identifiers and retrieve their external references in other databases
sub get_xrefs_for_ensembl_id {
    my $ensembl_id = shift;
    my $endpoint_url = "xrefs/id/$ensembl_id?";
    return get_json_for_endpoint($endpoint_url);
}

# GET xrefs/symbol/:species/:symbol https://rest.ensembl.org/documentation/info/xref_external
# Given a species name (e.g. homo_sapiens) and a symbol (e.g. BRCA2), return a JSON string of xrefs
sub get_xref_for_species_symbol {
    my $species = shift;
    my $symbol = shift;
    my $endpoint_url = "/xrefs/symbol/$species/$symbol?";
    return get_json_for_endpoint($endpoint_url);
}

# GET xrefs/name/:species/:name Performs a lookup based upon the primary accession or display label of an external reference and returning the information we hold about the entry
# https://rest.ensembl.org/documentation/info/xref_name
sub get_xrefs_species_name {
    my $name = shift;
    my $symbol = shift;
    my $endpoint_url = "/xrefs/name/$name/$symbol?";
    return get_json_for_endpoint($endpoint_url);

}
1;
