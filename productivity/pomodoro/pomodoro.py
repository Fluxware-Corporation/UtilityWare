#!/usr/bin/env python3
"""pomodoro — pomodoro timer."""
import time, sys

def run(label, minutes):
    print(f"\n🍅 {label} ({minutes}m) — start!")
    for remaining in range(minutes * 60, 0, -1):
        m, s = divmod(remaining, 60)
        sys.stdout.write(f"\r  {m:02d}:{s:02d}")
        sys.stdout.flush()
        time.sleep(1)
    print(f"\n\a⏰ {label} done!")

def main():
    for i in range(1, 5):
        run(f"Pomodoro #{i}", 25)
        if i < 4: run("Short break", 5)
    run("Long break", 15)

if __name__ == "__main__":
    main()
