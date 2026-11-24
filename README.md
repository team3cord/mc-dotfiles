# MattC's dotfiles  

* This is a repo to keep track of my dotfiles.  Each OS is a branch.  Right now I have an OSX and Linux(Ubuntu) specific branch.  As I experiment with more distros I will add more branches.  
  
* Added in shell scripts and list of brew & brew cask packages  
---  

* git clone  target ~/bin/  
* ln -s original target vimrc, bashrc, bash_profile, gitconfig, gitignore_global 
* vim plugin mngr: vim-plug => mkdir ~/.vim/autoload/ => download vim-plug => vim any file run :PlugInstall => reload vim  
* iterm2: config/MC_NORD  
* git config --global core.excludesFile ~/.gitignore_global
* KEYCHRON: config/mc_keychron.json

---  

### Homebrew:  

|Formulae         |Casks   |
|-----------------|--------|
|bash-completion  |alfred  |  
|bash-git-prompt  |iterm2  |
|python3          |        |  


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
| `tmux-plugins/tmux-yank` | `y` in copy mode sends to macOS clipboard |
| `arcticicestudio/nord-tmux` | Nord color theme for status bar |

**vim-tmux-navigator** also requires these lines in `.vimrc` (already added):
```
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
```

### Claude Code + tmux

* **Tab colors by Claude state** — `bash/claude-tmux-state` runs from Claude Code hooks and tags each tmux window:
  blue `…` working · yellow `!` needs you · green `✓` done (clears when you visit) · grey idle.
  Needs `brew install jq`. Merge the hooks into `~/.claude/settings.json` (don't symlink it — Claude rewrites it):
  `jq -s '.[0] * .[1]' ~/.claude/settings.json ~/bin/mc-dotfiles/claude/settings.hooks.json > /tmp/s.json && mv /tmp/s.json ~/.claude/settings.json`
* **Claude Code Nord theme:** `claude/themes/nord.json`
  `mkdir -p ~/.claude/themes && ln -s ~/bin/mc-dotfiles/claude/themes/nord.json ~/.claude/themes/nord.json`
  then pick **Nord** in `/theme` (or `"theme": "custom:nord"` in `~/.claude/settings.json`)
* `prefix + C` opens a project path in a new window running `claude`

---

### vim / vim-airline

**Plugin manager:** [vim-plug](https://github.com/junegunn/vim-plug)

**Theme:** Nord across the board — colorscheme, airline, iTerm2, tmux all use Nord palette.

- iTerm2 profile: `config/MC_Nord.json`
- vim colorscheme: `arcticicestudio/nord-vim`
- vim-airline theme: `nord`
- tmux status bar: `arcticicestudio/nord-tmux`

---
