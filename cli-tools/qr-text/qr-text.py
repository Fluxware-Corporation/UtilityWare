#!/usr/bin/env python3
"""qr-text — print a fake QR-style grid from text hash (placeholder, not real QR)."""
import sys, hashlib

def main():
    if len(sys.argv) < 2:
        print("Usage: qr-text <text>", file=sys.stderr); sys.exit(1)
    text = " ".join(sys.argv[1:])
    h = hashlib.sha256(text.encode()).digest()
    size = 21
    grid = [[0]*size for _ in range(size)]
    for y in range(size):
        for x in range(size):
            byte = h[(y*size + x) % len(h)]
            grid[y][x] = (byte >> (x % 8)) & 1
    # Add corner markers
    for cy, cx in [(0,0), (0, size-7), (size-7, 0)]:
        for y in range(7):
            for x in range(7):
                if y in (0, 6) or x in (0, 6) or (2 <= y <= 4 and 2 <= x <= 4):
                    grid[cy+y][cx+x] = 1
                else:
                    grid[cy+y][cx+x] = 0
    for row in grid:
        print("".join("██" if c else "  " for c in row))

if __name__ == "__main__":
    main()
