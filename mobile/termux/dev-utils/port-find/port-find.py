#!/usr/bin/env python3
"""port-find — find a free TCP port."""
import sys, socket

def main():
    lo = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
    hi = int(sys.argv[2]) if len(sys.argv) > 2 else 9000
    for p in range(lo, hi+1):
        try:
            s = socket.socket()
            s.bind(("127.0.0.1", p))
            s.close()
            print(p); return
        except OSError:
            continue
    print("port-find: no free port", file=sys.stderr); sys.exit(2)

if __name__ == "__main__":
    main()
