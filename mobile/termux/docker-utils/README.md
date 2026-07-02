# 🐳 Docker Utilities

> Convenience wrappers around docker and docker-compose for daily container ops.

---

## Tools in this category

- [`dk-ps`](./dk-ps/) — Pretty docker ps with sizes and created dates
- [`dk-clean`](./dk-clean/) — Remove stopped containers, dangling images, and unused volumes
- [`dk-sh`](./dk-sh/) — Open a shell in a running container (auto-detects sh/bash)
- [`dk-size`](./dk-size/) — Show disk usage of all docker images sorted by size
- [`dk-ip`](./dk-ip/) — Print the IP address of a container
- [`dk-logs-tail`](./dk-logs-tail/) — Tail logs from a container with timestamp prefix

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./docker-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
