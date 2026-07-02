#!/usr/bin/env python3
"""search-highlight — grep with highlight."""
import sys, re

def main():
    if len(sys.argv) < 2:
        print("Usage: search-highlight <pattern> [file]", file=sys.stderr); sys.exit(1)
    pat = sys.argv[1]
    src = open(sys.argv[2]) if len(sys.argv) > 2 else sys.stdin
    rx = re.compile(re.escape(pat), re.IGNORECASE)
    for line in src:
        if rx.search(line):
            print(rx.sub(lambda m: f"\033[1;31m{m.group()}\033[0m", line.rstrip()))

if __name__ == "__main__":
    main()
