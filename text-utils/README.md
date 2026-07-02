# 📝 Text Utilities

> Process, count, transform, and encode text. Great for piping between other tools.

---

## Tools in this category

- [`wc2`](./wc2/) — Extended word count: chars, words, lines, sentences
- [`textstat`](./textstat/) — Readability stats (Flesch reading ease)
- [`rot13`](./rot13/) — ROT13 cipher on stdin or argument
- [`morse`](./morse/) — Translate text to/from Morse code
- [`columnate`](./columnate/) — Pretty-print CSV/TSV as aligned columns
- [`word-wrap`](./word-wrap/) — Wrap text to a max line width
- [`reverse`](./reverse/) — Reverse lines, words, or characters
- [`dedent`](./dedent/) — Strip common leading whitespace from each line
- [`ascii-art`](./ascii-art/) — Convert text to tiny ASCII art (1-row font)
- [`strip-ansi`](./strip-ansi/) — Remove ANSI escape sequences from input
- [`center`](./center/) — Center text in a given width
- [`number-lines`](./number-lines/) — Add line numbers to input (cat -n style)

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./text-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
