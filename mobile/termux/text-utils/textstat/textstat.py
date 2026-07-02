#!/usr/bin/env python3
"""textstat — readability statistics."""
import sys, re

def main():
    text = sys.stdin.read() if len(sys.argv) < 2 else open(sys.argv[1]).read()
    words = re.findall(r"\b\w+\b", text)
    sentences = re.findall(r"[.!?]+", text)
    syllables = sum(max(1, len(re.findall(r"[aeiouy]+", w.lower()))) for w in words)
    nw, ns, nsy = len(words), max(len(sentences),1), syllables
    if nw == 0:
        print("no text"); return
    flesch = 206.835 - 1.015 * (nw / ns) - 84.6 * (nsy / nw)
    print(f"words: {nw}, sentences: {ns}, syllables: {nsy}")
    print(f"flesch reading ease: {flesch:.1f}")
    if flesch >= 90: desc = "very easy"
    elif flesch >= 60: desc = "standard"
    elif flesch >= 30: desc = "difficult"
    else: desc = "very difficult"
    print(f"reading level: {desc}")

if __name__ == "__main__":
    main()
