#!/usr/bin/env python3
"""escape-html — escape HTML special chars."""
import sys, html
data = sys.stdin.read() if len(sys.argv) == 1 else " ".join(sys.argv[1:])
print(html.escape(data))
