# Notes on __jq__

- I plan to use _jq_ for the bulk of JSONB manipulation
- The Ensembl REST API returns JSON and it might be easier to use _jq_ embedded in Perl system commands than trying to do this in Perl
- It will also force me to learn _jq_

## Input files

- File _gene_xref_json_example_ENSG00000157764.json_ is a gene cross-reference JSON putput generated by:

```{perl}
my $ensembl_id = 'ENSG00000157764';
my $gene_xrefs = EnsemblRestQueries::get_xrefs_for_ensembl_id($ensembl_id);
```

## Tips

### Pretty printing JSON with added colours

```{console}
jq --color-output . gene_xref_json_example_ENSG00000157764.json
```


