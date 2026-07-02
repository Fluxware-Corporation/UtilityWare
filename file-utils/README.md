# 📁 File Utilities

> Manipulate files in bulk: rename, encrypt, dedupe, organize, convert.

---

## Tools in this category

- [`batch-rename`](./batch-rename/) — Batch rename files using a sed-style pattern
- [`file-crypt`](./file-crypt/) — AES-256 encrypt/decrypt a file with a passphrase
- [`dupes`](./dupes/) — Find duplicate files by content hash
- [`organize`](./organize/) — Sort files in a directory into subfolders by extension
- [`img-resize`](./img-resize/) — Resize an image (uses Pillow)
- [`pdf-merge`](./pdf-merge/) — Merge multiple PDFs into one (uses pypdf)
- [`find-big`](./find-big/) — Find the N largest files under a path
- [`find-empty`](./find-empty/) — Find empty files or directories under a path
- [`touch-stamp`](./touch-stamp/) — Touch files with a custom timestamp
- [`file-type`](./file-type/) — Identify file type using magic bytes
- [`tree-lite`](./tree-lite/) — Print a tree view of a directory (no deps)
- [`zero-pad`](./zero-pad/) — Zero-pad numeric parts in filenames (e.g. file1 -> file001)
- [`split-csv`](./split-csv/) — Split a large CSV into chunks of N rows each

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./file-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
