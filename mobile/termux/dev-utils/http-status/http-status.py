#!/usr/bin/env python3
"""http-status — HTTP status code lookup."""
import sys

CODES = {
    100: "Continue", 101: "Switching Protocols",
    200: "OK", 201: "Created", 202: "Accepted", 204: "No Content",
    206: "Partial Content",
    301: "Moved Permanently", 302: "Found", 304: "Not Modified",
    307: "Temporary Redirect", 308: "Permanent Redirect",
    400: "Bad Request", 401: "Unauthorized", 403: "Forbidden",
    404: "Not Found", 405: "Method Not Allowed", 408: "Request Timeout",
    409: "Conflict", 410: "Gone", 418: "I'm a teapot",
    422: "Unprocessable Entity", 429: "Too Many Requests",
    500: "Internal Server Error", 501: "Not Implemented",
    502: "Bad Gateway", 503: "Service Unavailable", 504: "Gateway Timeout",
}

def main():
    if len(sys.argv) < 2:
        print("Usage: http-status <code>", file=sys.stderr); sys.exit(1)
    try:
        c = int(sys.argv[1])
        print(f"{c} — {CODES.get(c, 'unknown')}")
    except ValueError:
        print("http-status: not a number", file=sys.stderr); sys.exit(1)

if __name__ == "__main__":
    main()
