# img-crop

> Crop an image to a rectangle (uses Pillow)

**Category:** `media-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `media`

---

## Description

Crop an image to a rectangle (uses Pillow)

This tool lives under the `media-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

Python 3.6+ and Pillow

## Usage

```bash
img-crop <in> <WxH+X+Y> <out>
```

## Examples

```bash
img-crop photo.jpg 200x200+50+50 thumb.jpg
```

## How it works

The tool is intentionally small and readable. Open the source file in this folder to see exactly what it does — there is no hidden magic and no telemetry. If you want to modify behavior, fork the file in-place.

## Exit codes

- `0` — success
- `1` — usage error / missing argument
- `2` — runtime error (file not found, network failure, etc.)

## See also

Browse other tools in the `media-utils/` category by opening the category README at [`media-utils/README.md`](../media-utils/README.md). For a full listing of all categories, see the [root README](../README.md).

## Contributing

Found a bug or want to add a feature? See [`CONTRIBUTING.md`](../CONTRIBUTING.md) at the repository root. Pull requests are welcome.
