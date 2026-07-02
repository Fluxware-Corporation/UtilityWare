#!/usr/bin/env python3
"""filter-unique — ordered uniq."""
import sys
seen = set()
for line in sys.stdin:
    if line not in seen:
        seen.add(line)
        print(line, end="")
