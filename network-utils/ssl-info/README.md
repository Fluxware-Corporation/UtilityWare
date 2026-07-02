# ssl-info

> Print SSL certificate info for a host:port

**Category:** `network-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `network` `ssl`

---

## Description

Print SSL certificate info for a host:port

This tool lives under the `network-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

openssl

## Usage

```bash
ssl-info <host> [port]
```

## Examples

```bash
ssl-info github.com
```
```bash
ssl-info mail.example.com 993
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
