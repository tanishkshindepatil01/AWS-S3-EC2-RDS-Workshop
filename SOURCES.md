# Sources and attribution

## Workshop materials

The supplied **LSDE Workshop, Week 5** slides identify **Dr Wei Wei** and
**Dr Hugo Alcaraz Herrera**, University of Bristol, as presenters. A copy with
example cloud identifiers removed is included at
[docs/source/LSDE_Workshop_Week_5_Redacted.pdf](docs/source/LSDE_Workshop_Week_5_Redacted.pdf).
The slides are reference material; use the README's Amazon Linux 2023 commands
and corrected CSV imports for the practical documented here.

The illustrated guide uses the workshop instructions and supplied practical
screenshots. The 16 repository images are cropped, permanently redacted copies.
Browser account headers, personal identifiers and resource addresses have been
removed. The unredacted screenshot document and original screenshot files are
excluded from this upload package.

## Data

- **AMZN.csv:** supplied course finance dataset. The slides link to
  [Amazon.com historical data on Yahoo Finance](https://finance.yahoo.com/quote/AMZN/history/).
  The repository uses the supplied 251-row file, not a fresh download.
- **Water.csv:** supplied course water dataset. The supplied files do not identify
  the original station, units or dataset license.
- **bristol.txt:** supplied text passage with attribution to
  [Bristol on Wikipedia](https://en.wikipedia.org/wiki/Bristol).
  Its embedded attribution and source bytes are preserved.

Third-party course materials, datasets, text and logos retain their original
attribution and applicable terms. This package does not assign a blanket license
to those materials.

## Official technical references

- [AWS: Granting public access to S3 data](https://docs.aws.amazon.com/AmazonS3/latest/userguide/granting-public-access.html)
- [AWS: Creating and connecting to a MySQL DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.MySQL.html)
- [AWS: Importing data from any source to RDS for MySQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/mysql-importing-data-any-source.html)
- [AWS: Using SSL/TLS with RDS for MySQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html)
- [AWS: Working with DB parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html)
- [MariaDB: mariadb command-line client options](https://mariadb.com/docs/server/clients-and-utilities/mariadb-client/mariadb-command-line-client)
- [GitHub: Adding a file to a repository](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository)

The steps target an AWS Academy sandbox. Region, permitted instance types,
engine versions and console labels can vary by lab. No real credentials or
personal cloud addresses are needed in this repository.
