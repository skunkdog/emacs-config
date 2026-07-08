# My emacs configuration made with simplicity in mind.
## Packages:
### UI / Look & Feel
- **doom-themes** — theme support
- **gruber-darker-theme**, **gruber-darker-themezz**, **gruvbox-theme**, **spacemacs-theme** — additional theme options
- **smart-mode-line** — modeline styling (`sml/theme 'respectful`, `sml/setup`)
- **pulsar** — subtle UI pulse effects
- **nerd-icons** (+ **nerd-icons-corfu**) — icon support (tab line icons)
- **minimal-dashboard** — minimal dashboard UI
- **volatile-highlights** — highlight recent changes/yanks
- **display-time** (built-in) — show current time (`display-time-mode`)

### Completion / Minibuffer UX
- **ivy** — completion UI in minibuffer (`ivy-mode`, `search-default-mode #'char-fold-to-regexp`)
- **corfu** — completion UI (`global-corfu-mode 1`)
- **mono-complete** — monospace completion support/assets
- **zig-mode** — Zig language support

### Editing Enhancements
- **visual-replace** — live visual replace (`visual-replace-global-mode 1`)
- **surround** — surround editing (keybound)
- **yasnippet** — snippet expansion (`yas-global-mode 1`)

### Navigation / Editing Helpers
- **crux** — extra editing commands (keybound)
- **avy** — fast navigation to visible chars
- **goto-line-preview** — enhanced goto-line experience
- **multiple-cursors** — multi-cursor editing (`mc/edit-lines`)

### Language / Programming
- **prism** — syntax highlighting enhancements
- **indent-guide** — indent guides
- **markdown-mode** — markdown editing
- **magit** — git integration
- **zig-mode** — Zig editing

### Terminal / Integrated Tools
- **vterm** — toggleable terminal (`<f1>` → `vterm-toggle`, `vterm-timer-delay 0.01`)

### Tabs / Tab Line
- **tab-line-nerd-icons** — tab line UI (`global-tab-line-mode 1` + `tab-line-nerd-icons-global-mode`)

### Folding
- **yafolding** — code folding (`yafolding-mode 1`, toggle element `C-r`)

### Performance / Runtime
- **gcmh** — garbage collection tuning (`gcmh-mode 1`)
- **winner-mode** (built-in) — window history management (`winner-mode 1`)

## Custom keybindings

### Window / navigation
- `M-o` → `other-window`
- `M-p` → previous logical line + recenter
- `M-n` → next logical line + recenter

### Completion / search / commands
- `C-s` → `swiper`
- `M-x` → `counsel-M-x`
- `C-x C-f` → `counsel-find-file`
- `M-i` → `counsel-imenu`

### Goto line / navigation
- `M-g M-g` → `goto-line-preview`
- `C-M-;` → `avy-goto-char`

### Completion / compile
- `C-M-c` → `compile`
- `C-a` → `back-to-indentation`

### Multiple cursors
- `C-S-c C-S-c` → `mc/edit-lines`

### Surround editing
- `C-q` → `surround-insert`
- `C-S-q` → `surround-change`

### Kill / buffer management
- `C-z C-k` → `kill-current-buffer`
- `C-z M-k` → `kill-buffer-and-window`

### Tabs
- `M-l` → `tab-line-switch-to-next-tab`
- `M-h` → `tab-line-switch-to-prev-tab`

### Crux (extra commands)
- `C-k` → `crux-smart-kill-line`
- `C-c s` → `crux-sudo-edit`
- `C-<return>` → `crux-smart-open-line`

### Dired behavior
- `dired` → `F` runs `my-dired-find-file` (opens marked/point file(s))
  - (also: `my-dired-find-file` uses `dired-get-marked-files` + `find-file`)

### Folding
- `C-r` → `yafolding-toggle-element`

### Terminal
- `<f1>` → `vterm-toggle`

### Minor notes (not keybindings, but keymap/config-related tweaks)
- `(put 'upcase-region 'disabled nil)` enables `upcase-region` behavior
- Relative line numbers in relative mode:
  - `prog-mode-hook` → `display-line-numbers-mode`
  - `setq display-line-numbers-type 'relative`
- Deletes selected text if started typing: `delete-selection-mode 1`
- Menu/tool bar + scroll bar disabled
- Compilation window auto-closes on success (via `compilation-exit-autoclose`)
- Disable server-client instructions: `(setq server-client-instructions nil)`
