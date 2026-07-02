# stats

> Compute mean/median/min/max/stddev on a column of numbers

**Category:** `data-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `data` `stats`

---

## Description

Compute mean/median/min/max/stddev on a column of numbers

This tool lives under the `data-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+

## Usage

```bash
stats [file]
```

## Examples

```bash
stats nums.txt
```
```bash
echo -e '1\n2\n3\n4\n5' | stats
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `data-utils/` category by opening the category README at [`data-utils/README.md`](../data-utils/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
