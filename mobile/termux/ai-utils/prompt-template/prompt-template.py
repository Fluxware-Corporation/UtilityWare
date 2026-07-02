#!/usr/bin/env python3
"""prompt-template — render a {{var}} template."""
import sys, re

def main():
    if len(sys.argv) < 2:
        print("Usage: prompt-template <template> [key=val ...]", file=sys.stderr); sys.exit(1)
    template = open(sys.argv[1]).read() if sys.argv[1] != "-" else sys.stdin.read()
    vars_ = {}
    for arg in sys.argv[2:]:
        if "=" in arg:
            k, v = arg.split("=", 1)
            vars_[k] = v
    def replace(m):
        key = m.group(1).strip()
        return vars_.get(key, m.group(0))
    print(re.sub(r"\{\{(\w+)\}\}", replace, template))

if __name__ == "__main__":
    main()
