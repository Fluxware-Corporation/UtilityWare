#!/usr/bin/env python3
"""csv-head — pretty first N rows of CSV."""
import sys, csv

def main():
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    src = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
    rows = list(csv.reader(src))[:n+1]
    if not rows: return
    widths = [max(len(r[i]) if i < len(r) else 0 for r in rows)
              for i in range(max(len(r) for r in rows))]
    for r in rows:
        print(" | ".join((r[i] if i < len(r) else "").ljust(widths[i])
                         for i in range(len(widths))))

if __name__ == "__main__":
    main()
