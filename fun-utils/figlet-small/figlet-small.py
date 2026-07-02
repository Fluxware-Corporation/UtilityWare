#!/usr/bin/env python3
"""figlet-small — small figlet banner."""
import sys

# Compact 3-row font for A-Z 0-9
FONT = {
    'A':'/\\\n/ _ \n/_/\_\','B':'___ \n| _ )\n|___\',
    'C':' ___\n/ __\n\__\','D':'___ \n| _ \\n|___/',
    'E':'___\n| _ \n|___','F':'___\n| _ \n|_  ','H':'| |\n|___\n|_|',
    'I':'_\n||\n_','L':'|  \n|  \n|__','N':'|\\|\n| |\n| |',
    'O':' ___\n| _ |\n|___|','T':'___\n_|_\n | ','U':'| |\n| |\n|___',
    ' ':'   \n   \n   ','1':'_\n|\n|','2':'__\n_|\n__',
}
def main():
    if len(sys.argv) < 2:
        print("Usage: figlet-small <text>", file=sys.stderr); sys.exit(1)
    text = " ".join(sys.argv[1:]).upper()
    rows = ["" for _ in range(3)]
    for c in text:
        glyph = FONT.get(c, " ? \n ? \n ? ").split("\n")
        for i in range(3):
            rows[i] += glyph[i] + " "
    for r in rows:
        print(r)

if __name__ == "__main__":
    main()
