# 🔒 Security Utilities

> Encryption, hashing, password strength, and audit helpers. Use responsibly.

---

## Tools in this category

- [`pw-strength`](./pw-strength/) — Estimate password strength (entropy bits)
- [`shredder`](./shredder/) — Securely overwrite a file with random bytes before delete
- [`audit-perms`](./audit-perms/) — Find world-writable files in a directory tree
- [`rand-hex`](./rand-hex/) — Generate N bytes of random hex
- [`totp-gen`](./totp-gen/) — Generate a TOTP code from a base32 secret
- [`hexdump`](./hexdump/) — Print a hex+ASCII dump of a file (like xxd)

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./security-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
