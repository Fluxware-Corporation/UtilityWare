# ⚡ Productivity

> Quality-of-life tools that reduce friction: timers, focus mode, screenshots, lockers.

---

## Tools in this category

- [`pomodoro`](./pomodoro/) — Pomodoro timer: 25m work + 5m break, 4 cycles
- [`focus`](./focus/) — Temporarily block distracting hosts via /etc/hosts
- [`shot`](./shot/) — Take a screenshot and save with a timestamp
- [`now`](./now/) — Print a friendly timestamp header for daily logs
- [`meeting-timer`](./meeting-timer/) — Countdown for a meeting segment with progress bar
- [`habit-check`](./habit-check/) — Mark a habit as done today in ~/.habits.json
- [`standup`](./standup/) — Generate a standup template for today
- [`random-pick`](./random-pick/) — Pick a random line from stdin (decision helper)
- [`world-clock`](./world-clock/) — Print current time in several major cities

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./productivity/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
