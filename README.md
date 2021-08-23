# My genomic informatics tools

## Introduction

Set of Perl scripts and modules for querying public genomic data sources. These include:

- Ensembl REST API
- NCBI Entrez Programming Utilities
- BioPerl

## Purpose

- Build one or more Perl modules for wrapping calls to external resources
- The modules here are deliberately non-OO in nature
- The idea is to use the functionality as a collection of shell tools for querying entities such as genes, SNPS, transcripts etc using names or Ensembl IDs


## Links

- [Ensemble REST API endpoints home page](https://rest.ensembl.org)
- [Entrez Direct: E-utilities on the Unix Command Line](https://www.ncbi.nlm.nih.gov/books/NBK179288/)

### Eutils

- [Notes on using NCBI eutils](https://gist.github.com/tomsing1/074e10905a89072144227f4670377d31)
- [The 9 E-utilities and Associated Parameters](https://dataguide.nlm.nih.gov/eutilities/utilities.html)

## Dependencies

### Perl

- cpanm install __Module::Starter__
- cpanm install __JSON__
- cpanm install __Net::SSLeay__
- cpanm install __IO::Socket::SSL__
- cpanm install __Data::Dump__
- cpanm install __XML::Simple__

### External tools

- brew install __jq__ 
- brew install __gnuplot__
- source ./install-edirect.sh # The NCBI eutils tools

## Notes on Current Implementation

- I am re-acquainting myself with Perl so this is just a rough version
- Currently all code -packages and scripts- are in the same directory - This is not a good practice
- Since Perl 5.26, the current directory (.) is not included in _@INC_. A good workaround is discussed in Stackoverflow [here](https://stackoverflow.com/questions/46549671/doesnt-perl-include-current-directory-in-inc-by-default)
- Added a package called __ExtUtils.pm__ for running external utilitis and tools
- Will try to use external tools as much as possible to minimise the code
- External tools add dependencies but all the chosen tools should be easy to install on linux/unix/mac OS X
- Aim is to use __jq__ for most of the JSON munging



## Planned Improvements

- Proper package buiding and installation
- Testing

