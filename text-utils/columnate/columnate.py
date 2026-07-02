#!/usr/bin/env python3
"""columnate — columnate delimited input."""
import sys, argparse

def main():
    p = argparse.ArgumentParser(description="Columnate input.")
    p.add_argument("-d", "--delimiter", default=",")
    p.add_argument("-s", "--sep", default="  ", help="output separator")
    args = p.parse_args()
    rows = [line.rstrip("\n").split(args.delimiter) for line in sys.stdin]
    if not rows: return
    widths = [max(len(str(r[i])) if i < len(r) else 0 for r in rows)
              for i in range(max(len(r) for r in rows))]
    for r in rows:
        print(args.sep.join((str(r[i]) if i < len(r) else "").ljust(widths[i])
                            for i in range(len(widths))))

if __name__ == "__main__":
    main()
