# watch-cmd

> Run a command every N seconds, clearing screen first

**Category:** `shell-scripts`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `loop` `monitor`

---

## Description

Run a command every N seconds, clearing screen first

This tool lives under the `shell-scripts/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

POSIX shell / Python 3.6+

## Usage

```bash
watch-cmd [interval] <command...>
```

## Examples

```bash
watch-cmd 5 date
```
```bash
watch-cmd ls
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `shell-scripts/` category by opening the category README at [`shell-scripts/README.md`](../shell-scripts/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
