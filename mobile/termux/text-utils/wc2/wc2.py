#!/usr/bin/env python3
"""wc2 — extended word count."""
import sys, re

def main():
    if len(sys.argv) < 2 or sys.argv[1] == "-":
        text = sys.stdin.read()
    else:
        text = open(sys.argv[1]).read()
    chars = len(text)
    chars_ns = len(text.replace(" ","").replace("\n",""))
    words = len(re.findall(r"\b\w+\b", text))
    lines = text.count("\n") + (1 if text and not text.endswith("\n") else 0)
    sentences = len(re.findall(r"[.!?]+", text))
    print(f"chars:        {chars}")
    print(f"chars (ns):   {chars_ns}")
    print(f"words:        {words}")
    print(f"lines:        {lines}")
    print(f"sentences:    {sentences}")
    print(f"avg word len: {chars_ns/max(words,1):.2f}")

if __name__ == "__main__":
    main()
