# 💻 CLI Tools

> Python-based command-line tools with rich behavior — argument parsing, color output, interactive prompts.

---

## Tools in this category

- [`calc`](./calc/) — Inline calculator with math expression evaluation
- [`todo`](./todo/) — Tiny todo list stored in ~/.todo.json
- [`passgen`](./passgen/) — Generate strong random passwords
- [`hash`](./hash/) — Compute hashes (md5, sha1, sha256, sha512) for files or stdin
- [`stopwatch`](./stopwatch/) — Terminal stopwatch with start/stop/lap
- [`timer`](./timer/) — Countdown timer that beeps when done
- [`notes`](./notes/) — Quick notes appended to ~/.notes.md with timestamps
- [`uuidgen`](./uuidgen/) — Generate one or more UUIDs (v4)
- [`lorem`](./lorem/) — Generate lorem ipsum paragraphs
- [`slugify`](./slugify/) — Convert any text into a URL/file-safe slug
- [`palette`](./palette/) — Generate a harmonious color palette from a base hex color
- [`freq`](./freq/) — Word frequency analysis on stdin or file
- [`tiny-server`](./tiny-server/) — Single-file HTTP server with routing (no deps)
- [`pick`](./pick/) — Interactive picker — choose one line from stdin
- [`qr-text`](./qr-text/) — Generate a textual QR-like grid (placeholder pattern)
- [`spinner`](./spinner/) — Animated spinner while a long command runs
- [`search-highlight`](./search-highlight/) — Grep with ANSI highlight (like grep --color but standalone)
- [`ascii-table`](./ascii-table/) — Render a Markdown table from CSV
- [`filter-unique`](./filter-unique/) — Filter unique lines preserving order
- [`head-tail`](./head-tail/) — Show first N and last N lines of a file with '...' between

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./cli-tools/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
