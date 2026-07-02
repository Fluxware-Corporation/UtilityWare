#!/usr/bin/env python3
"""img-meta — print image metadata."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img-meta: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) < 2:
        print("Usage: img-meta <image>", file=sys.stderr); sys.exit(1)
    img = Image.open(sys.argv[1])
    print(f"file:     {sys.argv[1]}")
    print(f"format:   {img.format}")
    print(f"size:     {img.size}")
    print(f"mode:     {img.mode}")
    exif = img.getexif()
    if exif:
        print("exif:")
        for k, v in exif.items():
            print(f"  {k}: {v}")
    else:
        print("exif: (none)")

if __name__ == "__main__":
    main()
