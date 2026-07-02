#!/usr/bin/env python3
"""split-csv — split CSV into chunks."""
import sys, csv

def main():
    if len(sys.argv) < 3:
        print("Usage: split-csv <file.csv> <rows-per-file>", file=sys.stderr); sys.exit(1)
    src = sys.argv[1]
    chunk = int(sys.argv[2])
    with open(src) as f:
        reader = csv.reader(f)
        header = next(reader)
        rows = list(reader)
    n = 0
    for i in range(0, len(rows), chunk):
        n += 1
        out = f"{src}.{n:03d}.csv"
        with open(out, "w", newline="") as wf:
            w = csv.writer(wf)
            w.writerow(header)
            w.writerows(rows[i:i+chunk])
        print(f"wrote {out}")

if __name__ == "__main__":
    main()
