#!/usr/bin/env python3
"""uuidgen — generate UUIDs."""
import uuid as _uuid, argparse

def main():
    p = argparse.ArgumentParser(description="Generate UUIDs.")
    p.add_argument("-n", "--count", type=int, default=1)
    p.add_argument("-u", "--upper", action="store_true")
    args = p.parse_args()
    for _ in range(args.count):
        u = str(_uuid.uuid4())
        print(u.upper() if args.upper else u)

if __name__ == "__main__":
    main()
