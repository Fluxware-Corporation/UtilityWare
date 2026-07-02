#!/usr/bin/env python3
"""token-est — rough token count estimate."""
import sys

def main():
    if len(sys.argv) > 1 and sys.argv[1] != "-":
        text = open(sys.argv[1]).read()
    else:
        text = sys.stdin.read()
    chars = len(text)
    words = len(text.split())
    print(f"chars:    {chars}")
    print(f"words:    {words}")
    print(f"tokens:   ~{chars // 4} (rule of thumb)")
    print(f"tokens:   ~{words * 1.3:.0f} (alt estimate)")

if __name__ == "__main__":
    main()
