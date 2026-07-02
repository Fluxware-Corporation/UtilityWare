#!/usr/bin/env python3
"""jsonfmt — pretty/minify JSON."""
import json, sys, argparse

def main():
    p = argparse.ArgumentParser(description="JSON formatter.")
    p.add_argument("file", nargs="?", default="-")
    p.add_argument("-m", "--minify", action="store_true")
    args = p.parse_args()
    src = sys.stdin if args.file == "-" else open(args.file)
    data = json.load(src)
    if args.minify:
        print(json.dumps(data, separators=(",", ":")))
    else:
        print(json.dumps(data, indent=2, ensure_ascii=False))

if __name__ == "__main__":
    main()
