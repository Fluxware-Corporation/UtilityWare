# 🌿 Git Utilities

> Workflow accelerators for Git: lazy commits, branch cleanup, changelog generation, and more.

---

## Tools in this category

- [`git-lazy`](./git-lazy/) — git add . && git commit -m <msg> && git push in one go
- [`git-undo`](./git-undo/) — Undo the last commit but keep changes
- [`git-clean`](./git-clean/) — Delete local branches already merged into main/master
- [`git-stats`](./git-stats/) — Show per-author commit count and last commit date
- [`git-ignore`](./git-ignore/) — Append patterns to .gitignore (creates if missing)
- [`git-changelog`](./git-changelog/) — Generate a Markdown changelog from commit history
- [`git-branches`](./git-branches/) — List local branches sorted by last commit date
- [`git-undo-hard`](./git-undo-hard/) — Dangerously undo last commit AND discard changes
- [`git-amend-author`](./git-amend-author/) — Amend the last commit's author to current user
- [`git-prune`](./git-prune/) — Prune already-deleted remote branches locally
- [`git-diff-stat`](./git-diff-stat/) — Show diff stats between two refs (default HEAD~1..HEAD)
- [`git-tags`](./git-tags/) — List tags sorted by date descending
- [`git-backup`](./git-backup/) — Bundle the repo into a single .bundle file

## Installation

Each tool is self-contained. Either copy the script into your `$PATH` (e.g. `~/.local/bin/`) or use the global installer at the repository root:

```bash
./install.sh
```

## Usage pattern

```bash
# from the repo root
./git-utils/<tool-name>/<tool-name>.sh   # or .py

# or, after install.sh
<tool-name>
```

## See also

- [Repository README](../README.md)
- [All categories](../CATEGORIES.md)
