# Implementation process pipeline

This template repo helps with setting up a pipeline for an OSLO implementation process (implementatietraject).

- [Application profile](https://data.vlaanderen.be/doc/applicatieprofiel/leermiddelen/ontwerpstandaard/2025-03-21/)
- [SHACL](https://data.vlaanderen.be/doc/applicatieprofiel/leermiddelen/ontwerpstandaard/2025-03-21/shacl/leermiddelen-ap-SHACL.ttl)

## Usage

### Setting up this repository

You only have to do these steps once.

1. [Create a new repository based on this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
2. Set the link to the application profile at `env.ap_url` in the file `.github/workflows/demo.yml`.
3. Set the link to the SHACL at `env.shacl_url` in the file `.github/workflows/demo.yml`.
4. TODO: add instructions on how to set up GitHub pages (points to `docs`)

### Adding data via an Excel file

1. Download the Excel template called `template.xlsx`.
   TODO: Add clearer instructions.
2. Rename the Excel file TODO.
3. Fill in your data in the Excel file.
4. Upload the Excel to the repository.
   TODO: Add clearer instructions.

### Updating data in an Excel file

1. Download the Excel file that you want to update.
   TODO: Add clearer instructions.
2. Update the data in the Excel file.
3. Upload the Excel to the repository.
   TODO: Add clearer instructions.

### Execute queries via the dashboard

1. Browse to the GitHub pages of this repository.
2. TODO: Add Miravi specific instructions

## Extras

- You can reset the README.md via 

  ```shell
  ./scripts/reset-readme.sh
  ```

## License

TODO
