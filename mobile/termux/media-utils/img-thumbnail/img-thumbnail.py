#!/usr/bin/env python3
"""img-thumbnail — make a 200x200 thumbnail."""
import sys, os
try:
    from PIL import Image
except ImportError:
    print("img-thumbnail: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) < 2:
        print("Usage: img-thumbnail <img> [size]", file=sys.stderr); sys.exit(1)
    size = int(sys.argv[2]) if len(sys.argv) > 2 else 200
    for src in sys.argv[1:]:
        if src.startswith("-"): continue
        img = Image.open(src)
        img.thumbnail((size, size))
        base, ext = os.path.splitext(src)
        dst = f"{base}_thumb{ext}"
        img.save(dst)
        print(f"thumb: {src} -> {dst}")

if __name__ == "__main__":
    main()
