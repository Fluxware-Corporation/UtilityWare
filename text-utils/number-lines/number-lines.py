#!/usr/bin/env python3
"""number-lines — line numbers."""
import sys
for i, line in enumerate(sys.stdin, 1):
    print(f"{i:6d}  {line}", end="")
