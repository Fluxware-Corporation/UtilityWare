#!/usr/bin/env python3
"""dice — roll dice."""
import sys, random, re

def main():
    spec = sys.argv[1] if len(sys.argv) > 1 else "1d6"
    m = re.match(r"(\d+)d(\d+)", spec)
    if not m:
        print("dice: bad spec (use NdM, e.g. 3d6)", file=sys.stderr); sys.exit(1)
    n, sides = int(m.group(1)), int(m.group(2))
    rolls = [random.randint(1, sides) for _ in range(n)]
    print(" ".join(str(r) for r in rolls) + f"  (total: {sum(rolls)})")

if __name__ == "__main__":
    main()
