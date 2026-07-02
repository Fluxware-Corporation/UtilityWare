#!/usr/bin/env python3
"""img2ascii — image to ASCII."""
import sys
try:
    from PIL import Image
except ImportError:
    print("img2ascii: install Pillow (pip install pillow)", file=sys.stderr); sys.exit(2)

RAMP = "@%#*+=-:. "

def main():
    if len(sys.argv) < 2:
        print("Usage: img2ascii <image> [width]", file=sys.stderr); sys.exit(1)
    path = sys.argv[1]
    width = int(sys.argv[2]) if len(sys.argv) > 2 else 80
    img = Image.open(path).convert("L")
    w, h = img.size
    aspect = h / w * 0.5
    new_h = max(1, int(width * aspect))
    img = img.resize((width, new_h))
    px = img.load()
    for y in range(new_h):
        line = "".join(RAMP[min(len(RAMP)-1, px[x,y] * len(RAMP) // 256)]
                       for x in range(width))
        print(line)

if __name__ == "__main__":
    main()
