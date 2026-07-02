# 🐍 Python Utilities

> Python-specific helpers: venv management, pip audit, requirements freeze.

---

## Tools in this category

- [`py-venv`](./py-venv/) — Create and activate a Python venv in ./.venv
- [`py-freeze`](./py-freeze/) — Freeze requirements, sorted and deduplicated
- [`py-pins`](./py-pins/) — List all pinned versions in requirements.txt
- [`py-imports`](./py-imports/) — List all third-party imports in a Python file
- [`py-repl-init`](./py-repl-init/) — Start a Python REPL with common imports preloaded

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./python-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
