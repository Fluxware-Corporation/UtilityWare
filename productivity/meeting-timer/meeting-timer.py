#!/usr/bin/env python3
"""meeting-timer — meeting countdown."""
import sys, time

def main():
    if len(sys.argv) < 2:
        print("Usage: meeting-timer <minutes>", file=sys.stderr); sys.exit(1)
    total = int(sys.argv[1]) * 60
    for remaining in range(total, 0, -1):
        pct = (total - remaining) * 100 // total
        bar = "█" * (pct // 5) + "░" * (20 - pct // 5)
        m, s = divmod(remaining, 60)
        sys.stdout.write(f"\r{bar} {m:02d}:{s:02d} ({pct}%)")
        sys.stdout.flush()
        time.sleep(1)
    print("\n\a⏰ meeting time's up!")

if __name__ == "__main__":
    main()
