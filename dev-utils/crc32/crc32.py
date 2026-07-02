#!/usr/bin/env python3
"""crc32 — compute CRC32."""
import sys, zlib

def main():
    if len(sys.argv) > 1 and sys.argv[1] != "-":
        data = open(sys.argv[1], "rb").read()
    else:
        data = sys.stdin.buffer.read()
    print(f"{zlib.crc32(data) & 0xffffffff:08x}")

if __name__ == "__main__":
    main()
