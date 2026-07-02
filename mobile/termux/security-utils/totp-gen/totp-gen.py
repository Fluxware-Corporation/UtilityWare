#!/usr/bin/env python3
"""totp-gen — TOTP code from base32 secret."""
import sys, hmac, hashlib, base64, struct, time

def main():
    if len(sys.argv) < 2:
        print("Usage: totp-gen <base32-secret>", file=sys.stderr); sys.exit(1)
    secret = sys.argv[1].replace(" ", "").upper()
    key = base64.b32decode(secret + "=" * (-len(secret) % 8))
    counter = int(time.time() // 30)
    msg = struct.pack(">Q", counter)
    h = hmac.new(key, msg, hashlib.sha1).digest()
    offset = h[-1] & 0x0F
    code = (struct.unpack(">I", h[offset:offset+4])[0] & 0x7FFFFFFF) % 1000000
    print(f"{code:06d}")

if __name__ == "__main__":
    main()
