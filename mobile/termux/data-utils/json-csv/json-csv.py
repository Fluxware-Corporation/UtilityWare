#!/usr/bin/env python3
"""json-csv — JSON array to CSV."""
import sys, json, csv

def main():
    src = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
    data = json.load(src)
    if not isinstance(data, list) or not all(isinstance(r, dict) for r in data):
        print("json-csv: expected array of objects", file=sys.stderr); sys.exit(1)
    cols = list({k for r in data for k in r.keys()})
    w = csv.writer(sys.stdout)
    w.writerow(cols)
    for r in data:
        w.writerow([r.get(c, "") for c in cols])

if __name__ == "__main__":
    main()
