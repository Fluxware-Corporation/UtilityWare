# urlcodec

> URL-encode or URL-decode a string

**Category:** `network-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `network` `encoding`

---

## Description

URL-encode or URL-decode a string

This tool lives under the `network-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+

## Usage

```bash
urlcodec <enc|dec> <string>
```

## Examples

```bash
urlcodec enc 'hello world & friends'
```
```bash
urlcodec dec 'hello%20world%20%26%20friends'
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `network-utils/` category by opening the category README at [`network-utils/README.md`](../network-utils/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
