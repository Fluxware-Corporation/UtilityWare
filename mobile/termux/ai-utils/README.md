# 🤖 AI Utilities

> Tiny prompt helpers and stubs for working with LLM CLIs and prompt files.

---

## Tools in this category

- [`prompt-file`](./prompt-file/) — Read a prompt from a .prompt file and print to stdout
- [`prompt-list`](./prompt-list/) — List all .prompt files under a directory
- [`token-est`](./token-est/) — Rough token estimate for a text file (~4 chars per token)
- [`prompt-template`](./prompt-template/) — Render a prompt template by substituting {{vars}}

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./ai-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
