#!/usr/bin/env python3
"""passgen — secure password generator."""
import secrets, string, argparse, sys

def gen(length=20, sets="luds"):
    pool = ""
    if "l" in sets: pool += string.ascii_lowercase
    if "u" in sets: pool += string.ascii_uppercase
    if "d" in sets: pool += string.digits
    if "s" in sets: pool += "!@#$%^&*()-_=+[]{}<>?"
    if not pool: pool = string.ascii_letters + string.digits
    return "".join(secrets.choice(pool) for _ in range(length))

def main():
    p = argparse.ArgumentParser(description="Generate a secure random password.")
    p.add_argument("length", nargs="?", type=int, default=20)
    p.add_argument("-n", "--count", type=int, default=1)
    p.add_argument("-s", "--sets", default="luds", help="l=lower u=upper d=digits s=symbols")
    args = p.parse_args()
    for _ in range(args.count):
        print(gen(args.length, args.sets))

if __name__ == "__main__":
    main()
