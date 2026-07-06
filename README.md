# My emacs configuration made with simplicity in mind.
## Packages
### UI / Look & Feel
- **doom-themes** — theme support
- **gruber-darker-theme**, **gruber-darker-themezz**, **gruvbox-theme**, **spacemacs-theme** — additional theme options
- **smart-mode-line** — modeline styling (`sml/theme 'respectful`, `sml/setup`)
- **pulsar** — subtle UI pulse effects
- **nerd-icons** — icon support (tab-line icons)
- **volatile-highlights** — highlight recent changes/yanks

### Completion / Minibuffer UX
- **ivy** — completion UI in minibuffer (`ivy-mode`)
- **corfu** — completion UI (`global-corfu-mode 1`)
- **mono-complete** — monospace completion support/assets

### Editing Enhancements
- **visual-replace** — live visual replace (`visual-replace-global-mode 1`)
- **surround** — surround editing (keybound)
- **yasnippet** — snippet expansion (`yas-global-mode 1`)

### Navigation / Editing Helpers
- **crux** — extra editing commands (keybound)
- **avy** — fast navigation to visible chars
- **goto-line-preview** — enhanced goto-line experience

### Folding
- **yafolding** — code folding (`yafolding-mode 1`, toggle element `C-r`)

### Tabs / Tab Line
- **tab-line-nerd-icons** — tab line UI (enabled via `global-tab-line-mode 1` + `tab-line-nerd-icons-global-mode`)
- **tab-line** (built-in UI) — tab bar behavior (`tab-line-close-button-show 1`)

### Programming / Coding Helpers
- **auto-complete-clang**, **auto-complete-clang-async** — clang-specific completion (present/installed in packages list)
- **recomplete** — present/installed (completion-related)

### Terminal / Integrated Tools
- **vterm** — toggleable terminal (`<f1>` → `vterm-toggle`, `vterm-timer-delay 0.01`)

### Performance / Runtime
- **gcmh** — garbage collection tuning (`gcmh-mode 1`)

## Custom keybindings

### Window / navigation
- `M-o` → `other-window`
- `M-i` → `counsel-imenu`
- `C-M-;` → `avy-goto-char`

### Completion / search / commands
- `C-s` → `swiper`
- `M-x` → `counsel-M-x`
- `C-x C-f` → `counsel-find-file`

### Goto line / navigation
- `M-g M-g` → `goto-line-preview`

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

### Dired keybinding
- `dired` → `F` runs `my-dired-find-file` (opens marked/point file(s))

### Folding
- `C-r` → `yafolding-toggle-element`

### Terminal
- `<f1>` → `vterm-toggle`

### Minor notes (config tweaks)
- Deletes selected text if you start typing: `delete-selection-mode 1`
- Relative line numbers: `display-line-numbers-type 'relative`
- Menu/tool bar + scroll bar disabled
- Compile command: `clang *.c -o out -Wall -Wextra -pedantic -g -O0`
- Compilation window auto-closes on success (via `compilation-exit-autoclose`)
