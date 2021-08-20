package ExtUtils;


sub is_util_available {
    my $util_name = shift;
    my $which_cmd = "which $util_name";
    my $cmd_output = `$which_cmd`;

    if ( $cmd_output ) {
        return 1;
    }
    return 0;
}

sub util_version {
    my $util_name = shift;
    my $version_cmd = "$util_name --version";
    my $cmd_output = `$version_cmd`;

    chomp $cmd_output; 
    return $cmd_output;
}
1;
