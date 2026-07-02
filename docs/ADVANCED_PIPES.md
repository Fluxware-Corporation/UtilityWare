# 🧪 Advanced Pipelines

UtilityWare tools are designed to compose. Here are some real-world pipelines that combine multiple tools.

## Generate a slugified list of every folder name

```bash
ls -d */ | sed 's|/$||' | slugify
```

## Hash every file in a directory and find duplicates

```bash
find . -type f -exec dupes.py {} +
```

## Resize every image in a folder to 800px wide

```bash
for img in *.jpg; do
  img-resize.py "$img" 800x600 "small-$img"
done
```

## Generate 100 UUIDs and columnate them into 5 columns

```bash
uuidgen -n 100 | paste - - - - -
```

## Decode every JWT in a file, one per line

```bash
while read -r token; do
  echo "=== $token ==="
  jwt.py "$token"
done < tokens.txt
```

## Block distractions for 25 minutes, then start a pomodoro

```bash
focus 25 & pomodoro.py
```

## Create a backup, hash it, and verify

```bash
bk.sh important-dir
hash.py sha256 important-dir.bak.*.tgz > backup.sha256
sha256sum -c backup.sha256
```

## Take a screenshot and slugify the filename

```bash
shot.sh
latest=$(ls -t ~/Pictures/Screenshots/shot-*.png | head -1)
new_name=$(basename "$latest" .png | slugify).png
mv "$latest" "~/Pictures/Screenshots/$new_name"
```

## Make a QR code for the current Wi-Fi password

```bash
pass=$(wifi-password.sh)
qr.sh "WIFI:T:WPA;S:$(iwgetid -r);P:${pass};;"
```

## Print system info + current weather into a daily log

```bash
{
  now.sh
  sysinfo.sh
  weather.sh
} >> ~/diary/$(date +%Y-%m-%d).log
