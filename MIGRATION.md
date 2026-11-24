# Migration plan: one branch, OS-aware dotfiles

**Status:** planned, not started (written 2026-11-23)

## Why

Today the repo has one branch per OS: `OSX`, `linux`, and `main` as a "super OSX" branch. That causes:

- **Manual porting.** Every shared change (vimrc, tmux, Claude Code setup) has to be copied between branches by hand, and `main` falls behind. Example: the Claude tab-color and Nord theme work landed on `linux` and `OSX` but not `main`.
- **Drift.** `linux` went untouched from Jan 2024 to Nov 2026 and fell far behind OSX.
- **Branch switches swap live config.** The dotfiles are symlinked and sourced from the checkout (`~/.bashrc` sources `bash/bashrc`, `~/.tmux.conf` → `bash/tmux.conf`), so `git switch` changes the running machine's config instantly.

Branches are for work that merges back, not for permanent variants.

## Target layout

A single branch, `main`. Shared files stay shared, and OS-specific parts load based on `uname`.

| File | Today | After |
|---|---|---|
| `bash/bashrc` | brew + bash-git-prompt (OSX) vs `__git_ps1` (linux) | shared core + `case "$(uname)" in Darwin) … ;; Linux) … ;; esac` for brew/apt paths, completion, `ls` colors. Both use `__git_ps1` (also fixes the OSX PS1 double-quote bug, where `$(__git_ps1)` only ran at startup) |
| `bash/alias` | `open` vs `xdg-open`, `flush`, `vhost`, `brewup`/`aptup`, `ht` (MAMP), `ds` | shared `alias` + `alias.darwin` / `alias.linux`, sourced by OS. Option: `op()` function wrapping `open`/`xdg-open` so cheat-sheet aliases stay shared |
| `bash/tmux.conf` | differs by 3 lines (`default-terminal`, nord no-patched-font, yank comment) | shared file + `if-shell 'uname \| grep -q Darwin' 'source ~/bin/mc-dotfiles/bash/tmux.darwin.conf' 'source ~/bin/mc-dotfiles/bash/tmux.linux.conf'` |
| `.vim/.vimrc`, `.config/nvim`, `claude/`, `bash/claude-tmux-state`, `bash/cct`, `gitignore/`, `cheat/` | duplicated per branch | one copy |
| `cheat/cs-tmux.png` | light Mac sheet (OSX) vs dark Claude+tmux sheet (linux) | keep the linux one (it's a superset: Ctrl-Space + plugins + Claude) |
| `config/` | iTerm2 + Keychron (OSX), GNOME Terminal Nord profile (linux) | all in `config/`; each OS uses its own |
| `py/start_coto`, `py/start_nj` | OSX only (`open /Applications/...`) | keep; macOS-only launchers, harmless on Linux |

### New pieces

- **`~/.bashrc.local`** (untracked): per-machine overrides, sourced last by `bash/bashrc` if present. Covers "Mac A differs from Mac B" without branches.
- **`install.sh`**: detects the OS, then:
  - symlinks `~/.tmux.conf`, `~/.vimrc`, `~/.vim/.vimrc`, `~/.config/nvim`, `~/.gitignore_global`, `~/.claude/themes/nord.json`
  - appends the source line to `~/.bashrc` (Linux) or links `bash_profile` (macOS)
  - merges `claude/settings.hooks.json` into `~/.claude/settings.json` with `jq` (never symlink settings.json, because Claude rewrites it)
  - installs packages: `brew` (tmux, jq, bash-completion) or `apt` (tmux, jq, xclip/wl-clipboard)
  - clones TPM and vim-plug, then runs `nvim --headless +'PlugInstall --sync' +qa` and `~/.tmux/plugins/tpm/bin/install_plugins`
  - sets git `core.excludesFile`
  - Linux: optionally loads `config/nord-gnome-terminal.dconf`
  - idempotent: safe to re-run

## Steps

1. **Archive.** Tag the current tips so nothing is lost:
   `git tag archive/osx github/OSX && git tag archive/linux github/linux && git push github --tags`
2. **Bring main up to date.** `git merge OSX` into `main` (brings the Claude tab colors and Nord theme).
3. **Pull in Linux-only files** from `linux`: `config/nord-gnome-terminal.dconf`, the dark `cheat/cs-tmux.png`, and the Linux versions of bashrc/alias as the starting point for the OS split.
4. **Split the differing files** into shared + `darwin` / `linux` parts (table above).
5. **Add `install.sh`** and `~/.bashrc.local` support. Update the README: drop "each OS is a branch", document `install.sh`.
6. **Test on Linux** (mc-ubuntu-dell). Do it in a separate worktree first, never by switching the live checkout. Check:
   - prompt shows branch/status (`(main *%>)`)
   - aliases (`cstmux`, `aptup`, `clprj`, …)
   - tmux loads with Ctrl-Space, Nord, plugins
   - Claude tab colors (blue/yellow/green) via `cct`
   - Claude Nord theme
7. **Push `main`**, then point this machine's checkout at it: `git switch main`.
8. **Test on a Mac:** `git fetch && git switch main && ./install.sh`, then the same checks (iTerm2 Nord, brew paths, `open`).
9. **Clean up** once both OSes work: delete remote `OSX` and `linux` branches (tags keep the history):
   `git push github --delete OSX linux`

## Later, if needed

- **chezmoi**: per-OS/per-machine templates and encrypted secrets (API keys, work vs personal git email). Worth it with many machines or secrets.
- **yadm**: lighter, with alternate files by suffix (`tmux.conf##os.Darwin`).
- Plain `uname` checks are enough for now. Add a tool only when they start to hurt.

## Notes

- Remote is named `github` (not `origin`). Clone with `git clone -o github git@github.com:team3cord/mc-dotfiles.git ~/bin/mc-dotfiles`.
- Global git identity: `team3cord <matthew3cord@gmail.com>`.
