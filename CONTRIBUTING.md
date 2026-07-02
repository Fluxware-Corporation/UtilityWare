# Contributing to UtilityWare

Thanks for considering a contribution! UtilityWare is maintained by **Fluxware Corporation**, and we welcome community contributions through the standard GitHub fork-and-pull-request workflow.

## How to contribute

### 1. Fork the repository

Click the **Fork** button at the top right of the [main UtilityWare repository](https://github.com/PLACEHOLDER/UtilityWare) page on GitHub. This creates your own copy of the repository under your account.

### 2. Clone your fork locally

```bash
git clone https://github.com/YOUR_USERNAME/UtilityWare.git
cd UtilityWare
git remote add upstream https://github.com/PLACEHOLDER/UtilityWare.git
```

### 3. Create a branch for your changes

Create a descriptive branch name based on the work you're doing.

```bash
git checkout -b add-my-new-tool
```

### 4. Make your changes

Follow the guidelines below (adding a tool, style rules, etc.), then commit your work.

```bash
git add -A
git commit -m "add: <tool-name> — <one-line description>"
git push origin add-my-new-tool
```

### 5. Open a Pull Request

Once your branch has been pushed, open a **Pull Request** from your fork to the **main UtilityWare repository**.

Please include:

- A clear title describing the change.
- A summary of what the change does.
- Why the change should be merged.
- Any relevant screenshots or examples (if applicable).

Before submitting your Pull Request, ensure:

- [ ] Each new tool has its own folder with a `README.md`
- [ ] The tool is executable (`chmod +x`)
- [ ] The category `README.md` has been updated
- [ ] No third-party dependencies unless genuinely needed
- [ ] No telemetry or unnecessary network calls

### 6. Maintainers review

The Fluxware Corporation maintainers will review your Pull Request. During review, we may:

- **Merge** the Pull Request if everything looks good.
- **Request changes** if improvements are needed. Simply push additional commits to the same branch and the Pull Request will update automatically.
- **Close** the Pull Request if it doesn't fit the project's scope or philosophy, with an explanation whenever possible.

Please be patient during review. We appreciate every contribution.

### 7. After merge

Once your Pull Request has been merged, you can sync your fork:

```bash
git checkout main
git pull upstream main
git push origin main
```

## Adding a new tool

1. **Pick the right category.** Browse [`CATEGORIES.md`](./CATEGORIES.md). If your tool genuinely doesn't fit any existing category, open an issue to discuss adding a new one.
2. **Create the folder.** Each tool lives at `<category>/<tool-name>/`.
3. **Add the tool itself.** Use the matching extension:
   - `.sh` for POSIX/Bash shell scripts
   - `.py` for Python 3.6+ tools
4. **Add a `README.md`** in the same folder. Use existing tool READMEs as a reference.
5. **Make the tool executable** (`chmod +x`).
6. **Update the category `README.md`.** Add a one-line entry linking to your tool.

## Style guidelines

- **Small is beautiful.** If a tool grows beyond roughly 150 lines, consider splitting it. (optional)
- **No telemetry or unnecessary network calls** unless networking is the tool's primary purpose (for example, `weather` or `speedtest`).
- **Document dependencies** under a `Requirements` section in the tool's README.
- **Use clear exit codes:**
  - `0` Success
  - `1` Usage error
  - `2` Runtime error
- **Be polite on stderr.** Error messages should begin with the tool name.
- **Match the existing README format** so the repository remains consistent.
- **Author field** in generated tool READMEs should remain `Fluxware Corporation` (this is handled automatically by the generator).

## Reporting bugs

If you find a bug, please open an issue and include:

- The tool name and category
- Your operating system and shell
- The exact command you ran
- The expected output
- The actual output

## Licensing

By contributing, you agree that your contributions will be licensed under the MIT License (see [`LICENSE`](./LICENSE)).

## Code of Conduct

Participation in this project is governed by [`CODE_OF_CONDUCT.md`](./CODE_OF_CONDUCT.md). Please be respectful and help foster a welcoming community.
