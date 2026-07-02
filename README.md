# 🧰 UtilityWare
![Static Badge](https://img.shields.io/badge/Open-Source-LimeGreen?logo=GitHub&logoColor=%232EA043&labelColor=%23000000) ![Static Badge](https://img.shields.io/badge/Version-BETA-yellow?logoColor=%232EA043&labelColor=%23000000&color=%23D29922)
> A **genuinely-too-big** collection of terminal utilities — shell scripts, CLI tools, Git helpers, system utilities, network tools, dev accelerators, text processors, productivity boosters, fun toys, media helpers, and security utilities.

**178 tools** across **17 categories**. Each tool lives in its own folder with a dedicated `README.md` explaining what it does, how to use it, and what it depends on.

---

## 📦 What's inside

```
UtilityWare/
├── README.md                  ← you are here
├── CATEGORIES.md              ← full category index
├── CONTRIBUTING.md            ← how to add your own tools
├── CODE_OF_CONDUCT.md         ← be nice
├── SECURITY.md                ← responsible disclosure
├── LICENSE                    ← MIT
├── install.sh                 ← symlink all tools into ~/.local/bin
├── uninstall.sh               ← remove the symlinks
├── docs/
│   ├── GETTING_STARTED.md
│   ├── PHILOSOPHY.md
│   ├── FAQ.md
│   └── ADVANCED_PIPES.md
└── <category>/
    ├── README.md              ← category overview
    └── <tool-name>/
        ├── <tool-name>.sh|py  ← the tool
        └── README.md          ← per-tool docs
```

## 🗂 Categories

| # | Category | Tools | Description |
|---|----------|-------|-------------|
| 1 | [🐚 Shell Scripts](./shell-scripts/) | 25 | Pure POSIX/bash shell scripts for everyday terminal tasks. Zero dependencies, maximum portability. |
| 2 | [💻 CLI Tools](./cli-tools/) | 20 | Python-based command-line tools with rich behavior — argument parsing, color output, interactive prompts. |
| 3 | [🌿 Git Utilities](./git-utils/) | 13 | Workflow accelerators for Git: lazy commits, branch cleanup, changelog generation, and more. |
| 4 | [🖥️ System Utilities](./system-utils/) | 14 | Inspect and monitor your system: disk, memory, CPU, processes, and cleanup helpers. |
| 5 | [📁 File Utilities](./file-utils/) | 13 | Manipulate files in bulk: rename, encrypt, dedupe, organize, convert. |
| 6 | [🌐 Network Utilities](./network-utils/) | 10 | Quick network reconnaissance and lookup tools for daily ops work. |
| 7 | [🛠️ Developer Utilities](./dev-utils/) | 12 | Helpers that make development faster: JSON formatting, JWT decoding, UUID generation, local servers. |
| 8 | [📝 Text Utilities](./text-utils/) | 12 | Process, count, transform, and encode text. Great for piping between other tools. |
| 9 | [⚡ Productivity](./productivity/) | 9 | Quality-of-life tools that reduce friction: timers, focus mode, screenshots, lockers. |
| 10 | [🎉 Fun & Toys](./fun-utils/) | 10 | Because terminals deserve personality: matrix rain, fake hacker mode, fortune cookies. |
| 11 | [🎨 Media Utilities](./media-utils/) | 7 | Image and audio helpers: resize, convert, generate ASCII art from pictures. |
| 12 | [🔒 Security Utilities](./security-utils/) | 6 | Encryption, hashing, password strength, and audit helpers. Use responsibly. |
| 13 | [📊 Data Utilities](./data-utils/) | 6 | Inspect, transform, and summarize CSV/JSON/YAML data without heavy dependencies. |
| 14 | [🐳 Docker Utilities](./docker-utils/) | 6 | Convenience wrappers around docker and docker-compose for daily container ops. |
| 15 | [🖥️ Terminal Utilities](./terminal-utils/) | 6 | Profile, theme, and tune the terminal itself: colors, fonts, prompt segments. |
| 16 | [🐍 Python Utilities](./python-utils/) | 5 | Python-specific helpers: venv management, pip audit, requirements freeze. |
| 17 | [🤖 AI Utilities](./ai-utils/) | 4 | Tiny prompt helpers and stubs for working with LLM CLIs and prompt files. |


## 🚀 Quick start

```bash
# 1. Clone or unzip the repo
unzip UtilityWare.zip
cd UtilityWare

# 2. (Optional) Install every tool onto your PATH
./install.sh

# 3. Use any tool directly
./shell-scripts/extract/extract.sh archive.tar.gz
./cli-tools/calc/calc.py '2 + 2 * 3'
./git-utils/git-lazy/git-lazy.sh 'initial commit'

# 4. Or, after install.sh, just call them by name
extract archive.tar.gz
calc '2 + 2 * 3'
git-lazy 'initial commit'
```

## 📜 Tool list (the whole index)


### 🐚 Shell Scripts

- [`extract`](./shell-scripts/extract/) — Universal archive extractor (tar, zip, rar, 7z, gz, bz2, xz)
- [`mkcd`](./shell-scripts/mkcd/) — mkdir + cd combined into one command
- [`weather`](./shell-scripts/weather/) — Pretty-print weather from wttr.in
- [`qr`](./shell-scripts/qr/) — Generate a QR code in the terminal for any text
- [`colors`](./shell-scripts/colors/) — Print a 256-color palette and ANSI demo
- [`battery`](./shell-scripts/battery/) — Print battery status (Linux/macOS)
- [`wifi-password`](./shell-scripts/wifi-password/) — Print the current Wi-Fi network password
- [`speedtest`](./shell-scripts/speedtest/) — Run a quick download speed test against a public server
- [`ports`](./shell-scripts/ports/) — List all listening TCP/UDP ports with owning process
- [`ips`](./shell-scripts/ips/) — Print all IP addresses (local + public)
- [`bk`](./shell-scripts/bk/) — Timestamped backup of a file or directory
- [`toupper`](./shell-scripts/toupper/) — Convert stdin or arguments to UPPERCASE
- [`tolower`](./shell-scripts/tolower/) — Convert stdin or arguments to lowercase
- [`trim`](./shell-scripts/trim/) — Strip leading/trailing whitespace from stdin or arg
- [`ruler`](./shell-scripts/ruler/) — Print a numbered ruler line for column reference
- [`iso-date`](./shell-scripts/iso-date/) — Print current date/time in ISO 8601 (UTC and local)
- [`epoch`](./shell-scripts/epoch/) — Convert between Unix epoch seconds and human dates
- [`countdown`](./shell-scripts/countdown/) — Days/hours until a target date
- [`repeat`](./shell-scripts/repeat/) — Repeat a command N times
- [`watch-cmd`](./shell-scripts/watch-cmd/) — Run a command every N seconds, clearing screen first
- [`header`](./shell-scripts/header/) — Print a banner header around a label
- [`line-count`](./shell-scripts/line-count/) — Count lines in files matching a pattern (recursive)
- [`pubkey`](./shell-scripts/pubkey/) — Print your SSH public key (~/.ssh/id_*.pub)
- [`serve-py`](./shell-scripts/serve-py/) — Tiny alias for python3 -m http.server with port arg
- [`iso8601`](./shell-scripts/iso8601/) — Print a stream of ISO 8601 timestamps, one per second

### 💻 CLI Tools

- [`calc`](./cli-tools/calc/) — Inline calculator with math expression evaluation
- [`todo`](./cli-tools/todo/) — Tiny todo list stored in ~/.todo.json
- [`passgen`](./cli-tools/passgen/) — Generate strong random passwords
- [`hash`](./cli-tools/hash/) — Compute hashes (md5, sha1, sha256, sha512) for files or stdin
- [`stopwatch`](./cli-tools/stopwatch/) — Terminal stopwatch with start/stop/lap
- [`timer`](./cli-tools/timer/) — Countdown timer that beeps when done
- [`notes`](./cli-tools/notes/) — Quick notes appended to ~/.notes.md with timestamps
- [`uuidgen`](./cli-tools/uuidgen/) — Generate one or more UUIDs (v4)
- [`lorem`](./cli-tools/lorem/) — Generate lorem ipsum paragraphs
- [`slugify`](./cli-tools/slugify/) — Convert any text into a URL/file-safe slug
- [`palette`](./cli-tools/palette/) — Generate a harmonious color palette from a base hex color
- [`freq`](./cli-tools/freq/) — Word frequency analysis on stdin or file
- [`tiny-server`](./cli-tools/tiny-server/) — Single-file HTTP server with routing (no deps)
- [`pick`](./cli-tools/pick/) — Interactive picker — choose one line from stdin
- [`qr-text`](./cli-tools/qr-text/) — Generate a textual QR-like grid (placeholder pattern)
- [`spinner`](./cli-tools/spinner/) — Animated spinner while a long command runs
- [`search-highlight`](./cli-tools/search-highlight/) — Grep with ANSI highlight (like grep --color but standalone)
- [`ascii-table`](./cli-tools/ascii-table/) — Render a Markdown table from CSV
- [`filter-unique`](./cli-tools/filter-unique/) — Filter unique lines preserving order
- [`head-tail`](./cli-tools/head-tail/) — Show first N and last N lines of a file with '...' between

### 🌿 Git Utilities

- [`git-lazy`](./git-utils/git-lazy/) — git add . && git commit -m <msg> && git push in one go
- [`git-undo`](./git-utils/git-undo/) — Undo the last commit but keep changes
- [`git-clean`](./git-utils/git-clean/) — Delete local branches already merged into main/master
- [`git-stats`](./git-utils/git-stats/) — Show per-author commit count and last commit date
- [`git-ignore`](./git-utils/git-ignore/) — Append patterns to .gitignore (creates if missing)
- [`git-changelog`](./git-utils/git-changelog/) — Generate a Markdown changelog from commit history
- [`git-branches`](./git-utils/git-branches/) — List local branches sorted by last commit date
- [`git-undo-hard`](./git-utils/git-undo-hard/) — Dangerously undo last commit AND discard changes
- [`git-amend-author`](./git-utils/git-amend-author/) — Amend the last commit's author to current user
- [`git-prune`](./git-utils/git-prune/) — Prune already-deleted remote branches locally
- [`git-diff-stat`](./git-utils/git-diff-stat/) — Show diff stats between two refs (default HEAD~1..HEAD)
- [`git-tags`](./git-utils/git-tags/) — List tags sorted by date descending
- [`git-backup`](./git-utils/git-backup/) — Bundle the repo into a single .bundle file

### 🖥️ System Utilities

- [`sysinfo`](./system-utils/sysinfo/) — One-page system summary (OS, kernel, CPU, mem, disk)
- [`disk-usage`](./system-utils/disk-usage/) — Top 20 largest directories under the current path
- [`mem-monitor`](./system-utils/mem-monitor/) — Continuously print memory usage every N seconds
- [`cpu-temp`](./system-utils/cpu-temp/) — Print CPU temperature (Linux)
- [`pkill-name`](./system-utils/pkill-name/) — Kill processes matching a name (with confirmation)
- [`cleanup`](./system-utils/cleanup/) — Clear caches, old logs, and tmp files (interactive)
- [`top-mem`](./system-utils/top-mem/) — Top 10 processes by memory usage
- [`top-cpu`](./system-utils/top-cpu/) — Top 10 processes by CPU usage
- [`battery-health`](./system-utils/battery-health/) — Print battery health percentage (Linux)
- [`who-is-logged-in`](./system-utils/who-is-logged-in/) — Show currently logged-in users and their idle time
- [`open-ports`](./system-utils/open-ports/) — Show ports in LISTEN state with process names
- [`boot-time`](./system-utils/boot-time/) — Print when the system was booted and current uptime
- [`lsblk-pretty`](./system-utils/lsblk-pretty/) — Pretty-print block devices with mount points
- [`thermals`](./system-utils/thermals/) — Print all thermal zone temperatures

### 📁 File Utilities

- [`batch-rename`](./file-utils/batch-rename/) — Batch rename files using a sed-style pattern
- [`file-crypt`](./file-utils/file-crypt/) — AES-256 encrypt/decrypt a file with a passphrase
- [`dupes`](./file-utils/dupes/) — Find duplicate files by content hash
- [`organize`](./file-utils/organize/) — Sort files in a directory into subfolders by extension
- [`img-resize`](./file-utils/img-resize/) — Resize an image (uses Pillow)
- [`pdf-merge`](./file-utils/pdf-merge/) — Merge multiple PDFs into one (uses pypdf)
- [`find-big`](./file-utils/find-big/) — Find the N largest files under a path
- [`find-empty`](./file-utils/find-empty/) — Find empty files or directories under a path
- [`touch-stamp`](./file-utils/touch-stamp/) — Touch files with a custom timestamp
- [`file-type`](./file-utils/file-type/) — Identify file type using magic bytes
- [`tree-lite`](./file-utils/tree-lite/) — Print a tree view of a directory (no deps)
- [`zero-pad`](./file-utils/zero-pad/) — Zero-pad numeric parts in filenames (e.g. file1 -> file001)
- [`split-csv`](./file-utils/split-csv/) — Split a large CSV into chunks of N rows each

### 🌐 Network Utilities

- [`ping-sweep`](./network-utils/ping-sweep/) — Sweep a /24 subnet for live hosts
- [`dns-lookup`](./network-utils/dns-lookup/) — Look up A, AAAA, MX, NS, TXT records
- [`headers`](./network-utils/headers/) — Print HTTP response headers for a URL
- [`urlcodec`](./network-utils/urlcodec/) — URL-encode or URL-decode a string
- [`myip`](./network-utils/myip/) — Print only your public IP address
- [`is-up`](./network-utils/is-up/) — Check if a host responds to ping
- [`port-check`](./network-utils/port-check/) — Check if a TCP port is open on a host
- [`mac-vendor`](./network-utils/mac-vendor/) — Look up the vendor for a MAC address (offline prefix DB)
- [`geoip`](./network-utils/geoip/) — Print GeoIP info for an IP or domain
- [`ssl-info`](./network-utils/ssl-info/) — Print SSL certificate info for a host:port

### 🛠️ Developer Utilities

- [`serve`](./dev-utils/serve/) — Start a simple HTTP server in the current dir with CORS
- [`jsonfmt`](./dev-utils/jsonfmt/) — Pretty-print or minify JSON (from file or stdin)
- [`b64`](./dev-utils/b64/) — Base64 encode/decode a string or file
- [`jwt`](./dev-utils/jwt/) — Decode a JWT and print its header/payload as JSON
- [`tmux-init`](./dev-utils/tmux-init/) — Bootstrap a tmux session with sensible defaults
- [`http-status`](./dev-utils/http-status/) — Print the meaning of an HTTP status code
- [`crc32`](./dev-utils/crc32/) — Compute CRC32 of a file or stdin
- [`escape-html`](./dev-utils/escape-html/) — Escape < > & for HTML
- [`escape-url`](./dev-utils/escape-url/) — URL-encode a string (alias for urlcodec enc)
- [`timestamp`](./dev-utils/timestamp/) — Print current Unix timestamp (seconds and ms)
- [`fake-data`](./dev-utils/fake-data/) — Generate fake data: names, emails, IPs (no deps)
- [`port-find`](./dev-utils/port-find/) — Find a free TCP port between min and max

### 📝 Text Utilities

- [`wc2`](./text-utils/wc2/) — Extended word count: chars, words, lines, sentences
- [`textstat`](./text-utils/textstat/) — Readability stats (Flesch reading ease)
- [`rot13`](./text-utils/rot13/) — ROT13 cipher on stdin or argument
- [`morse`](./text-utils/morse/) — Translate text to/from Morse code
- [`columnate`](./text-utils/columnate/) — Pretty-print CSV/TSV as aligned columns
- [`word-wrap`](./text-utils/word-wrap/) — Wrap text to a max line width
- [`reverse`](./text-utils/reverse/) — Reverse lines, words, or characters
- [`dedent`](./text-utils/dedent/) — Strip common leading whitespace from each line
- [`ascii-art`](./text-utils/ascii-art/) — Convert text to tiny ASCII art (1-row font)
- [`strip-ansi`](./text-utils/strip-ansi/) — Remove ANSI escape sequences from input
- [`center`](./text-utils/center/) — Center text in a given width
- [`number-lines`](./text-utils/number-lines/) — Add line numbers to input (cat -n style)

### ⚡ Productivity

- [`pomodoro`](./productivity/pomodoro/) — Pomodoro timer: 25m work + 5m break, 4 cycles
- [`focus`](./productivity/focus/) — Temporarily block distracting hosts via /etc/hosts
- [`shot`](./productivity/shot/) — Take a screenshot and save with a timestamp
- [`now`](./productivity/now/) — Print a friendly timestamp header for daily logs
- [`meeting-timer`](./productivity/meeting-timer/) — Countdown for a meeting segment with progress bar
- [`habit-check`](./productivity/habit-check/) — Mark a habit as done today in ~/.habits.json
- [`standup`](./productivity/standup/) — Generate a standup template for today
- [`random-pick`](./productivity/random-pick/) — Pick a random line from stdin (decision helper)
- [`world-clock`](./productivity/world-clock/) — Print current time in several major cities

### 🎉 Fun & Toys

- [`matrix`](./fun-utils/matrix/) — Matrix rain effect in your terminal
- [`hack`](./fun-utils/hack/) — Fake 'hacking' terminal animation for demos
- [`fortune-cookie`](./fun-utils/fortune-cookie/) — Print a random fortune-cookie message
- [`banner`](./fun-utils/banner/) — Print a large ASCII banner from text
- [`coin-flip`](./fun-utils/coin-flip/) — Flip a coin (heads or tails)
- [`dice`](./fun-utils/dice/) — Roll N dice with M sides each (default 1d6)
- [`cowsay`](./fun-utils/cowsay/) — Make a cow say something (no Perl required)
- [`figlet-small`](./fun-utils/figlet-small/) — Small figlet-style banner (single-line)
- [`yes`](./fun-utils/yes/) — Repeatedly print a string until killed (like yes(1))
- [`typing-test`](./fun-utils/typing-test/) — Tiny typing speed test (10 short words)

### 🎨 Media Utilities

- [`img2ascii`](./media-utils/img2ascii/) — Convert an image to ASCII art
- [`img-meta`](./media-utils/img-meta/) — Print metadata for an image (EXIF)
- [`audio-info`](./media-utils/audio-info/) — Print basic info about an audio file (uses ffprobe)
- [`img-crop`](./media-utils/img-crop/) — Crop an image to a rectangle (uses Pillow)
- [`img-rotate`](./media-utils/img-rotate/) — Rotate an image by N degrees (uses Pillow)
- [`img-grayscale`](./media-utils/img-grayscale/) — Convert an image to grayscale (uses Pillow)
- [`img-thumbnail`](./media-utils/img-thumbnail/) — Create a 200x200 thumbnail (uses Pillow)

### 🔒 Security Utilities

- [`pw-strength`](./security-utils/pw-strength/) — Estimate password strength (entropy bits)
- [`shredder`](./security-utils/shredder/) — Securely overwrite a file with random bytes before delete
- [`audit-perms`](./security-utils/audit-perms/) — Find world-writable files in a directory tree
- [`rand-hex`](./security-utils/rand-hex/) — Generate N bytes of random hex
- [`totp-gen`](./security-utils/totp-gen/) — Generate a TOTP code from a base32 secret
- [`hexdump`](./security-utils/hexdump/) — Print a hex+ASCII dump of a file (like xxd)

### 📊 Data Utilities

- [`csv-head`](./data-utils/csv-head/) — Print first N rows of a CSV with column alignment
- [`csv-filter`](./data-utils/csv-filter/) — Filter CSV rows where a column matches a value
- [`json-keys`](./data-utils/json-keys/) — List all keys at the top level of a JSON object
- [`json-get`](./data-utils/json-get/) — Get a value at a dotted path from a JSON file (e.g. a.b.c)
- [`json-csv`](./data-utils/json-csv/) — Convert a flat JSON array of objects into CSV
- [`stats`](./data-utils/stats/) — Compute mean/median/min/max/stddev on a column of numbers

### 🐳 Docker Utilities

- [`dk-ps`](./docker-utils/dk-ps/) — Pretty docker ps with sizes and created dates
- [`dk-clean`](./docker-utils/dk-clean/) — Remove stopped containers, dangling images, and unused volumes
- [`dk-sh`](./docker-utils/dk-sh/) — Open a shell in a running container (auto-detects sh/bash)
- [`dk-size`](./docker-utils/dk-size/) — Show disk usage of all docker images sorted by size
- [`dk-ip`](./docker-utils/dk-ip/) — Print the IP address of a container
- [`dk-logs-tail`](./docker-utils/dk-logs-tail/) — Tail logs from a container with timestamp prefix

### 🖥️ Terminal Utilities

- [`term-size`](./terminal-utils/term-size/) — Print current terminal rows and columns
- [`term-reset`](./terminal-utils/term-reset/) — Reset the terminal (clear + reset colors + cursor)
- [`term-title`](./terminal-utils/term-title/) — Set the terminal window/tab title
- [`cursor-hide`](./terminal-utils/cursor-hide/) — Hide the terminal cursor (undo with cursor-show)
- [`cursor-show`](./terminal-utils/cursor-show/) — Show the terminal cursor
- [`theme-preview`](./terminal-utils/theme-preview/) — Print a preview of common terminal color codes

### 🐍 Python Utilities

- [`py-venv`](./python-utils/py-venv/) — Create and activate a Python venv in ./.venv
- [`py-freeze`](./python-utils/py-freeze/) — Freeze requirements, sorted and deduplicated
- [`py-pins`](./python-utils/py-pins/) — List all pinned versions in requirements.txt
- [`py-imports`](./python-utils/py-imports/) — List all third-party imports in a Python file
- [`py-repl-init`](./python-utils/py-repl-init/) — Start a Python REPL with common imports preloaded

### 🤖 AI Utilities

- [`prompt-file`](./ai-utils/prompt-file/) — Read a prompt from a .prompt file and print to stdout
- [`prompt-list`](./ai-utils/prompt-list/) — List all .prompt files under a directory
- [`token-est`](./ai-utils/token-est/) — Rough token estimate for a text file (~4 chars per token)
- [`prompt-template`](./ai-utils/prompt-template/) — Render a prompt template by substituting {{vars}}


## 🧠 Design philosophy

1. **One tool, one folder, one README.** No exceptions.
2. **Zero magic.** Every script is small enough to read top-to-bottom in under a minute.
3. **POSIX-first.** Shell scripts avoid bashisms where possible; Python tools target 3.6+ with no third-party deps unless the tool genuinely needs them.
4. **Composable.** Most tools accept stdin and/or arguments, so they pipe into each other naturally.
5. **No telemetry.** Nothing phones home. The only network calls are ones *you* asked for (e.g. `weather`, `speedtest`).

See [`docs/PHILOSOPHY.md`](./docs/PHILOSOPHY.md) for the full treatise.

## 🤝 Contributing

Pull requests are welcome — see [`CONTRIBUTING.md`](./CONTRIBUTING.md). The repo is intentionally over-organized so new tools have an obvious home.

## 📄 License

MIT — see [`LICENSE`](./LICENSE).

---

*Maintained by Fluxware Corporation. Built for people who live in the terminal.*
