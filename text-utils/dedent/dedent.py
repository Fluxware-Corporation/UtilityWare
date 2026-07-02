#!/usr/bin/env python3
"""dedent — strip common indent."""
import sys, textwrap
print(textwrap.dedent(sys.stdin.read()), end="")
