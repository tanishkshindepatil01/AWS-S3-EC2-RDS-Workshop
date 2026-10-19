# Supplied workshop data

The files are copied byte for byte from the supplied course files. Only filenames
were simplified so that the README, S3 objects and SQL imports use the same names.

| Uploaded filename | Repository filename | Records excluding header | Date range |
| --- | --- | ---: | --- |
| `AMZN(1).csv` | [AMZN.csv](AMZN.csv) | 251 | 2020-11-09 to 2021-11-05 |
| `Water(1).csv` | [Water.csv](Water.csv) | 16,436 | 1970-10-01 to 2015-09-30 |
| `bristol (1)(1).txt` | [bristol.txt](bristol.txt) | Text passage | Not applicable |

## Finance columns

```text
date,open,high,low,close,adj_close,volume
```

SQL maps `adj_close` to `adj` by its position. Prices are rounded to four decimal
places by `DECIMAL(12,4)` in the workshop table; the CSV retains its original precision.
`volume` is an unsigned `BIGINT`. There are no blank fields or duplicate dates.

## Water columns

```text
date,precipitation,pet,temperature,discharge_spec,discharge_vol,peti,humidity,shortwave_rad,longwave_rad,windspeed
```

| CSV column | SQL column | Handling |
| --- | --- | --- |
| `discharge_spec` | `disch_spec` | 9,170 empty fields become `NULL` |
| `discharge_vol` | `disch_vol` | 9,170 empty fields become `NULL` |
| `shortwave_rad` | `short_rad` | Positional mapping |
| `longwave_rad` | `long_rad` | Positional mapping |
| Other columns | Same name | Required values |

Dates are unique and sorted. Every other numeric column has no empty fields.
The source does not provide a station identifier, units or a full data dictionary;
none are inferred here. The artificial UPDATE values in the exercise do not alter
these raw files. If you commit the example Water update, each database discharge
NULL count becomes 9,169 while the raw file still contains 9,170 empty fields.

## Text file

`bristol.txt` includes a Wikipedia attribution URL. Its original character-encoding
artifacts are retained to preserve the supplied file. See [SOURCES.md](../SOURCES.md).

## Check the files offline

From the repository root, using Python 3:

```bash
python3 scripts/check_data.py
python3 scripts/check_data.py --json
```

This checks counts, headers, dates, numeric fields, missing values and duplicate
dates. A saved machine-readable summary is in
[dataset_summary.json](../docs/dataset_summary.json).
