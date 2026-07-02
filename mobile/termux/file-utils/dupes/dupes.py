#!/usr/bin/env python3
"""dupes — find duplicate files by SHA-256."""
import os, sys, hashlib, collections

def main():
    if len(sys.argv) < 2:
        print("Usage: dupes <dir> [dir...]", file=sys.stderr); sys.exit(1)
    by_hash = collections.defaultdict(list)
    for root in sys.argv[1:]:
        for dirpath, _, files in os.walk(root):
            for f in files:
                p = os.path.join(dirpath, f)
                try:
                    h = hashlib.sha256()
                    with open(p, "rb") as fh:
                        for chunk in iter(lambda: fh.read(65536), b""):
                            h.update(chunk)
                    by_hash[h.hexdigest()].append(p)
                except OSError:
                    pass
    found = False
    for paths in by_hash.values():
        if len(paths) > 1:
            found = True
            print("\n".join(paths))
            print()
    if not found:
        print("no duplicates found.")

if __name__ == "__main__":
    main()
