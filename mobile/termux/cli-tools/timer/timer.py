#!/usr/bin/env python3
"""timer — countdown timer."""
import time, sys, argparse

def main():
    p = argparse.ArgumentParser(description="Countdown timer.")
    p.add_argument("duration", help="e.g. 25s, 5m, 1h30m")
    args = p.parse_args()
    s = 0
    t = args.duration.lower()
    import re
    for num, unit in re.findall(r"(\d+)([smh])", t):
        s += int(num) * {"s":1,"m":60,"h":3600}[unit]
    if s == 0:
        print("timer: bad duration", file=sys.stderr); sys.exit(1)
    for remaining in range(s, 0, -1):
        m, sec = divmod(remaining, 60)
        h, m = divmod(m, 60)
        sys.stdout.write(f"\r{h:02d}:{m:02d}:{sec:02d}")
        sys.stdout.flush()
        time.sleep(1)
    print("\n\a⏰ time's up!")

if __name__ == "__main__":
    main()
