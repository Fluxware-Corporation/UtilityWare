#!/usr/bin/env python3
"""morse — text <-> morse."""
import sys
MORSE = {
    "A":".-","B":"-...","C":"-.-.","D":"-..","E":".","F":"..-.","G":"--.","H":"....",
    "I":"..","J":".---","K":"-.-","L":".-..","M":"--","N":"-.","O":"---","P":".--.",
    "Q":"--.-","R":".-.","S":"...","T":"-","U":"..-","V":"...-","W":".--","X":"-..-",
    "Y":"-.--","Z":"--..","0":"-----","1":".----","2":"..---","3":"...--","4":"....-",
    "5":".....","6":"-....","7":"--...","8":"---..","9":"----."," ":"/"
}
REV = {v:k for k,v in MORSE.items()}

def main():
    if len(sys.argv) < 2:
        print("Usage: morse <text>", file=sys.stderr); sys.exit(1)
    s = " ".join(sys.argv[1:])
    if all(c in ".-/ " for c in s):
        print("".join(REV.get(tok, "?") for tok in s.split()))
    else:
        print(" ".join(MORSE.get(c.upper(), "?") for c in s))

if __name__ == "__main__":
    main()
