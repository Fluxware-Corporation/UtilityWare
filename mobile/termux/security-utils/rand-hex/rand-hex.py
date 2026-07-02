#!/usr/bin/env python3
"""rand-hex — random hex bytes."""
import sys, secrets

def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 32
    print(secrets.token_hex(n))

if __name__ == "__main__":
    main()
