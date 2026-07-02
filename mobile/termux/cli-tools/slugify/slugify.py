#!/usr/bin/env python3
"""slugify — text to slug."""
import sys, re, unicodedata

def slugify(text, sep="-"):
    text = unicodedata.normalize("NFKD", text).encode("ascii","ignore").decode()
    text = text.lower().strip()
    text = re.sub(r"[^\w\s-]", "", text)
    text = re.sub(r"[\s_-]+", sep, text)
    return text.strip(sep)

def main():
    if len(sys.argv) < 2:
        for line in sys.stdin:
            print(slugify(line.strip()))
    else:
        print(slugify(" ".join(sys.argv[1:])))

if __name__ == "__main__":
    main()
