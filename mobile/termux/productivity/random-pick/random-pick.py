#!/usr/bin/env python3
"""random-pick — pick a random line."""
import sys, random
lines = [l for l in sys.stdin.read().splitlines() if l.strip()]
if not lines:
    print("random-pick: no input", file=sys.stderr); sys.exit(1)
print(random.choice(lines))
