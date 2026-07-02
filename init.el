;;     ▄▖    ▜                     ▄▖    ▜
;;     ▌ ▛▌▛▌▐ ▀▌▛▘▛▘              ▌ ▛▌▛▌▐ ▀▌▛▘▛▘
;;     ▙▖▙▌▙▌▐▖█▌▄▌▄▌              ▙▖▙▌▙▌▐▖█▌▄▌▄▌

;;                    ▐▘▘                         ▐▘▘
;; █▌▛▛▌▀▌▛▘▛▘  ▛▘▛▌▛▌▜▘▌▛▌    █▌▛▛▌▀▌▛▘▛▘  ▛▘▛▌▛▌▜▘▌▛▌
;; ▙▖▌▌▌█▌▙▖▄▌  ▙▖▙▌▌▌▐ ▌▙▌    ▙▖▌▌▌█▌▙▖▄▌  ▙▖▙▌▌▌▐ ▌▙▌
;;                       ▄▌                          ▄▌


;; CUSTOM FUNCTIONS
;; Testing function
(defun the-best-window-manager()
  (interactive)
  (insert "i3wm")
  )


;; Themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(doom-badger))
 '(custom-safe-themes t)
 '(package-selected-packages
   '(auto-complete-clang auto-complete-clang-async avy buttercup company
			 crux dashboard dimmer doom-themes eat ghostel
			 goto-line-preview gruber-darker-theme
			 gruber-darker-themezz gruvbox-theme helm
			 indent-guide markdown-mode mono-complete
			 multiple-cursors nerd-icons prism pulsar
			 rainbow-delimiters recomplete smart-mode-line
			 smartscan spacemacs-theme surround
			 tab-line-nerd-icons vertico visual-replace
			 volatile-highlights yasnippet)))


;; Setting fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "UKWN" :slant normal :weight medium :height 150 :width normal))))
 '(font-lock-string-face ((t (:foreground "VioletRed4")))))



;; Disable menu and tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)


;; Winner mode
(winner-mode 1)

;; Display line numbers
(global-display-line-numbers-mode 1)
;; Relative numbers
(setq display-line-numbers-type 'relative)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Treat CamelCase as separate words
(global-subword-mode 1)

;; Disable absolutely STUPID error if your line is bigger than 60 simbols AHAHAHAHAHHAHAHAHAHAHAHHAHAHAHAHHAHAHAHAHAHAHHAHAHA
(setq whitespace-line-column 9999)

;;Delete selected text if started typing
(setq delete-selection-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/") t)
(package-initialize)



;; Enable Vertico.
(use-package vertico
  :init
  (vertico-mode))
;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))
;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; ;; Dashboard
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
;; (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))


;; Highlithing mode
(volatile-highlights-mode 1)


;; Dimmer mode
(dimmer-mode 1)

;; Indent bars
;;(indent-bars-mode 1)

;; Whitespace mode
(whitespace-mode 0)

;; Delete selection mode
(delete-selection-mode 1)

;; ;; Multiple cursors
;; (require 'multiple-cursors)

;; Visual replace
(require 'visual-replace)
(visual-replace-global-mode 1)

;; Surround.el
(require 'surround)

;; Auto close
(electric-pair-mode 1)

;; Set default compile command
(setq compile-command "clang *.c -o out -Wall -Wextra -pedantic -g -O0") ;; All warnings, no optimization, puts error if there is unfreed memory.

;;Tab bar
(global-tab-line-mode 1)
(setq tab-line-close-button-show 1)  ;; do not show close button
(tab-line-nerd-icons-global-mode)

;; Nerd icons
(require 'nerd-icons)

;; Helper for compilation. Close the compilation window if
;; there was no error at all. (emacs wiki)
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)


;; Disables beeps
(setq ring-bell-function 'ignore)

;; Company mode completion
(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; Pulsar
(pulsar-global-mode 1)

;; Garbage collection
(gcmh-mode 1)

;; Modline
(setq sml/theme 'dark)
(sml/setup)

;; Snippets
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
(yas-global-mode)

;; Vterm
(setq vterm-timer-delay 0.01) ;; THE BEST SETTING EVER

;; END PACKAGES

;;----------------------KEYBINDINGS---------------------------------------------------------

;;__________________GENERAL KEYBINDINGS___________________________
;;Moving between windows
(global-set-key (kbd "M-o") 'other-window)

;; Add another completion key-bind
(put 'upcase-region 'disabled nil)

;; Compile key-binding
(global-set-key (kbd "C-M-c") 'compile)

(global-set-key (kbd "C-a") 'back-to-indentation)

;;Imenu
(global-set-key (kbd "M-i") 'imenu)


;; Goto line
(global-set-key (kbd "M-g M-g") 'goto-line-preview)

;; avy
(global-set-key (kbd "C-M-;") 'avy-goto-char)

;; ;; Multiple cursors
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; Surround
(global-set-key (kbd "C-q") 'surround-insert)
(global-set-key (kbd "C-S-q") 'surround-change)

;; Delete current buffer
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-k") 'kill-current-buffer)
(global-set-key (kbd "C-z M-k") 'kill-buffer-and-window)

;; Switch to next tab
(global-set-key (kbd "M-l") 'tab-line-switch-to-next-tab)
(global-set-key (kbd "M-h") 'tab-line-switch-to-prev-tab)

;; Disable show buffers
(global-unset-key (kbd "C-x C-b"))

;; Crux ---------------------------------------------------------------
(global-set-key (kbd "C-k") 'crux-smart-kill-line)
(global-set-key (kbd "C-c s") 'crux-sudo-edit)
(global-set-key (kbd "C-<return>") 'crux-smart-open-line)

;;Dired keybindings
(put 'dired-find-alternate-file 'disabled nil)

;; My really usefull keybinding
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-logical-line) (recenter)))
(global-set-key (kbd "M-n") (lambda () (interactive) (next-logical-line) (recenter)))

;; term on F1
(global-set-key (kbd "<f1>") 'vterm-toggle)
