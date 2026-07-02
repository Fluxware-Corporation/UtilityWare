#!/usr/bin/env python3
"""ascii-table — CSV to Markdown table."""
import sys, csv

def main():
    if len(sys.argv) > 1 and sys.argv[1] != "-":
        f = open(sys.argv[1])
    else:
        f = sys.stdin
    rows = list(csv.reader(f))
    if not rows:
        return
    widths = [max(len(r[i]) if i < len(r) else 0 for r in rows)
              for i in range(max(len(r) for r in rows))]
    def fmt(row):
        return "| " + " | ".join((row[i] if i < len(row) else "").ljust(widths[i])
                                  for i in range(len(widths))) + " |"
    print(fmt(rows[0]))
    print("|" + "|".join("-"*(w+2) for w in widths) + "|")
    for r in rows[1:]:
        print(fmt(r))

if __name__ == "__main__":
    main()
