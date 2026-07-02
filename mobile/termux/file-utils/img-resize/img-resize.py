#!/usr/bin/env python3
"""img-resize — resize an image."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img-resize: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) != 4:
        print("Usage: img-resize <in> <max-w>x<max-h> <out>", file=sys.stderr); sys.exit(1)
    src, size, dst = sys.argv[1], sys.argv[2], sys.argv[3]
    w, h = (int(x) for x in size.lower().split("x"))
    img = Image.open(src)
    img.thumbnail((w, h))
    img.save(dst)
    print(f"resized to {img.size}, saved {dst}")

if __name__ == "__main__":
    main()
