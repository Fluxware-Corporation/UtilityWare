#!/usr/bin/env python3
"""jwt — decode JWT (no signature verification)."""
import sys, json, base64

def b64url_dec(s):
    s += "=" * (-len(s) % 4)
    return base64.urlsafe_b64decode(s)

def main():
    if len(sys.argv) < 2:
        print("Usage: jwt <token>", file=sys.stderr); sys.exit(1)
    tok = sys.argv[1]
    parts = tok.split(".")
    if len(parts) < 2:
        print("jwt: not a valid JWT", file=sys.stderr); sys.exit(2)
    header = json.loads(b64url_dec(parts[0]))
    payload = json.loads(b64url_dec(parts[1]))
    print("=== Header ===")
    print(json.dumps(header, indent=2))
    print("\n=== Payload ===")
    print(json.dumps(payload, indent=2))

if __name__ == "__main__":
    main()
