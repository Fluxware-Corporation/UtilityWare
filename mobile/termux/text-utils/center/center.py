#!/usr/bin/env python3
"""center — center text."""
import sys

def main():
    width = int(sys.argv[1]) if len(sys.argv) > 1 else 80
    for line in sys.stdin:
        line = line.rstrip("\n")
        print(line.center(width))

if __name__ == "__main__":
    main()
