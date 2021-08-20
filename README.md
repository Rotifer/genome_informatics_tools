# Ensembl REST API Notes

## Purpose

- Build one or more Perl modules for wrapping calls to the Ensembl REST API
- The modules here are deliberately non-OO in nature
- The idea is to use the functionality as a collection of shell tools for querying entities such as genes, SNPS, transcripts etc using names or Ensembl IDs
- For example, to get a list of SNPs for a gene specified by either name or ID
- Loosely modelled on the approach employed by NCBI's [Edirect tool](https://www.ncbi.nlm.nih.gov/books/NBK179288/)
- Aims to use the system Perl (using version 5.32 on Mac)
- Minimise the use of CPAN packages to make installs as easy as possible with minimal requirements
- This is a prototype and I would ideally like to move it to a compiled Go utility


## Links

[Ensemble REST API endpoints home page](https://rest.ensembl.org)


## Dependencies

### Perl

- cpanm install __Module::Starter__
- cpanm install __JSON__
- cpanm install __Net::SSLeay__
- cpanm install __IO::Socket::SSL__
- cpanm install __Data::Dump__

### External tools

- brew install __jq__ 
- brew install __gnuplot__

## Notes on Current Implementation

- I am re-acquainting myself with Perl so this is just a rough version
- Currently all code -packages and scripts- are in the same directory - This is not a good practice
- Since Perl 5.26, the current directory (.) is not included in _@INC_. A good workarounf is discussed in Stackoverflow [here](https://stackoverflow.com/questions/46549671/doesnt-perl-include-current-directory-in-inc-by-default)
- Added a package called __ExtUtils.pm__ for running external utilitis and tools
- Will try to use external tools as much as possible to minimise the code
- External tools add dependencies but all the chosen tools should be easy to install on linux/unix/mac OS X
- Aim is to use __jq__ for most of the JSON munging

## Planned Improvements

- Proper package buiding and installation
- Testing

