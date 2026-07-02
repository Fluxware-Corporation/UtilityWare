#!/usr/bin/env python3
"""yes — repeat a string forever."""
import sys
text = " ".join(sys.argv[1:]) if len(sys.argv) > 1 else "y"
try:
    while True:
        print(text)
except KeyboardInterrupt:
    pass
