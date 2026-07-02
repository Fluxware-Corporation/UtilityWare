#!/usr/bin/env python3
"""img-grayscale — convert image to grayscale."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img-grayscale: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) != 3:
        print("Usage: img-grayscale <in> <out>", file=sys.stderr); sys.exit(1)
    img = Image.open(sys.argv[1]).convert("L")
    img.save(sys.argv[2])
    print(f"grayscale, saved {sys.argv[2]}")

if __name__ == "__main__":
    main()
