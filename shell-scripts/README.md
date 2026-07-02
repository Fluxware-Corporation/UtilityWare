# 🐚 Shell Scripts

> Pure POSIX/bash shell scripts for everyday terminal tasks. Zero dependencies, maximum portability.

---

## Tools in this category

- [`extract`](./extract/) — Universal archive extractor (tar, zip, rar, 7z, gz, bz2, xz)
- [`mkcd`](./mkcd/) — mkdir + cd combined into one command
- [`weather`](./weather/) — Pretty-print weather from wttr.in
- [`qr`](./qr/) — Generate a QR code in the terminal for any text
- [`colors`](./colors/) — Print a 256-color palette and ANSI demo
- [`battery`](./battery/) — Print battery status (Linux/macOS)
- [`wifi-password`](./wifi-password/) — Print the current Wi-Fi network password
- [`speedtest`](./speedtest/) — Run a quick download speed test against a public server
- [`ports`](./ports/) — List all listening TCP/UDP ports with owning process
- [`ips`](./ips/) — Print all IP addresses (local + public)
- [`bk`](./bk/) — Timestamped backup of a file or directory
- [`toupper`](./toupper/) — Convert stdin or arguments to UPPERCASE
- [`tolower`](./tolower/) — Convert stdin or arguments to lowercase
- [`trim`](./trim/) — Strip leading/trailing whitespace from stdin or arg
- [`ruler`](./ruler/) — Print a numbered ruler line for column reference
- [`iso-date`](./iso-date/) — Print current date/time in ISO 8601 (UTC and local)
- [`epoch`](./epoch/) — Convert between Unix epoch seconds and human dates
- [`countdown`](./countdown/) — Days/hours until a target date
- [`repeat`](./repeat/) — Repeat a command N times
- [`watch-cmd`](./watch-cmd/) — Run a command every N seconds, clearing screen first
- [`header`](./header/) — Print a banner header around a label
- [`line-count`](./line-count/) — Count lines in files matching a pattern (recursive)
- [`pubkey`](./pubkey/) — Print your SSH public key (~/.ssh/id_*.pub)
- [`serve-py`](./serve-py/) — Tiny alias for python3 -m http.server with port arg
- [`iso8601`](./iso8601/) — Print a stream of ISO 8601 timestamps, one per second

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./shell-scripts/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
