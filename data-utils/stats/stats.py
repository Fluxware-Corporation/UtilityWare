#!/usr/bin/env python3
"""stats — descriptive stats on a numeric column."""
import sys, statistics

def main():
    src = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
    nums = []
    for line in src:
        line = line.strip()
        try:
            nums.append(float(line))
        except ValueError:
            pass
    if not nums:
        print("stats: no numbers found", file=sys.stderr); sys.exit(1)
    print(f"count:  {len(nums)}")
    print(f"sum:    {sum(nums)}")
    print(f"min:    {min(nums)}")
    print(f"max:    {max(nums)}")
    print(f"mean:   {statistics.mean(nums):.4f}")
    print(f"median: {statistics.median(nums)}")
    try:
        print(f"stdev:  {statistics.stdev(nums):.4f}")
    except statistics.StatisticsError:
        print("stdev:  (need >= 2 values)")

if __name__ == "__main__":
    main()
