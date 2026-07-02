#!/usr/bin/env python3
"""shredder — securely delete a file."""
import os, sys, random

def main():
    if len(sys.argv) < 2:
        print("Usage: shredder <file> [file...]", file=sys.stderr); sys.exit(1)
    for path in sys.argv[1:]:
        if not os.path.isfile(path):
            print(f"shredder: {path} not found", file=sys.stderr); continue
        size = os.path.getsize(path)
        with open(path, "ba+", buffering=0) as f:
            for _ in range(3):
                f.seek(0)
                f.write(os.urandom(size))
                f.flush()
                os.fsync(f.fileno())
        os.unlink(path)
        print(f"shredded: {path} ({size} bytes)")

if __name__ == "__main__":
    main()
