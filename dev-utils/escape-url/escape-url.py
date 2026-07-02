#!/usr/bin/env python3
"""escape-url — URL-encode."""
import sys, urllib.parse
data = sys.stdin.read() if len(sys.argv) == 1 else " ".join(sys.argv[1:])
print(urllib.parse.quote(data, safe=""))
