#!/usr/bin/env python3
"""b64 — base64 encode/decode."""
import base64, sys, argparse

def main():
    p = argparse.ArgumentParser(description="Base64 tool.")
    p.add_argument("mode", choices=["enc", "dec"])
    p.add_argument("file", nargs="?", default="-")
    args = p.parse_args()
    src = sys.stdin.buffer if args.file == "-" else open(args.file, "rb")
    data = src.read()
    if args.mode == "enc":
        print(base64.b64encode(data).decode())
    else:
        sys.stdout.buffer.write(base64.b64decode(data))

if __name__ == "__main__":
    main()
