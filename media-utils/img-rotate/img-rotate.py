#!/usr/bin/env python3
"""img-rotate — rotate an image."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img-rotate: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) != 4:
        print("Usage: img-rotate <in> <degrees> <out>", file=sys.stderr); sys.exit(1)
    src, deg, dst = sys.argv[1], float(sys.argv[2]), sys.argv[3]
    img = Image.open(src).rotate(-deg, expand=True)
    img.save(dst)
    print(f"rotated {deg}°, saved {dst}")

if __name__ == "__main__":
    main()
