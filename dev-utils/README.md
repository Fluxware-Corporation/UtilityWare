# 🛠️ Developer Utilities

> Helpers that make development faster: JSON formatting, JWT decoding, UUID generation, local servers.

---

## Tools in this category

- [`serve`](./serve/) — Start a simple HTTP server in the current dir with CORS
- [`jsonfmt`](./jsonfmt/) — Pretty-print or minify JSON (from file or stdin)
- [`b64`](./b64/) — Base64 encode/decode a string or file
- [`jwt`](./jwt/) — Decode a JWT and print its header/payload as JSON
- [`tmux-init`](./tmux-init/) — Bootstrap a tmux session with sensible defaults
- [`http-status`](./http-status/) — Print the meaning of an HTTP status code
- [`crc32`](./crc32/) — Compute CRC32 of a file or stdin
- [`escape-html`](./escape-html/) — Escape < > & for HTML
- [`escape-url`](./escape-url/) — URL-encode a string (alias for urlcodec enc)
- [`timestamp`](./timestamp/) — Print current Unix timestamp (seconds and ms)
- [`fake-data`](./fake-data/) — Generate fake data: names, emails, IPs (no deps)
- [`port-find`](./port-find/) — Find a free TCP port between min and max

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./dev-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
