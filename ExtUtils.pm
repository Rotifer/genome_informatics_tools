package ExtUtils;


# A module to provide information on commandline tools


# Determine if the given tool name is available. Returns boolean
sub is_util_available {
    my $util_name = shift;
    my $which_cmd = "which $util_name";
    my $cmd_output = `$which_cmd`;

    if ( $cmd_output ) {
        return 1;
    }
    return 0;
}

# Return the version of the given tool name. Assumes it supports --version option
sub util_version {
    my $util_name = shift;
    my $version_cmd = "$util_name --version";
    my $cmd_output = `$version_cmd`;

    chomp $cmd_output; 
    return $cmd_output;
}
1;
