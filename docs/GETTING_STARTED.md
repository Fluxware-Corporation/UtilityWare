# 🚀 Getting Started with UtilityWare

Welcome! This guide walks you from zero to productive in under five minutes.

## 1. Get the repo

```bash
unzip UtilityWare.zip
cd UtilityWare
```

## 2. Browse what's available

```bash
cat CATEGORIES.md         # the full index
ls shell-scripts/         # peek at any category
cat shell-scripts/README.md
```

## 3. Run a tool directly

Every tool is just a script. You can run it from the repo without installing anything:

```bash
./shell-scripts/extract/extract.sh my-archive.tar.gz
./cli-tools/calc/calc.py '2 + 2 * 3'
./cli-tools/uuidgen/uuidgen.py -n 5
```

## 4. (Optional) Install everything onto your PATH

```bash
./install.sh
# now you can call tools by name from anywhere
extract my-archive.tar.gz
calc '2 + 2 * 3'
uuidgen -n 5
```

Make sure `~/.local/bin` is on your `PATH`:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 5. Pipe tools together

UtilityWare tools are designed to compose. Example pipelines:

```bash
# Generate 5 UUIDs and columnate them
uuidgen -n 5 | columnate -d '-' -s '  '

# Slugify a folder full of filenames
ls | slugify

# Hash every file in the current dir
find . -type f -exec hash sha256 {} \;

# Decode a JWT, pretty-print the JSON
jwt 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMifQ.sig' | jsonfmt
```

## 6. Find help

Every tool has a `README.md` next to it:

```bash
cat cli-tools/calc/README.md
```

That's it — you're a UtilityWare user now. Welcome aboard.
