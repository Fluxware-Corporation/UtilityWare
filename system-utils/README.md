# 🖥️ System Utilities

> Inspect and monitor your system: disk, memory, CPU, processes, and cleanup helpers.

---

## Tools in this category

- [`sysinfo`](./sysinfo/) — One-page system summary (OS, kernel, CPU, mem, disk)
- [`disk-usage`](./disk-usage/) — Top 20 largest directories under the current path
- [`mem-monitor`](./mem-monitor/) — Continuously print memory usage every N seconds
- [`cpu-temp`](./cpu-temp/) — Print CPU temperature (Linux)
- [`pkill-name`](./pkill-name/) — Kill processes matching a name (with confirmation)
- [`cleanup`](./cleanup/) — Clear caches, old logs, and tmp files (interactive)
- [`top-mem`](./top-mem/) — Top 10 processes by memory usage
- [`top-cpu`](./top-cpu/) — Top 10 processes by CPU usage
- [`battery-health`](./battery-health/) — Print battery health percentage (Linux)
- [`who-is-logged-in`](./who-is-logged-in/) — Show currently logged-in users and their idle time
- [`open-ports`](./open-ports/) — Show ports in LISTEN state with process names
- [`boot-time`](./boot-time/) — Print when the system was booted and current uptime
- [`lsblk-pretty`](./lsblk-pretty/) — Pretty-print block devices with mount points
- [`thermals`](./thermals/) — Print all thermal zone temperatures

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./system-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
