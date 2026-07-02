#!/usr/bin/env python3
"""json-keys — list top-level keys of a JSON object."""
import sys, json

def main():
    src = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
    data = json.load(src)
    if isinstance(data, dict):
        for k in data.keys():
            print(k)
    else:
        print(f"json-keys: not an object (got {type(data).__name__})", file=sys.stderr); sys.exit(1)

if __name__ == "__main__":
    main()
