# ❓ Frequently Asked Questions

## General

### Why so many tools?

Because the cost of carrying an unused 50-line shell script is essentially zero, and the cost of *not* having a tool when you need it is high. See [`docs/PHILOSOPHY.md`](./PHILOSOPHY.md).

### Are these tools production-ready?

They're **personal-productivity-ready**. They're well-tested in the sense of "I use them every day", not in the sense of "they have a 500-test CI suite." For production infrastructure, write or buy something more rigorous.

### Will you add a tool that does X?

Maybe. Open an issue describing the use case. If it fits the philosophy (small, single-purpose, composable), the answer is probably yes.

## Installation

### `install.sh` failed with "permission denied"

You probably don't have `~/.local/bin` on your `PATH` yet. Fix:

```bash
mkdir -p ~/.local/bin
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
./install.sh
```

### How do I uninstall?

```bash
./uninstall.sh
```

This removes the symlinks from `~/.local/bin` but leaves the repo itself untouched.

### Can I install just one category?

Sure — just symlink the tools you want manually:

```bash
ln -s "$(pwd)/shell-scripts/extract/extract.sh" ~/.local/bin/extract
```

## Compatibility

### Do these work on macOS?

Most do. Tools that read `/sys/` or `/proc/` (like `cpu-temp`) are Linux-only and say so in their READMEs.

### Do these work on Windows?

Native Windows `cmd.exe` is not supported. **WSL** works fine — treat it as Linux.

### Do these work on BSD?

Probably, for the POSIX shell scripts. The Python tools should work. Things that invoke `systemd` or Linux-specific `/sys` paths will not.

## Security

### Is it safe to run `install.sh`?

Read it. It's 20 lines. It just symlinks scripts into `~/.local/bin`. Nothing else.

### Some tools use `sudo`. Why?

`focus` modifies `/etc/hosts` to block distracting sites. `wifi-password` reads the system keychain on macOS. There's no way around `sudo` for these — they're modifying system state.

### Are passwords ever stored?

No. `todo`, `notes`, etc. store data in `~/.todo.json` and `~/.notes.md` as plain text. Don't put secrets in them. Use `pass` or your OS keychain for secrets.

## Contributing

### I wrote a tool. Will you accept it?

Probably, if it follows the folder/README convention. Fork the repo, make your changes, then open an issue in the main repository asking us to merge. See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for the full workflow.

### Can I rewrite a tool in Rust/Go?

Only if the rewrite is meaningfully faster *and* you provide pre-built binaries. A Rust rewrite that requires the user to install the Rust toolchain is a regression in usability.
