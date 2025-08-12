# Repository Guidelines

## Project Structure & Module Organization
- Root files: `.zshrc`, `.zshenv`, `install.sh`.
- Purpose: opinionated workstation bootstrapping (Zsh + common tooling).
- IDE metadata: `.idea/` is non-essential to install; keep out of changes unless relevant.

## Setup, Test, and Development Commands
- `./install.sh`: provisions packages, configures Zsh/oh-my-zsh, Docker, Helm, Python, Git, and GitHub CLI. Requires Ubuntu/Debian, network access, and `sudo`.
- `sh -n install.sh`: syntax check the script.
- `shellcheck install.sh`: lint for portability and common pitfalls.
- Dry run tip: read through guarded blocks like `which <tool>` and `if [ ! -d ... ]` to ensure idempotence before executing on a fresh machine/VM.

## Coding Style & Naming Conventions
- Shell: keep POSIX `sh` compatible (shebang is `#!/usr/bin/env sh`). Avoid Bash-only features.
- Indent with 2 spaces; wrap long commands thoughtfully with `\` where needed.
- Use explicit checks before installs (pattern in current script: `which <tool>` or path checks).
- Prefer small, composable sections with clear comments. Group related installs.
- File names: dotfiles at repo root (e.g., `.zshrc`, `.zshenv`); provisioning entrypoint remains `install.sh`.

## Testing Guidelines
- Primary: run `sh -n` and `shellcheck` locally.
- Functional: test on a new Ubuntu/Debian VM or container; capture before/after of `zsh --version`, `docker --version`, `gh --version`.
- Idempotence: rerun `./install.sh` to confirm no harmful repeats and graceful skips.

## Commit & Pull Request Guidelines
- Commits: short, imperative subjects (e.g., "Update install.sh", "Add gh package"). Batch related edits.
- PRs: include purpose, OS/version tested, notable changes (e.g., new packages), and any manual steps required after merge. Screenshots not required.

## Security & Configuration Tips
- Sudoers: script appends `NOPASSWD` for the current user; confirm this aligns with your security policy before running on shared systems.
- Remote scripts: oh-my-zsh and installers are fetched via `curl/wget`. Review URLs and verify integrity if modifying.
- Git identity: `install.sh` sets global name/email—adjust before running in multi-user or corporate environments.
