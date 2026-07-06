;;-*- lexical-binding: t; -*-
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
   '(auto-complete-clang auto-complete-clang-async avy buttercup corfu
			 counsel crux dashboard doom-themes eat
			 ghostel goto-line-preview gruber-darker-theme
			 gruber-darker-themezz gruvbox-theme helm
			 indent-guide ivy markdown-mode mono-complete
			 multiple-cursors nerd-icons nerd-icons-corfu
			 pdf-tools prism pulsar rainbow-delimiters
			 recomplete smart-mode-line smartscan
			 spacemacs-theme surround swiper
			 tab-line-nerd-icons visual-replace
			 volatile-highlights yafolding yasnippet)))

;; Setting fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "UKWN" :slant normal :weight medium :height 150 :width normal)))))

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

;; Highlithing mode
(volatile-highlights-mode 1)

;; Whitespace mode
(whitespace-mode 0)

;; Delete selection mode
(delete-selection-mode 1)

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

;;Ivy completion
(ivy-mode)
(setopt search-default-mode #'char-fold-to-regexp)


;; Pulsar
(pulsar-global-mode 1)

;; Garbage collection
(gcmh-mode 1)

;; Modline
(setq sml/theme 'respectful)
(sml/setup)

;; Snippets
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
(yas-global-mode)

;; Vterm
(setq vterm-timer-delay 0.01) ;; THE BEST SETTING EVER

;; Corfu completion
(global-corfu-mode 1)

;; Folding
(yafolding-mode 1)

;; OPEN MULTIPLE FILES IN DIRED
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "F" 'my-dired-find-file)
     (defun my-dired-find-file (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))


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


;; Goto line
(global-set-key (kbd "M-g M-g") 'goto-line-preview)

;; avy
(global-set-key (kbd "C-M-;") 'avy-goto-char)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

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
(global-unset-key (kbd "C-x C-d"))
(global-unset-key (kbd "C-x f"))


;; Crux
(global-set-key (kbd "C-k") 'crux-smart-kill-line)
(global-set-key (kbd "C-c s") 'crux-sudo-edit)
(global-set-key (kbd "C-<return>") 'crux-smart-open-line)

;;Dired keybindings
(put 'dired-find-alternate-file 'disabled nil)

;; My really usefull keybinding
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-logical-line) (recenter)))
(global-set-key (kbd "M-n") (lambda () (interactive) (next-logical-line) (recenter)))

;; Vterm
(global-set-key (kbd "<f1>") 'vterm-toggle)

;; Swiper (better search)
(global-set-key (kbd "C-s") 'swiper)
(keymap-global-set "M-x" #'counsel-M-x)
(keymap-global-set "C-x C-f" #'counsel-find-file)
(global-set-key (kbd "M-i") 'counsel-imenu)

;; Folding
(global-set-key (kbd "C-r") 'yafolding-toggle-element)
