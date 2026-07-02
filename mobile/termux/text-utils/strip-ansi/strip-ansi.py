#!/usr/bin/env python3
"""strip-ansi — strip ANSI escapes."""
import sys, re
ansi = re.compile(r"\x1b\[[0-9;]*[a-zA-Z]")
for line in sys.stdin:
    print(ansi.sub("", line), end="")
