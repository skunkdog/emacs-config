;; -*- lexical-binding: t; -*-

;;; Package management
(eval-when-compile
  (require 'use-package))

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


;;; General configuration
(global-unset-key (kbd "C-z"))

(setq ring-bell-function #'ignore)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory
 (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)

(setq auto-save-list-file-prefix
      (expand-file-name
       "tmp/auto-saves/sessions/"
       user-emacs-directory)

      auto-save-file-name-transforms
      `((".*"
         ,(expand-file-name "tmp/auto-saves/" user-emacs-directory)
         t)))

(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default compile-command "")

(global-set-key (kbd "M-!") #'eshell-command)
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-M-c") #'compile)

(global-set-key
 (kbd "M-p")
 (lambda ()
   (interactive)
   (previous-logical-line)
   (recenter)))

(global-set-key
 (kbd "M-n")
 (lambda ()
   (interactive)
   (next-logical-line)
   (recenter)))

(global-set-key
 (kbd "M-[")
 (lambda ()
   (interactive)
   (backward-paragraph)
   (recenter)))

(global-set-key
 (kbd "M-]")
 (lambda ()
   (interactive)
   (forward-paragraph)
   (recenter)))

(global-unset-key (kbd "C-x C-c"))

(recentf-mode 1)
(global-set-key (kbd "C-x C-b") #'recentf)

(tab-bar-mode 1)
(global-set-key (kbd "M-<return>") #'tab-switch)
(global-set-key (kbd "C-z C-n") #'tab-next)
(global-set-key (kbd "C-z C-p") #'tab-previous)
(global-set-key (kbd "C-z n") #'tab-new)
(global-set-key (kbd "C-z k") #'tab-close)
(global-set-key (kbd "C-z 0") #'tab-close)

(global-set-key (kbd "C-z b s") #'bookmark-set)
(global-set-key (kbd "C-z b j") #'consult-bookmark)

;;; Interface

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message t
      display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)


;;; Dired

(setq dired-listing-switches
      (if (executable-find "gls")
          (mapconcat
           #'identity
           '("-l"
             "-b"
             "--all"
             "--human-readable"
             "--group-directories-first"
             "--no-group")
           " ")
        dired-listing-switches))

(put 'dired-find-alternate-file 'disabled nil)

;;; Org
(add-hook
 'org-mode-hook
 (lambda ()
   (local-set-key (kbd "M-h") #'org-metaleft)
   (local-set-key (kbd "M-l") #'org-metaright)))

;;; Packages

(use-package listen
  :straight t
  )

(use-package otpp
  :straight t
  :after project
  :init
  ;; Enable `otpp-mode` globally
  (otpp-mode 1)
  ;; If you want to advice the commands in `otpp-override-commands`
  ;; to be run in the current's tab (so, current project's) root directory
  (otpp-override-mode 1))

(use-package god-mode
  :straight t
  :bind
  (("C-;" . god-mode-all))
  )

(use-package vterm
  :straight t
  )

(use-package crux
  :straight t
  :commands
  (crux-reopen-as-root
   crux-sudo-edit))


(use-package bible-mode
  :straight (:host github
             :repo "Zacalot/bible-mode")
  :mode "\\.bible\\'")


(use-package markdown-mode
  :straight t
  :mode ("\\.md\\'" . markdown-mode))


;; (use-package hide-mode-line
;;   :straight t
;;   :defer t
;;   :init
;;   (add-hook 'after-init-hook #'global-hide-mode-line-mode))


;;; Themes
(use-package distinguished-theme
  :straight t
  :defer t)

(use-package kusanagi-theme
  :straight t
  :defer t)

(use-package doom-themes
  :straight t
  :defer t)

(use-package real-mono-themes
  :straight t
  :defer t)

(use-package soothe-theme
  :straight t
  :defer t)

(use-package hemisu-theme
  :straight t
  :defer t)

(use-package ef-themes
  :straight t
  :defer t)

(use-package tao-theme
  :straight t
  :defer t)

(use-package cybercafe-theme
  :straight t
  :defer t)

;;; Icons

(use-package nerd-icons
  :straight t
  :defer t)

(use-package all-the-icons
  :straight t
  :defer t)

;;; Development tools
(use-package magit
  :straight t
  :commands
  (magit-status
   magit-project-status)
  :bind
  (("C-c g" . magit-status)))


(use-package surround
  :straight t
  :commands
  (surround-insert
   surround-change)
  :bind
  (("C-q" . surround-insert)
   ("C-z C-q" . surround-change))
  )


(use-package multiple-cursors
  :straight t
  :commands mc/edit-lines
  :bind
  (("M-c" . mc/edit-lines)))


(use-package devdocs
  :straight t
  :commands devdocs-lookup
  :bind
  (("C-h D" . devdocs-lookup))
  )


(use-package vimish-fold
  :straight t
  :config
  (vimish-fold-global-mode 1)
    :bind
  (("C-<return>" . vimish-fold-toggle))
  )

(use-package yasnippet
  :straight t
  :commands
  (yas-minor-mode
   yas-global-mode))


(use-package yasnippet-snippets
  :straight t
  :after yasnippet)


(use-package which-key
  :straight t
  :defer 1
  :config
  (which-key-mode 1))

;;; Completion

(use-package vertico
  :straight t
  :defer t
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 20)
  (vertico-resize t)
  (vertico-cycle nil)
  :init
  (add-hook 'after-init-hook #'vertico-mode)
  (add-hook 'after-init-hook #'vertico-indexed-mode)
  )

;; ;; Persist history over Emacs restarts. Vertico sorts by history position.
;; (use-package savehist
;;   :init
;;   (savehist-mode))

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

(use-package orderless
  :straight t
  :defer t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides
   '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :straight t
  :defer t
  :bind
  (:map minibuffer-local-map
        ("M-A" . marginalia-cycle))
  :init
  (add-hook 'after-init-hook #'marginalia-mode)
  )


(use-package consult
  :straight t
  :commands
  (consult-man
   consult-goto-line
   consult-line
   consult-yank-from-kill-ring
   consult-ripgrep
   consult-imenu
   consult-buffer)
  :bind
   (("C-h C-m" . consult-man)
   ("M-g"     . consult-goto-line)
   ("C-s"     . consult-line)
   ("M-y"     . consult-yank-from-kill-ring)
   ("C-r"     . consult-ripgrep)
   ("M-i"     . consult-imenu)
   ("C-x b"   . consult-buffer)
   ("C-x C-f" . find-file-at-point)
   ("C-c f"   . consult-flymake)
   ))

(use-package embark
  :straight t
  :bind
  (("C-z e" . embark-act))
  )

(use-package embark-consult
  :straight t
  )

(use-package corfu
  :straight t
  :bind
  (:map corfu-map
        ("M-<return>" . corfu-insert-separator))
  :init
  (setopt corfu-auto t
	  corfu-auto-delay 0.2
	  corfu-auto-prefix 2
	  corfu-border-width 7
	  tab-always-indent 'complete)
  (add-hook 'after-init-hook #'global-corfu-mode))


;; ;;; EXWM

;; (use-package exwm
;;   :straight t
;;   :config
;;   (setq exwm-workspace-number 4)

;;   (add-hook
;;    'exwm-update-class-hook
;;    (lambda ()
;;      (exwm-workspace-rename-buffer exwm-class-name)))

;;   (setq exwm-input-global-keys
;;         `(([?\s-d]
;;            . (lambda ()
;;                (interactive)
;;                (start-process "dmenu" nil "dmenu_run")))

;;           ([?\s-g] . exwm-outer-gaps-mode)
;;           ([?\s-p] . exwm-outer-gaps-increment)
;;           ([?\s-y] . exwm-outer-gaps-decrement)

;;           ([?\s-r] . exwm-reset)
;;           ([?\s-w] . exwm-workspace-switch)

;;           ([?\s-&]
;;            . (lambda (cmd)
;;                (interactive
;;                 (list (read-shell-command "$ ")))
;;                (start-process-shell-command cmd nil cmd)))

;;           ,@(mapcar
;;              (lambda (i)
;;                `(,(kbd (format "s-%d" i))
;;                  . (lambda ()
;;                      (interactive)
;;                      (exwm-workspace-switch-create ,i))))
;;              (number-sequence 0 9))))
;;   :init
;;   (exwm-wm-mode 1)
;;   )


;; (use-package exwm-outer-gaps
;;   :straight (:host github
;;              :repo "skunkdog/exwm-outer-gaps")
;;   :after exwm
;;   :init
;;   (add-hook 'exwm-init-hook #'exwm-outer-gaps-mode))

;;; My functions

(defun my/switch-to-eww ()
  "Switch to an existing EWW buffer, or create one if none exists."
  (interactive)
  (if-let* ((eww-buffer
             (seq-find
              (lambda (buffer)
                (with-current-buffer buffer
                  (derived-mode-p 'eww-mode)))
              (buffer-list))))
      (switch-to-buffer eww-buffer)
    (call-interactively #'eww)))
(global-set-key (kbd "C-z s e") #'my/switch-to-eww)


(defvar vocab-file-location
  (expand-file-name "~/orgs/french/french.org")
  "File where vocabulary words are stored.")

(defun my/vocab-add (word translation)
  "Add WORD and TRANSLATION to `vocab-file-location'."
  (interactive
   (list
    (read-string "Word: ")
    (read-string "Translation: ")))
  (make-directory (file-name-directory vocab-file-location) t)
  (with-temp-buffer
    (insert " - [ ] " word " - " translation "\n")
    (append-to-file
     (point-min)
     (point-max)
     vocab-file-location)))
(global-set-key (kbd "C-z v a") #'my/vocab-add)

(defun bury-compile-buffer-if-successful (buffer string)
 "Bury a compilation buffer if succeeded without warnings "
 (when (and
         (buffer-live-p buffer)
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         (not
          (with-current-buffer buffer
            (goto-char (point-min))
            (search-forward "warning" nil t))))
    (run-with-timer 0 nil
                    (lambda (buf)
                      (bury-buffer buf)
                      (switch-to-prev-buffer (get-buffer-window buf) 'kill))
                    buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

;;; Custom file
(setq custom-file
      (locate-user-emacs-file "custom.el"))

(when (file-exists-p custom-file)
   (load custom-file))
(kill-matching-buffers-no-ask "")
