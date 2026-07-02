#!/usr/bin/env python3
"""img-crop — crop an image."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img-crop: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) != 4:
        print("Usage: img-crop <in> <WxH+X+Y> <out>", file=sys.stderr); sys.exit(1)
    src, geom, dst = sys.argv[1], sys.argv[2], sys.argv[3]
    import re
    m = re.match(r"(\d+)x(\d+)\+(\d+)\+(\d+)", geom)
    if not m:
        print("img-crop: bad geometry (use WxH+X+Y)", file=sys.stderr); sys.exit(1)
    w, h, x, y = map(int, m.groups())
    img = Image.open(src).crop((x, y, x+w, y+h))
    img.save(dst)
    print(f"cropped to {w}x{h}, saved {dst}")

if __name__ == "__main__":
    main()
