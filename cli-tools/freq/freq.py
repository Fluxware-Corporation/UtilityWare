#!/usr/bin/env python3
"""freq — word frequency analysis."""
import sys, re, collections

def main():
    if len(sys.argv) > 1 and sys.argv[1] != "-":
        text = open(sys.argv[1]).read()
    else:
        text = sys.stdin.read()
    words = re.findall(r"\b\w+\b", text.lower())
    top = collections.Counter(words).most_common(20)
    for w, c in top:
        print(f"{c:5d}  {w}")

if __name__ == "__main__":
    main()
