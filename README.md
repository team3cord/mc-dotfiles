# MattC's dotfiles  

* This is a repo to keep track of my dotfiles.  Each OS is a branch.  Right now I have an OSX and Linux(Ubuntu) specific branch.  As I experiment with more distros I will add more branches.  
  
* **This is the Linux (Ubuntu) branch.**  
---  

### Linux setup

* git clone target ~/bin/ (repo lives at `~/bin/mc-dotfiles`)
* bash: keep Ubuntu's stock `~/.bashrc` and append one line:
  `[ -f ~/bin/mc-dotfiles/bash/bashrc ] && . ~/bin/mc-dotfiles/bash/bashrc`
* tmux: `ln -s ~/bin/mc-dotfiles/bash/tmux.conf ~/.tmux.conf`
* vim: `ln -s ~/bin/mc-dotfiles/.vim/.vimrc ~/.vimrc`
* nvim: `ln -s ~/bin/mc-dotfiles/.config/nvim ~/.config/nvim`
* vim plugin mngr: vim-plug => mkdir ~/.vim/autoload/ => download vim-plug => vim any file run :PlugInstall => reload vim  
* git: `ln -s ~/bin/mc-dotfiles/gitignore/gitignore_global ~/.gitignore_global` then `git config --global core.excludesFile ~/.gitignore_global`
* KEYCHRON: config/mc_keychron.json

**Prompt:** `host.user[path] $: (branch *+%$<>)$` using git's built-in `__git_ps1` (no install needed).
`*` unstaged · `+` staged · `%` untracked · `$` stash · `<` behind · `>` ahead · `=` in sync

### apt packages

`tmux` · `git` · `vim` · `neovim` · `xclip` (tmux-yank clipboard) · `python3`

### Claude Code + tmux

* `cct ~/proj-a ~/proj-b` — one tmux window per project, each running `claude` (`bash/cct`)
* `cct` re-attaches; `cct -s name …` uses another session; `prefix + C` opens a project from inside tmux
* **Tab colors by Claude state** — `bash/claude-tmux-state` runs from Claude Code hooks and tags each tmux window:
  blue `…` working · yellow `!` needs you · green `✓` done (clears when you visit) · grey idle.
  Hooks live in `~/.claude/settings.json` (SessionStart, UserPromptSubmit, PreToolUse, PostToolUse,
  Notification `permission_prompt|elicitation_dialog`, Stop, SessionEnd), each running
  `~/bin/mc-dotfiles/bash/claude-tmux-state`. Needs `jq`.
* **Claude Code Nord theme:** `claude/themes/nord.json` (works on macOS and Linux)
  `mkdir -p ~/.claude/themes && ln -s ~/bin/mc-dotfiles/claude/themes/nord.json ~/.claude/themes/nord.json`
  then pick **Nord** in `/theme` (or `"theme": "custom:nord"` in `~/.claude/settings.json`)
* **Claude Code hooks (tab colors):** merge `claude/settings.hooks.json` into `~/.claude/settings.json`
  (don't symlink settings.json — Claude rewrites it):
  `jq -s '.[0] * .[1]' ~/.claude/settings.json ~/bin/mc-dotfiles/claude/settings.hooks.json > /tmp/s.json && mv /tmp/s.json ~/.claude/settings.json`
  macOS needs `brew install jq`
* **Nord terminal (GNOME Terminal):** nord-tmux uses the terminal's palette, so load the Nord profile:
  `uuid=$(uuidgen); dconf load /org/gnome/terminal/legacy/profiles:/:$uuid/ < config/nord-gnome-terminal.dconf`
  then add `$uuid` to `org.gnome.Terminal.ProfilesList list` (or pick it in Preferences)
* Cheat sheet: `cstmux` or `cstmx` (tmux + Claude Code, `cheat/cs-tmux.png`)


---  

* TODO's  
    * add in gulpfile & separate bash/js scripts => concat  
    * include all npm packages set up to global  
    * create bash script to setup new workstation  
    * create bash script to setup new server  
    * clean up vimrc  
    * locate all .rc files for current packages/apps  

---  
---

### tmux Setup

**Config:** `bash/tmux.conf` — symlink to `~/.tmux.conf`

**Prefix:** `Ctrl-Space` (replaces backtick; ortholinear-friendly, no vim conflicts)

**Plugin manager:** [TPM](https://github.com/tmux-plugins/tpm)

Install TPM (one time):
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then inside tmux press `prefix + I` to install plugins.

**Plugins:**

| Plugin | Purpose |
|---|---|
| `christoomey/vim-tmux-navigator` | Seamless `Ctrl-hjkl` navigation between vim splits and tmux panes |
| `tmux-plugins/tmux-resurrect` | Save and restore sessions across reboots (`prefix + Ctrl-s` / `prefix + Ctrl-r`) |
| `tmux-plugins/tmux-continuum` | Auto-saves resurrect state every 15 min |
| `tmux-plugins/tmux-yank` | `y` in copy mode sends to the system clipboard (needs xclip) |
| `arcticicestudio/nord-tmux` | Nord color theme for status bar |

**vim-tmux-navigator** also requires these lines in `.vimrc` (already added):
```
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
```

---

### vim / vim-airline

**Plugin manager:** [vim-plug](https://github.com/junegunn/vim-plug)

**Theme:** Nord across the board — colorscheme, airline, tmux all use Nord palette.

- iTerm2 profile: `config/MC_Nord.json`
- vim colorscheme: `arcticicestudio/nord-vim`
- vim-airline theme: `nord`
- tmux status bar: `arcticicestudio/nord-tmux`

---

### herdr Setup

**Config:** `.config/herdr/config.toml` — symlink to `~/.config/herdr/config.toml` (same on macOS and Linux)
```
mkdir -p ~/.config/herdr && ln -sf ~/bin/mc-dotfiles/.config/herdr/config.toml ~/.config/herdr/config.toml
herdr server reload-config
```
**Prefix:** `Ctrl-b` (herdr default; tmux uses `Ctrl-Space`, so no clash). New workspaces prompt for a name.

**Cheat sheet:** `csherdr` → `cheat/cs-herdr.png`

---
