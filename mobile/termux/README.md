# 📱 UtilityWare for Termux

This folder contains a **Termux-adapted copy** of all UtilityWare tools. The scripts are functionally identical to the desktop versions, but the documentation and install path are tuned for Termux on Android.

## What's different

| Aspect | Desktop | Termux |
|---|---|---|
| Install location | `~/.local/bin` | `$PREFIX/bin` (usually `~/../usr/bin`) |
| Screenshot dir | `~/Pictures/Screenshots` | `$HOME/Pictures` (you may need to grant storage permission) |
| sudo | Available | **Not available** — tools that need root will print a warning and exit |
| Battery/temp sensors | `/sys/class/power_supply/BAT*`, `/sys/class/thermal/*` | Usually accessible on rooted devices; may be absent otherwise |
| `weather`, `myip`, etc. | Network calls work | Network calls work — make sure Termux has internet permission (it does by default) |

## Installing

```bash
# From this mobile/termux/ folder:
./install-termux.sh

# Or, if you want to install the desktop scripts directly (they still work):
cd ../..
./install.sh   # but set TARGET_DIR=$PREFIX/bin first
```

## Termux setup tips

If you haven't set up Termux yet:

```bash
# 1. Install Termux from F-Droid (NOT Google Play — that version is outdated)
# 2. Update packages
pkg update && pkg upgrade

# 3. Install essential tools
pkg install python git curl wget openssh tmux nano

# 4. Grant storage access (for tools that write to ~/Pictures etc.)
termux-setup-storage

# 5. Add ~/.local/bin or $PREFIX/bin to PATH (latter is already on PATH)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Tools that work great on Termux

- All text utilities (`wc2`, `textstat`, `slugify`, `morse`, `rot13`, etc.)
- All Git utilities
- `todo`, `notes`, `habit-check`, `pomodoro`
- `weather`, `myip`, `headers`, `dns-lookup`
- `passgen`, `rand-hex`, `totp-gen`
- `qr` (you can show a QR code on your phone!)
- `serve`, `tiny-server` (host files from your phone)

## Tools that may not work on Termux

- `wifi-password` — needs root or NetworkManager
- `focus` — modifies /etc/hosts, which is read-only on Android without root
- `cpu-temp`, `thermals` — sensors may not be exposed
- `audio-info` — `ffprobe` isn't installed by default; `pkg install ffmpeg` to fix
- `img-*` tools — need Pillow; `pip install pillow` works in Termux

## Sudo warning

Tools that call `sudo` (like `focus`) will detect the absence of sudo and exit with a helpful message rather than crashing.

## Storage paths

Termux's idea of "home" is `~` (which is `/data/data/com.termux/files/home`). Your phone's Downloads, Pictures, etc. are at `~/storage/shared/Downloads`, `~/storage/shared/Pictures`, etc. — but only after you've run `termux-setup-storage`.

---

For the full tool index, see the [main README](../../README.md).
