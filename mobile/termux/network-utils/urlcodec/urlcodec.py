#!/usr/bin/env python3
"""urlcodec — URL encode/decode."""
import sys, urllib.parse

def main():
    if len(sys.argv) < 3 or sys.argv[1] not in ("enc", "dec"):
        print("Usage: urlcodec <enc|dec> <string>", file=sys.stderr); sys.exit(1)
    mode, s = sys.argv[1], " ".join(sys.argv[2:])
    print(urllib.parse.quote(s, safe="") if mode == "enc" else urllib.parse.unquote(s))

if __name__ == "__main__":
    main()
