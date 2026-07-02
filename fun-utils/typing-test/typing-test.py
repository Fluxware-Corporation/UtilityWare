#!/usr/bin/env python3
"""typing-test — typing speed test."""
import time, sys, random

WORDS = ["the","quick","brown","fox","jumps","over","lazy","dog","hello","world",
         "code","data","type","speed","test","terminal","shell","script","python","bash"]

def main():
    sample = " ".join(random.sample(WORDS, 10))
    print(f"Type this:\n  {sample}\n")
    input("Press Enter when ready...")
    start = time.monotonic()
    typed = input("> ")
    elapsed = time.monotonic() - start
    correct = sum(1 for a, b in zip(sample.split(), typed.split()) if a == b)
    wpm = (len(typed.split()) / elapsed) * 60 if elapsed > 0 else 0
    print(f"\nTime: {elapsed:.1f}s  Correct: {correct}/10  Speed: {wpm:.0f} WPM")

if __name__ == "__main__":
    main()
