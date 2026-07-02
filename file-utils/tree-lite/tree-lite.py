#!/usr/bin/env python3
"""tree-lite — print a directory tree."""
import os, sys

def tree(path, prefix="", max_depth=3, depth=0):
    if depth > max_depth: return
    try:
        entries = sorted(os.listdir(path))
    except OSError:
        return
    for i, e in enumerate(entries):
        full = os.path.join(path, e)
        last = (i == len(entries) - 1)
        print(f"{prefix}{'└── ' if last else '├── '}{e}")
        if os.path.isdir(full) and not e.startswith("."):
            tree(full, prefix + ("    " if last else "│   "), max_depth, depth+1)

def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "."
    print(path)
    tree(path)

if __name__ == "__main__":
    main()
