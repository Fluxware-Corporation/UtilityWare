# audio-info

> Print basic info about an audio file (uses ffprobe)

**Category:** `media-utils`
**Author:** Fluxware Corporation
**License:** MIT
**Tags:** `media` `audio`

---

## Description

Print basic info about an audio file (uses ffprobe)

This tool lives under the `media-utils/` category of UtilityWare. It is designed to be a small, focused, single-purpose utility that does one thing well. Combine it with other tools from the repository to build powerful pipelines.

## Requirements

ffprobe (part of ffmpeg)

## Usage

```bash
audio-info <file>
```

## Examples

```bash
audio-info song.mp3
```
```bash
audio-info clip.wav
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
