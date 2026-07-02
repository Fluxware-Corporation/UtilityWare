#!/usr/bin/env python3
"""tiny-server — minimal HTTP server with file routing."""
import http.server, socketserver, sys, os

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.getcwd(), **kwargs)
    def end_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

def main():
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
    print(f"Serving {os.getcwd()} on http://localhost:{port}/")
    with socketserver.TCPServer(("0.0.0.0", port), Handler) as s:
        s.serve_forever()

if __name__ == "__main__":
    main()
