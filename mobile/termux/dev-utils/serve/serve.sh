#!/usr/bin/env bash
# serve — simple HTTP server with CORS
set -euo pipefail
port="${1:-8000}"
echo "Serving $(pwd) on http://localhost:${port}"
python3 -c "
from http.server import HTTPServer, SimpleHTTPRequestHandler
class H(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()
HTTPServer(('0.0.0.0', ${port}), H).serve_forever()
"
