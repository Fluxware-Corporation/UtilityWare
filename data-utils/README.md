# 📊 Data Utilities

> Inspect, transform, and summarize CSV/JSON/YAML data without heavy dependencies.

---

## Tools in this category

- [`csv-head`](./csv-head/) — Print first N rows of a CSV with column alignment
- [`csv-filter`](./csv-filter/) — Filter CSV rows where a column matches a value
- [`json-keys`](./json-keys/) — List all keys at the top level of a JSON object
- [`json-get`](./json-get/) — Get a value at a dotted path from a JSON file (e.g. a.b.c)
- [`json-csv`](./json-csv/) — Convert a flat JSON array of objects into CSV
- [`stats`](./stats/) — Compute mean/median/min/max/stddev on a column of numbers

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./data-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
