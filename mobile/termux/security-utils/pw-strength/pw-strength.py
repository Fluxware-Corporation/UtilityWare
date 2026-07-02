#!/usr/bin/env python3
"""pw-strength — password strength estimator."""
import sys, math, string

def pool_size(pw):
    p = 0
    if any(c in string.ascii_lowercase for c in pw): p += 26
    if any(c in string.ascii_uppercase for c in pw): p += 26
    if any(c in string.digits for c in pw): p += 10
    if any(c in "!@#$%^&*()-_=+[]{}<>?" for c in pw): p += 20
    if any(c not in string.ascii_letters + string.digits + "!@#$%^&*()-_=+[]{}<>?" for c in pw): p += 32
    return p

def main():
    if len(sys.argv) < 2:
        print("Usage: pw-strength '<password>'", file=sys.stderr); sys.exit(1)
    pw = sys.argv[1]
    pool = pool_size(pw)
    entropy = len(pw) * math.log2(pool) if pool else 0
    verdict = ("very weak" if entropy < 40 else
               "weak" if entropy < 60 else
               "fair" if entropy < 80 else
               "strong" if entropy < 100 else
               "very strong")
    print(f"length:        {len(pw)}")
    print(f"pool size:     {pool}")
    print(f"entropy (bits): {entropy:.1f}")
    print(f"verdict:       {verdict}")

if __name__ == "__main__":
    main()
