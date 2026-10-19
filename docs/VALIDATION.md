# Validation and expected results

## Supplied files

| Check | Result |
| --- | --- |
| Finance records, excluding header | 251 |
| Water records, excluding header | 16,436 |
| Duplicate dates in either CSV | 0 |
| Missing fields in finance data | 0 |
| Missing `discharge_spec` values | 9,170 |
| Missing `discharge_vol` values | 9,170 |
| Other missing Water fields | 0 |

Run `python3 scripts/check_data.py` from the repository root to repeat the
offline checks. SHA-256 hashes and column lists are in [dataset_summary.json](dataset_summary.json).

## Database evidence

The supplied practical screenshots record 251 rows in `finance_db.amazon_prices`
and 16,436 rows in `water_db.water_data`. Run [05_verify.sql](../sql/05_verify.sql)
in your own RDS session to check the actual counts, date ranges and sample records.
Read `SHOW WARNINGS` immediately after each import. Matching row counts alone do
not establish that every value imported correctly.

The raw finance precision is reduced to four decimal places by the table schema.
The Water import maps blank discharge values to `NULL`. The optional example
updates use artificial values and should be distinguished from source data.

## Package checks

This package was checked offline for CSV validity, relative document/image links,
shell syntax, script usage errors, archive integrity and sensitive identifiers.
The existing illustrated PDF was rendered and visually reviewed. The source
slide copy was checked after identifier removal. Cloud commands and SQL scripts
still require your active Academy lab; they were not executed against a new AWS
environment during repository packaging.
