# My emacs configuration made with simplicity in mind.
# Packages:
## UI / Look & Feel
- **doom-themes** — theme support
- **gruber-darker-theme**, **gruber-darker-themezz**, **gruvbox-theme**, **spacemacs-theme** — additional theme options
- **smart-mode-line** — modeline styling (`sml/setup`)
- **pulsar** — subtle UI pulse effects
- **dimmer** — dim inactive windows/buffers (Disabled because of the bag in new version)
- **tab-line-nerd-icons** + **nerd-icons** — icon tab line (`tab-line-nerd-icons-global-mode`)
- **volatile-highlights** — highlight recent changes/yanks

## Completion / Minibuffer UX
- **vertico** — completion UI in minibuffer

## Editing Enhancements
- **visual-replace** — live visual replace (`visual-replace-global-mode`)
- **surround** — surround editing (also keybound)
- **yasnippet** — snippet expansion (global)
- **crux** — extra editing commands (also keybound)
- **avy** — fast navigation to visible chars
- **goto-line-preview** — enhanced goto-line experience
- **rainbow-delimiters** — delimiter coloring
- **indent-guide** — indent guides
- **smartscan** — scanning/highlighting support
- **prism** — syntax highlighting enhancements
- **mono-complete** — monospace completion support/assets
- **electric-pair-mode** (built-in) — auto-pairs

## Programming / Coding Helpers
- **company** — code completion backend/UI (`global-company-mode`)
- **auto-complete-clang**, **auto-complete-clang-async** — clang-specific completion (present/installed)
- **recomplete** — present/installed (completion-related)
- **smart-mode-line** (already above) — used while coding

## Terminal / Integrated Tools
- **vterm** — toggleable terminal (`<f1>` → `vterm-toggle`)

## Performance / Runtime
- **gcmh** — garbage collection tuning (`gcmh-mode 1`)
# Custom keybindings

### Window / navigation
- `M-o` → `other-window`
- `M-i` → `imenu`
- `M-g M-g` → `goto-line-preview`
- `M-p` → previous logical line + recenter
- `M-n` → next logical line + recenter

### Completion / compile
- `C-M-c` → `compile`
- `C-a` → `back-to-indentation`

### Jump
- `C-M-;` → `avy-goto-char`

### Surround editing
- `C-q` → `surround-insert`
- `C-S-q` → `surround-change`

### Kill / buffer management
- `C-z C-k` → `kill-current-buffer`
- `C-z M-k` → `kill-buffer-and-window`

### Tabs
- `M-l` → `tab-line-switch-to-next-tab`
- `M-h` → `tab-line-switch-to-prev-tab`

### Dired / buffer list behavior
- `C-x C-b` → (unset) (disable show buffers)

### Crux (extra commands)
- `C-k` → `crux-smart-kill-line`
- `C-c s` → `crux-sudo-edit`
- `C-<return>` → `crux-smart-open-line`

### Terminal
- `<f1>` → `vterm-toggle`

### Minor notes (not a keybindings, but a keymap-related tweak)
- `(put 'upcase-region 'disabled nil)` enables `upcase-region` behavior by un-disabling it.
