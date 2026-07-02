#!/usr/bin/env python3
"""cowsay — ASCII cow says your text."""
import sys

def main():
    if len(sys.argv) < 2:
        print("Usage: cowsay <text>", file=sys.stderr); sys.exit(1)
    text = " ".join(sys.argv[1:])
    line = "-" * (len(text) + 2)
    print(" " + line)
    print(f"< {text} >")
    print(" " + line)
    print(r"""
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
""")

if __name__ == "__main__":
    main()
