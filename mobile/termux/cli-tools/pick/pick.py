#!/usr/bin/env python3
"""pick — pick one line from stdin interactively."""
import sys

def main():
    lines = sys.stdin.read().splitlines()
    if not lines:
        print("pick: no input", file=sys.stderr); sys.exit(1)
    for i, l in enumerate(lines, 1):
        print(f"{i:3d}. {l[:100]}", file=sys.stderr)
    try:
        n = int(input("Pick number: "))
        print(lines[n-1])
    except (ValueError, IndexError, EOFError):
        sys.exit(1)

if __name__ == "__main__":
    main()
