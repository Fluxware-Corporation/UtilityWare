# img-resize

> Resize an image (uses Pillow)

**Category:** `file-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `files` `image`

---

## Description

Resize an image (uses Pillow)

This tool lives under the `file-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+ and Pillow

## Usage

```bash
img-resize <in> <WxH> <out>
```

## Examples

```bash
img-resize big.jpg 800x600 small.jpg
```
```bash
img-resize photo.png 200x200 thumb.png
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `file-utils/` category by opening the category README at [`file-utils/README.md`](../file-utils/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
