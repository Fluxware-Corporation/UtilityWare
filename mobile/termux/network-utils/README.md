# 🌐 Network Utilities

> Quick network reconnaissance and lookup tools for daily ops work.

---

## Tools in this category

- [`ping-sweep`](./ping-sweep/) — Sweep a /24 subnet for live hosts
- [`dns-lookup`](./dns-lookup/) — Look up A, AAAA, MX, NS, TXT records
- [`headers`](./headers/) — Print HTTP response headers for a URL
- [`urlcodec`](./urlcodec/) — URL-encode or URL-decode a string
- [`myip`](./myip/) — Print only your public IP address
- [`is-up`](./is-up/) — Check if a host responds to ping
- [`port-check`](./port-check/) — Check if a TCP port is open on a host
- [`mac-vendor`](./mac-vendor/) — Look up the vendor for a MAC address (offline prefix DB)
- [`geoip`](./geoip/) — Print GeoIP info for an IP or domain
- [`ssl-info`](./ssl-info/) — Print SSL certificate info for a host:port

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./network-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
