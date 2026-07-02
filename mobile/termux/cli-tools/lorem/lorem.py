#!/usr/bin/env python3
"""lorem — lorem ipsum generator."""
import argparse, random

WORDS = ("lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod "
         "tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam "
         "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo "
         "consequat duis aute irure dolor in reprehenderit in voluptate velit esse "
         "cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat "
         "non proident sunt in culpa qui officia deserunt mollit anim id est laborum").split()

def sentence():
    n = random.randint(8, 18)
    s = " ".join(random.choice(WORDS) for _ in range(n))
    return s[0].upper() + s[1:] + "."

def paragraph():
    return " ".join(sentence() for _ in range(random.randint(3, 6)))

def main():
    p = argparse.ArgumentParser(description="Lorem ipsum generator.")
    p.add_argument("paragraphs", nargs="?", type=int, default=1)
    args = p.parse_args()
    print("\n\n".join(paragraph() for _ in range(args.paragraphs)))

if __name__ == "__main__":
    main()
