#!/usr/bin/env python3
"""stopwatch — terminal stopwatch."""
import time, sys

def main():
    print("Stopwatch. Ctrl+C to stop.")
    start = time.monotonic()
    try:
        while True:
            elapsed = time.monotonic() - start
            m, s = divmod(int(elapsed), 60)
            h, m = divmod(m, 60)
            sys.stdout.write(f"\r{h:02d}:{m:02d}:{s:02d}")
            sys.stdout.flush()
            time.sleep(0.25)
    except KeyboardInterrupt:
        print("\nstopped.")

if __name__ == "__main__":
    main()
