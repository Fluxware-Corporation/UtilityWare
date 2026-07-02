#!/usr/bin/env python3
"""py-imports — list third-party imports."""
import sys, ast

STDLIB = {"os","sys","json","re","math","time","datetime","collections",
          "itertools","functools","pathlib","subprocess","shutil","argparse",
          "logging","typing","io","random","hashlib","base64","urllib",
          "http","socket","threading","asyncio","csv","xml","html","email",
          "textwrap","string","copy","enum","dataclasses","contextlib",
          "unittest","traceback","inspect","operator","secrets","statistics",
          "colorsys","zlib","struct","hmac","sqlite3","configparser","glob"}

def main():
    if len(sys.argv) < 2:
        print("Usage: py-imports <file.py>", file=sys.stderr); sys.exit(1)
    tree = ast.parse(open(sys.argv[1]).read())
    found = set()
    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            for n in node.names:
                top = n.name.split(".")[0]
                if top not in STDLIB:
                    found.add(top)
        elif isinstance(node, ast.ImportFrom):
            if node.module:
                top = node.module.split(".")[0]
                if top not in STDLIB:
                    found.add(top)
    for m in sorted(found):
        print(m)

if __name__ == "__main__":
    main()
