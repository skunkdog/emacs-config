;; -*- lexical-binding: t; -*-
(eval-when-compile (require 'use-package))

;; ▄▖▄▖▖ ▖▄▖▄▖▄▖▖ 
;; ▌ ▙▖▛▖▌▙▖▙▘▌▌▌ 
;; ▙▌▙▖▌▝▌▙▖▌▌▛▌▙▖general

;; Separate custom.el file
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Use-package
(eval-when-compile
  (require 'use-package))

;; Straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Garbage colection
(use-package gcmh
  :straight t
  :config
  (gcmh-mode 1)
  )

;; Compile angel
(use-package compile-angel
  :straight t
  :init
  (setq load-prefer-newer t)
  :config
  (setq compile-angel-verbose t)
  ;; Uncomment the line below to compile automatically when an Elisp file is saved
  (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode) 
  ;; The following directive prevents compile-angel from compiling your init
  ;; files. If you choose to remove this push to `compile-angel-excluded-path-suffixes'
  ;; and compile your pre/post-init files, ensure you understand the
  ;; implications and thoroughly test your code. For example, if you're using
  ;; the `use-package' macro, you'll need to explicitly add:
  ;; at the top of your init file.
  ;;(push "/init.el" compile-angel-excluded-path-suffixes)
  (push "/early-init.el" compile-angel-excluded-path-suffixes)
  ;; A global mode that compiles .el files when they are loaded
  ;; using `load' or `require'.
  (compile-angel-on-save-mode 1)
  )

;; Disables beeps
(setq ring-bell-function 'ignore)

;; Add a key in dired mode
(put 'dired-find-alternate-file 'disabled nil)

;; Vterm
(use-package vterm
  :straight t
  :config
  (setq vterm-timer-delay 0.01)
  )
(use-package vterm-toggle
  :straight t
  :config
  (global-set-key (kbd "<f1>") 'vterm-toggle)
  )


;; ▖▖▄▖
;; ▌▌▐ 
;; ▙▌▟▖ ui

;; Theme
(use-package gruber-darker-theme
  :straight t
  )

;; Font
(add-to-list 'default-frame-alist '(font . "-UKWN-Aporetic Sans Mono-bold-normal-normal-*-17-*-*-*-m-0-iso10646-1"))
(set-frame-font "-UKWN-Aporetic Sans Mono-bold-normal-normal-*-17-*-*-*-m-0-iso10646-1" nil t)

;; Disable menu and tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Display line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode) ;; Lines only in programming
(setq display-line-numbers-type 'relative) ;; Relative

;; Disable scroll bar
(scroll-bar-mode 0)

;; Highlight current line
(global-hl-line-mode 1)

;; Nerd icons
(use-package nerd-icons
  :straight t
  )

;; ;; Tab-line bar
;; (use-package tab-line-nerd-icons
;;   :straight t
;;   :init
;;   (global-tab-line-mode 1)
  
;;   (global-set-key (kbd "M-l") 'tab-line-switch-to-next-tab)
;;   (global-set-key (kbd "M-h") 'tab-line-switch-to-prev-tab)
  
;;   :config
;;   (tab-line-nerd-icons-global-mode) ;; Enable emojies
;;   )

(use-package nyan-mode
  :straight t
  :init
  (setq mode-line-format
	(list
       '(:eval (list (nyan-create)))
       ))
  (setq nyan-animate-nyancat t)
  :config
  (nyan-mode 1)
  )

(use-package minimal-dashboard
  :straight t
  :config
  (setq initial-buffer-choice #'minimal-dashboard)
  (setq server-client-instructions nil)
  )

(use-package dimmer
  :straight t
  :config
  (dimmer-mode 1)
  )


;; ▄▖▄▖▄ ▄▖▖ ▖▄▖
;; ▌ ▌▌▌▌▐ ▛▖▌▌ 
;; ▙▖▙▌▙▘▟▖▌▝▌▙▌coding

(use-package god-mode
  :straight t
  )


;; Visual replace
(use-package visual-replace
  :straight t
  :config
  (visual-replace-global-mode 1)
  )

;; Surround
(use-package surround
  :straight t
  :config
  (global-set-key (kbd "C-q") 'surround-insert)
  (global-set-key (kbd "C-M-q") 'surround-change)
  )

;; YASsnippets
(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1)
  )
(use-package yasnippet-snippets
  :straight t
)

(use-package yafolding
  :straight t
  :config
  (yafolding-mode 1)
  (global-set-key (kbd "C-r") 'yafolding-toggle-element)
  )

(use-package goto-line-preview
  :straight t
  :config
  (global-set-key (kbd "M-g M-g") 'goto-line-preview)
  )

(use-package multiple-cursors
  :straight t
  :config
  (global-set-key (kbd "M-c") 'mc/edit-lines)
  )

(use-package swiper
  :straight t
  :config
  (global-set-key (kbd "C-s") 'swiper)
  )

(use-package magit
  :straight t
  )


;; Treat CamelCase as separate words
(global-subword-mode 1)

;;Delete selected text if started typing
(delete-selection-mode 1)

;; Auto pair
(electric-pair-mode 1)

;; Set default compile command
(setq compile-command "clang *.c -o out -Wall -Wextra -pedantic -g -O0") ;; All warnings, no optimization, debugging.

;; ▄▖▄▖▖  ▖▄▖▖ ▄▖▄▖▄▖▄▖▖ ▖
;; ▌ ▌▌▛▖▞▌▙▌▌ ▙▖▐ ▐ ▌▌▛▖▌
;; ▙▖▙▌▌▝ ▌▌ ▙▖▙▖▐ ▟▖▙▌▌▝▌completion

;; Enable Vertico.
(use-package vertico
  :straight t
  :init
  (vertico-mode))
;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))
;; Optionally use the `orderless' completion style.
(use-package orderless
  :straight t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring
;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

(use-package corfu
  :straight t
  :config
  (global-corfu-mode 1)
  )

;; ▖▖▄▖▖▖  ▄ ▄▖▖ ▖▄ ▄▖▖ ▖▄▖▄▖
;; ▙▘▙▖▌▌▄▖▙▘▐ ▛▖▌▌▌▐ ▛▖▌▌ ▚ 
;; ▌▌▙▖▐   ▙▘▟▖▌▝▌▙▘▟▖▌▝▌▙▌▄▌

;; Other window
(global-set-key (kbd "M-o") 'other-window)

;; Compile
(global-set-key (kbd "C-M-c") 'compile)

;; Not to the start of the line but to indentatation
(global-set-key (kbd "C-a") 'back-to-indentation)

;; Delete current buffer
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-k") 'kill-current-buffer)
(global-set-key (kbd "C-z M-k") 'kill-buffer-and-window)

;; Disable unnesesary functions
(global-unset-key (kbd "C-x C-d"))
(global-unset-key (kbd "C-x f"))

;; Comfortable reading through code
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-logical-line) (recenter)))
(global-set-key (kbd "M-n") (lambda () (interactive) (next-logical-line) (recenter)))
(global-set-key (kbd "M-[") (lambda () (interactive) (backward-paragraph) (recenter)))
(global-set-key (kbd "M-]") (lambda () (interactive) (forward-paragraph) (recenter)))

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Imenu
(global-set-key (kbd "M-i") 'imenu)

