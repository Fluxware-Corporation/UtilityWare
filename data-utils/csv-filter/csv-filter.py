#!/usr/bin/env python3
"""csv-filter — filter CSV by column value."""
import sys, csv

def main():
    if len(sys.argv) < 3:
        print("Usage: csv-filter <column> <value> [file]", file=sys.stderr); sys.exit(1)
    col, val = sys.argv[1], sys.argv[2]
    src = open(sys.argv[3]) if len(sys.argv) > 3 else sys.stdin
    reader = csv.reader(src)
    header = next(reader)
    try:
        idx = header.index(col)
    except ValueError:
        print(f"csv-filter: column '{col}' not found", file=sys.stderr); sys.exit(1)
    w = csv.writer(sys.stdout)
    w.writerow(header)
    for row in reader:
        if idx < len(row) and row[idx] == val:
            w.writerow(row)

if __name__ == "__main__":
    main()
