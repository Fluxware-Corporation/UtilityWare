#!/usr/bin/env python3
"""head-tail — first and last N lines of a file."""
import sys

def main():
    if len(sys.argv) < 2:
        print("Usage: head-tail <file> [n]", file=sys.stderr); sys.exit(1)
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 10
    lines = open(sys.argv[1]).read().splitlines()
    if len(lines) <= 2 * n:
        print("\n".join(lines))
    else:
        print("\n".join(lines[:n]))
        print(f"... ({len(lines) - 2*n} lines omitted) ...")
        print("\n".join(lines[-n:]))

if __name__ == "__main__":
    main()
