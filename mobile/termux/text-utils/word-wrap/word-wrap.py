#!/usr/bin/env python3
"""word-wrap — wrap text."""
import sys, textwrap

def main():
    width = int(sys.argv[1]) if len(sys.argv) > 1 else 80
    text = sys.stdin.read()
    print(textwrap.fill(text, width=width))

if __name__ == "__main__":
    main()
