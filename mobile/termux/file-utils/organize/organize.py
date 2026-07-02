#!/usr/bin/env python3
"""organize — sort files into subfolders by extension."""
import os, sys, shutil

def main():
    if len(sys.argv) < 2:
        print("Usage: organize <dir>", file=sys.stderr); sys.exit(1)
    d = sys.argv[1]
    moved = 0
    for f in os.listdir(d):
        src = os.path.join(d, f)
        if not os.path.isfile(src): continue
        ext = os.path.splitext(f)[1].lstrip(".").lower() or "noext"
        sub = os.path.join(d, ext)
        os.makedirs(sub, exist_ok=True)
        shutil.move(src, os.path.join(sub, f))
        moved += 1
    print(f"organized: {moved} files moved into extension subfolders.")

if __name__ == "__main__":
    main()
