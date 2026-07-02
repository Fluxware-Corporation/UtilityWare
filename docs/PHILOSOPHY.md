# 🧠 UtilityWare Philosophy

## Why this repo exists

Most "awesome-lists" are just link dumps. Most dotfile repos are highly personal. UtilityWare is neither — it's a **curated, organized, drop-in collection** of small terminal tools that you can install wholesale or pick from à la carte.

## The five principles

### 1. One tool, one folder, one README

Every tool gets its own folder, containing the tool itself and a `README.md` explaining what it does, how to use it, and what it depends on. No exceptions.

This is non-negotiable because it makes the repo **scannable**. You can `ls shell-scripts/` and immediately know what's there. You can `cat shell-scripts/extract/README.md` and know if it does what you need. You can delete a folder without thinking about side effects.

### 2. Zero magic

Every script is small enough to read top-to-bottom in under a minute. There is no config file format. There is no plugin system. There is no telemetry. The code you can read is the code that runs.

If a tool needs configuration, it takes it as arguments or environment variables, both of which are visible in `ps` and your shell history — no hidden state.

### 3. POSIX-first, Python when needed

Shell scripts target POSIX sh or bash without exotic features. Python tools target 3.6+ and avoid third-party dependencies unless the tool genuinely needs them (e.g. `img-resize` uses Pillow because resizing images by hand is insane).

This keeps the install story simple: clone, run, done.

### 4. Composable

Most tools accept stdin and/or arguments, so they pipe into each other naturally. The goal is for a thoughtful pipeline of three UtilityWare tools to replace a 200-line custom script:

```bash
ls *.jpg | slugify | xargs -I{} mv {} {}.jpg
```

### 5. Genuinely too big on purpose

This is a feature, not a bug. The repo is supposed to feel excessive. The point is that **whatever terminal task you're about to do, there's probably a tool for it here**, and if there isn't, the structure makes it obvious where to add one.

## What UtilityWare is *not*

- **Not a package manager.** There's no `UtilityWare install foo`. The tools are scripts, not packages.
- **Not a framework.** Don't `import` from these tools. Call them.
- **Not a replacement for coreutils.** These tools *wrap* and *extend* coreutils; they don't replace `ls`, `cp`, `grep`, etc.
- **Not for production servers.** Some tools are interactive, some are noisy, some assume a desktop. Use your judgement.

## On the "too big" question

Yes, 66 tools is a lot. That's the point. You'll use maybe 10 of them regularly. The other 56 are there for the day you suddenly need to extract a `.zst` archive, or generate a QR code, or fake a hacking demo for a slide deck. When that day comes, you'll be glad they're already on your machine.
