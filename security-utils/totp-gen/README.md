# totp-gen

> Generate a TOTP code from a base32 secret

**Category:** `security-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `security` `totp`

---

## Description

Generate a TOTP code from a base32 secret

This tool lives under the `security-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+

## Usage

```bash
totp-gen <base32-secret>
```

## Examples

```bash
totp-gen JBSWY3DPEHPK3PXP
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `security-utils/` category by opening the category README at [`security-utils/README.md`](../security-utils/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
