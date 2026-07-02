# Contributing to UtilityWare

Thanks for considering a contribution! UtilityWare is maintained by **Fluxware Corporation** and we welcome community contributions through a fork-first workflow.

## How to contribute (fork-first workflow)

We use a **fork-and-issue** model instead of direct pull requests. Here's how it works:

### 1. Fork the repository

Click the **Fork** button at the top right of the [main UtilityWare repository](https://github.com/PLACEHOLDER/UtilityWare) page on GitHub. This creates your own copy of the repo under your account.

### 2. Clone your fork locally

```bash
git clone https://github.com/YOUR_USERNAME/UtilityWare.git
cd UtilityWare
git remote add upstream https://github.com/PLACEHOLDER/UtilityWare.git
```

### 3. Create a branch for your changes

```bash
git checkout -b add-my-new-tool
```

### 4. Make your changes

Follow the guidelines below (adding a tool, style rules, etc.). Commit your work:

```bash
git add -A
git commit -m "add: <tool-name> — <one-line description>"
git push origin add-my-new-tool
```

### 5. Open an issue in the main repository

**Do not open a pull request.** Instead, go to the [issues page](https://github.com/PLACEHOLDER/UtilityWare/issues) of the **main** repository (not your fork) and open a new issue with the following template:

```
**Title:** Merge request: <brief description>

**Type:** new tool / bug fix / improvement / documentation

**Fork:** YOUR_USERNAME/UtilityWare
**Branch:** add-my-new-tool
**Link:** https://github.com/YOUR_USERNAME/UtilityWare/tree/add-my-new-tool

**Description:**
<What does this change do? Why should it be merged?>

**Tool(s) added/changed:**
- <tool-name> — <one-line description>

**Checklist:**
- [ ] Each new tool has its own folder with a README.md
- [ ] The tool is executable (chmod +x)
- [ ] The category README has been updated
- [ ] No third-party dependencies unless genuinely needed
- [ ] No telemetry or unwanted network calls
```

### 6. Maintainers review

The Fluxware Corporation maintainers will review your issue and the changes in your fork. They may:

- **Merge** the changes into the main repository (we'll handle the actual merge from your fork).
- **Request changes** — we'll comment on the issue with feedback. Make the requested changes in your fork, push to the same branch, and add a comment to the issue.
- **Decline** — if the change doesn't fit the project's scope or philosophy, we'll explain why.

### 7. After merge

Once merged, you can sync your fork with the main repository:

```bash
git checkout main
git pull upstream main
git push origin main
```

## Adding a new tool

1. **Pick the right category.** Browse [`CATEGORIES.md`](./CATEGORIES.md). If your tool genuinely doesn't fit any, mention it in your issue and we'll discuss a new category.
2. **Create the folder.** Each tool lives at `<category>/<tool-name>/`.
3. **Add the tool itself.** Use the matching extension:
   - `.sh` for shell scripts (POSIX/bash)
   - `.py` for Python 3.6+ tools
4. **Add a README.md** in the same folder. Use the existing tools' READMEs as a template.
5. **Make the tool executable** (`chmod +x`).
6. **Update the category README.** Add a one-line entry linking to your tool.

## Style guidelines

- **Small is beautiful.** If a tool grows past ~150 lines, consider splitting it.
- **No telemetry, no network calls** unless the tool's whole point is network (e.g. `weather`, `speedtest`).
- **Document dependencies** in the README under `Requirements`.
- **Use clear exit codes**: `0` success, `1` usage error, `2` runtime error.
- **Be polite on stderr** — error messages should start with the tool name.
- **Match the existing README format** so the repo stays scannable.
- **Author field** in tool READMEs should remain `Fluxware Corporation` (it's set by default in the generator).

## Reporting bugs

Open an issue in the main repository with:
- The tool name and category
- Your OS and shell
- The exact command you ran
- The expected vs. actual output

## Licensing

By contributing, you agree your contributions will be licensed under the MIT license (see [`LICENSE`](./LICENSE)), with copyright assigned to Fluxware Corporation.

## Code of Conduct

Participation in this project is governed by [`CODE_OF_CONDUCT.md`](./CODE_OF_CONDUCT.md). Be excellent to each other.
