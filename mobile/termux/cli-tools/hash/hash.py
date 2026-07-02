#!/usr/bin/env python3
"""hash — compute file/message digests."""
import hashlib, sys, argparse

def main():
    p = argparse.ArgumentParser(description="Compute hashes.")
    p.add_argument("algo", choices=["md5","sha1","sha256","sha512"])
    p.add_argument("file", nargs="?", default="-")
    args = p.parse_args()
    h = hashlib.new(args.algo)
    if args.file == "-":
        data = sys.stdin.buffer.read()
        h.update(data)
    else:
        with open(args.file, "rb") as f:
            for chunk in iter(lambda: f.read(65536), b""):
                h.update(chunk)
    print(f"{h.hexdigest()}  {args.file}")

if __name__ == "__main__":
    main()
