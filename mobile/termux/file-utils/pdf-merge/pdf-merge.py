#!/usr/bin/env python3
"""pdf-merge — merge PDFs."""
import sys
try:
    from pypdf import PdfWriter
except ImportError:
    try:
        from PyPDF2 import PdfWriter
    except ImportError:
        print("pdf-merge: install pypdf (pip install pypdf)", file=sys.stderr); sys.exit(2)

def main():
    if len(sys.argv) < 3:
        print("Usage: pdf-merge <out.pdf> <in1.pdf> [in2.pdf ...]", file=sys.stderr); sys.exit(1)
    out = sys.argv[1]
    w = PdfWriter()
    for f in sys.argv[2:]:
        w.append(f)
    with open(out, "wb") as fh:
        w.write(fh)
    print(f"merged {len(sys.argv)-2} files into {out}")

if __name__ == "__main__":
    main()
