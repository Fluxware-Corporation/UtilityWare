#!/usr/bin/env python3
"""json-get — dotted-path JSON lookup."""
import sys, json

def main():
    if len(sys.argv) < 2:
        print("Usage: json-get <a.b.c> [file]", file=sys.stderr); sys.exit(1)
    path = sys.argv[1].split(".")
    src = open(sys.argv[2]) if len(sys.argv) > 2 else sys.stdin
    data = json.load(src)
    for p in path:
        if isinstance(data, list):
            try:
                data = data[int(p)]
            except (ValueError, IndexError):
                print(f"json-get: bad index {p}", file=sys.stderr); sys.exit(1)
        elif isinstance(data, dict):
            if p not in data:
                print(f"json-get: key '{p}' not found", file=sys.stderr); sys.exit(1)
            data = data[p]
        else:
            print(f"json-get: cannot descend into {type(data).__name__}", file=sys.stderr); sys.exit(1)
    print(data if isinstance(data, str) else json.dumps(data, indent=2, ensure_ascii=False))

if __name__ == "__main__":
    main()
