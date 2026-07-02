# 🎨 Media Utilities

> Image and audio helpers: resize, convert, generate ASCII art from pictures.

---

## Tools in this category

- [`img2ascii`](./img2ascii/) — Convert an image to ASCII art
- [`img-meta`](./img-meta/) — Print metadata for an image (EXIF)
- [`audio-info`](./audio-info/) — Print basic info about an audio file (uses ffprobe)
- [`img-crop`](./img-crop/) — Crop an image to a rectangle (uses Pillow)
- [`img-rotate`](./img-rotate/) — Rotate an image by N degrees (uses Pillow)
- [`img-grayscale`](./img-grayscale/) — Convert an image to grayscale (uses Pillow)
- [`img-thumbnail`](./img-thumbnail/) — Create a 200x200 thumbnail (uses Pillow)

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./media-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
