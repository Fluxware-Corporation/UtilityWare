#!/usr/bin/env python3
"""reverse — reverse input."""
import sys

def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else "lines"
    lines = sys.stdin.read().splitlines()
    if mode == "lines":
        for l in reversed(lines): print(l)
    elif mode == "chars":
        for l in lines: print(l[::-1])
    elif mode == "words":
        for l in lines: print(" ".join(l.split()[::-1]))
    else:
        print("reverse: mode must be lines|chars|words", file=sys.stderr); sys.exit(1)

if __name__ == "__main__":
    main()
