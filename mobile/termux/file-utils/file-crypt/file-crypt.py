#!/usr/bin/env python3
"""file-crypt — AES-256 file encryption using openssl."""
import sys, subprocess, os

def usage():
    print("Usage:\n  file-crypt enc <infile> <outfile>\n  file-crypt dec <infile> <outfile>", file=sys.stderr)
    sys.exit(1)

def main():
    if len(sys.argv) != 4: usage()
    mode, src, dst = sys.argv[1], sys.argv[2], sys.argv[3]
    cmd = ["openssl", "enc" if mode == "enc" else "dec",
           "-aes-256-cbc", "-salt", "-pbkdf2", "-in", src, "-out", dst]
    print("Running:", " ".join(cmd))
    subprocess.run(cmd, check=True)
    print(f"{mode}: wrote {dst}")

if __name__ == "__main__":
    main()
