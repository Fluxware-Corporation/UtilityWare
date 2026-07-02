#!/usr/bin/env python3
"""notes — quick timestamped notes."""
import sys, os, datetime
PATH = os.path.expanduser("~/.notes.md")

def main():
    args = sys.argv[1:]
    if not args or args[0] == "ls":
        if os.path.exists(PATH):
            print(open(PATH).read())
        else:
            print("(no notes yet)")
        return
    if args[0] == "clear":
        open(PATH, "w").write("")
        print("cleared")
        return
    text = " ".join(args)
    ts = datetime.datetime.now().isoformat(timespec="seconds")
    with open(PATH, "a") as f:
        f.write(f"- `{ts}` {text}\n")
    print(f"saved: {text}")

if __name__ == "__main__":
    main()
