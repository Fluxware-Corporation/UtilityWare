# hash

> Compute hashes (md5, sha1, sha256, sha512) for files or stdin

**Category:** `cli-tools`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `security` `hash`

---

## Description

Compute hashes (md5, sha1, sha256, sha512) for files or stdin

This tool lives under the `cli-tools/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+

## Usage

```bash
hash <algo> [file]
```

## Examples

```bash
hash sha256 file.txt
```
```bash
echo hi | hash md5 -
```
```bash
hash sha512 image.iso
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `cli-tools/` category by opening the category README at [`cli-tools/README.md`](../cli-tools/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
