#!/usr/bin/env python3
"""palette — generate a 5-color palette from a base color."""
import sys, colorsys

def parse_hex(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4))

def to_hex(rgb):
    return "#" + "".join(f"{int(c*255):02x}" for c in rgb)

def main():
    if len(sys.argv) < 2:
        print("Usage: palette <#hex>", file=sys.stderr); sys.exit(1)
    r, g, b = parse_hex(sys.argv[1])
    h, l, s = colorsys.rgb_to_hls(r, g, b)
    variants = [
        ("darkest",  (h, max(0.05, l-0.30), s)),
        ("dark",     (h, max(0.10, l-0.15), s)),
        ("base",     (h, l, s)),
        ("light",    (h, min(0.90, l+0.15), s)),
        ("lightest", (h, min(0.95, l+0.30), s)),
    ]
    for name, (hh, ll, ss) in variants:
        print(f"{name:8s} {to_hex(colorsys.hls_to_rgb(hh, ll, ss))}")

if __name__ == "__main__":
    main()
