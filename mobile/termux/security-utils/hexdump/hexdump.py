#!/usr/bin/env python3
"""hexdump — hex+ascii dump."""
import sys

def main():
    if len(sys.argv) > 1 and sys.argv[1] != "-":
        data = open(sys.argv[1], "rb").read()
    else:
        data = sys.stdin.buffer.read()
    for i in range(0, len(data), 16):
        chunk = data[i:i+16]
        hex_part = " ".join(f"{b:02x}" for b in chunk)
        hex_part = hex_part[:23] + " " + hex_part[23:]  # split bytes 7/8
        ascii_part = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        print(f"{i:08x}  {hex_part:<48}  |{ascii_part}|")

if __name__ == "__main__":
    main()
