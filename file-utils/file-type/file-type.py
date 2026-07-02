#!/usr/bin/env python3
"""file-type — identify files by magic bytes."""
import sys

MAGIC = [
    (b"\x89PNG\r\n\x1a\n", "PNG image"),
    (b"\xff\xd8\xff", "JPEG image"),
    (b"GIF87a", "GIF image"),
    (b"GIF89a", "GIF image"),
    (b"PK\x03\x04", "ZIP/OOXML/JAR archive"),
    (b"\x1f\x8b", "gzip compressed"),
    (b"BZh", "bzip2 compressed"),
    (b"\xfd7zXZ", "xz compressed"),
    (b"7z\xbc\xaf\x27\x1c", "7-Zip archive"),
    (b"%PDF-", "PDF document"),
    (b"RIFF", "RIFF (WAV/AVI)"),
    (b"OggS", "Ogg multimedia"),
    (b"ID3", "MP3 audio"),
    (b"ftyp", "MP4 video"),
    (b"\x7fELF", "ELF executable"),
    (b"MZ", "Windows PE executable"),
    (b"#!", "shell script"),
    (b"<?xml", "XML document"),
]

def main():
    if len(sys.argv) < 2:
        print("Usage: file-type <file> [file...]", file=sys.stderr); sys.exit(1)
    for path in sys.argv[1:]:
        try:
            with open(path, "rb") as f:
                head = f.read(16)
            kind = "unknown"
            for magic, name in MAGIC:
                if head.startswith(magic):
                    kind = name; break
            if kind == "unknown" and head[:2] == b"#!":
                kind = "script (shebang)"
            print(f"{path}: {kind}")
        except OSError as e:
            print(f"{path}: error ({e})", file=sys.stderr)

if __name__ == "__main__":
    main()
