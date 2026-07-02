#!/usr/bin/env python3
"""zero-pad — pad numeric filename parts."""
import sys, os, re

def main():
    if len(sys.argv) < 2:
        print("Usage: zero-pad <file...>", file=sys.stderr); sys.exit(1)
    for f in sys.argv[1:]:
        new = re.sub(r"(\d+)", lambda m: m.group(1).zfill(3), f)
        if new != f and not os.path.exists(new):
            os.rename(f, new)
            print(f"{f} -> {new}")

if __name__ == "__main__":
    main()
