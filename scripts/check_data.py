#!/usr/bin/env python3
"""Validate the supplied CSV data locally; no AWS credentials or packages needed."""
import argparse
import csv
import hashlib
import json
from datetime import date
from decimal import Decimal, InvalidOperation
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATASETS = {
    'AMZN.csv': {
        'columns': ['date', 'open', 'high', 'low', 'close', 'adj_close', 'volume'],
        'rows': 251, 'first_date': '2020-11-09', 'last_date': '2021-11-05',
        'nullable': {},
    },
    'Water.csv': {
        'columns': ['date', 'precipitation', 'pet', 'temperature', 'discharge_spec',
                    'discharge_vol', 'peti', 'humidity', 'shortwave_rad',
                    'longwave_rad', 'windspeed'],
        'rows': 16436, 'first_date': '1970-10-01', 'last_date': '2015-09-30',
        'nullable': {'discharge_spec': 9170, 'discharge_vol': 9170},
    },
}

def check_file(path, expected):
    with path.open(encoding='utf-8-sig', newline='') as stream:
        reader = csv.reader(stream)
        header = next(reader)
        if header != expected['columns']:
            raise ValueError(f'{path.name}: unexpected header {header!r}')
        rows = list(reader)
    if len(rows) != expected['rows']:
        raise ValueError(f"{path.name}: expected {expected['rows']} records, got {len(rows)}")
    dates = []
    blanks = {column: 0 for column in header}
    for line, row in enumerate(rows, start=2):
        if len(row) != len(header):
            raise ValueError(f'{path.name}:{line}: wrong number of fields')
        date.fromisoformat(row[0])
        dates.append(row[0])
        for column, value in zip(header, row):
            if value == '':
                blanks[column] += 1
                if column not in expected['nullable']:
                    raise ValueError(f'{path.name}:{line}: missing required {column}')
            elif column != 'date':
                try:
                    number = Decimal(value)
                except InvalidOperation as error:
                    raise ValueError(f'{path.name}:{line}: invalid {column}') from error
                if not number.is_finite():
                    raise ValueError(f'{path.name}:{line}: non-finite {column}')
                if column == 'volume' and (number < 0 or number != number.to_integral_value()):
                    raise ValueError(f'{path.name}:{line}: volume must be a non-negative integer')
    if len(set(dates)) != len(dates) or dates != sorted(dates):
        raise ValueError(f'{path.name}: dates must be unique and in ascending order')
    if dates[0] != expected['first_date'] or dates[-1] != expected['last_date']:
        raise ValueError(f'{path.name}: unexpected date range')
    if {column: count for column, count in blanks.items() if count} != expected['nullable']:
        raise ValueError(f'{path.name}: unexpected missing-value counts')
    return {
        'file': path.name, 'rows': len(rows), 'columns': header,
        'first_date': dates[0], 'last_date': dates[-1],
        'duplicate_dates': len(dates) - len(set(dates)),
        'empty_fields': blanks,
        'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
    }

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--data-dir', type=Path, default=ROOT / 'data')
    parser.add_argument('--json', action='store_true', help='Print the full summary as JSON')
    args = parser.parse_args()
    summaries = [check_file(args.data_dir / name, expected) for name, expected in DATASETS.items()]
    if args.json:
        print(json.dumps({'status': 'passed', 'datasets': summaries}, indent=2))
    else:
        for item in summaries:
            print(f"PASS {item['file']}: {item['rows']:,} rows, {item['first_date']} to {item['last_date']}")
        print('Headers, numeric fields, missing values and unique sorted dates checked.')

if __name__ == '__main__':
    main()
