;; -*- lexical-binding: t; -*-

(toggle-frame-fullscreen)

;;; {{{ Package managers
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

(toggle-frame-fullscreen)
;;;}}}

;;; {{{ General configuration

;; Buffers revert when modified
(global-auto-revert-mode 1)

;; Doc-view disable tool-tip
(tooltip-mode 0)

(global-set-key (kbd "M-i") 'imenu)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z p") 'ff-find-related-file)
(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-j") 'man)
(setopt ring-bell-function #'ignore)

(setopt backup-directory-alist
      `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory
 (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)

(setopt auto-save-list-file-prefix
      (expand-file-name
       "tmp/auto-saves/sessions/"
       user-emacs-directory)

      auto-save-file-name-transforms
      `((".*"
         ,(expand-file-name "tmp/auto-saves/" user-emacs-directory)
         t)))

(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default compile-command "make clean all")

(global-set-key (kbd "M-o") #'other-window)

(global-unset-key (kbd "C-x C-c"))

(recentf-mode 1)


(setq-default indent-tabs-mode nil)
;; (add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'before-save-hook #'whitespace-cleanup)

;;; }}}

;;; {{{ Interface

;; Display time at  the bar
(display-time-mode 1)

(use-package moody
  :straight t
  :config
  (setopt moody-mode-line-height 30)
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  )

(use-package spacious-padding
  :straight t
  :config
  (spacious-padding-mode 1)
  )

;; Mode line at the top
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)



(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setopt inhibit-splash-screen t)

(setopt display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;;; }}}

;;; {{{ Dired

(setopt dired-listing-switches
          (mapconcat
           #'identity
           '("-l"
             "-b"
             "-a"
             "--human-readable"
             "--group-directories-first"
             "--no-group")
           " ")
        )

(put 'dired-find-alternate-file 'disabled nil)
;;; }}}

;;;}}}

;;; {{{ Packages

(use-package yafolding
  :straight t
  :custom
  (add-hook 'prog-mode-hook #'yafolding-mode)
  :bind
  (("C-z C-f" . yafolding-toggle-element))
  )


(use-package speed-type
  :straight t
  :defer
  )

(use-package hide-mode-line
  :straight t
  :defer
  :bind
  (("C-z m" . hide-mode-line-mode))
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

;;; Themes
(use-package foxglove-themes
  :straight (:host gitlab
             :repo "vegasharmon/foxglove-themes")
  )
(use-package doom-themes
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
   ("C-z c" . surround-change))
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

(use-package yasnippet
  :straight t
  :commands
  (yas-minor-mode
   yas-global-mode)
  :init
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets
  :straight t
  :after yasnippet)

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

(use-package consult
  :straight t
  :bind
  (
   ("M-i" . consult-imenu)
   ("C-x b" . consult-buffer)
   ("C-x p b" . consult-project-buffer)
   )
  )

;;; }}}

;; {{{ EXWM

(use-package exwm-outer-gaps
  :straight (:host github
             :repo "skunkdog/exwm-outer-gaps")
  :after exwm
  :init
  (add-hook 'exwm-init-hook #'exwm-outer-gaps-mode))

(use-package exwm
  :straight t
  :config
  (setopt exwm-workspace-number 4)

  (add-hook
   'exwm-update-class-hook
   (lambda ()
     (exwm-workspace-rename-buffer exwm-class-name)))

  (setq exwm-input-simulation-keys
      '(([?\C-b] . [left])
        ([?\C-f] . [right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])))

  (setopt exwm-input-global-keys
          `(
            ([?\s-g] . exwm-outer-gaps-mode)
            ([?\s-p] . exwm-outer-gaps-increment)
            ([?\s-y] . exwm-outer-gaps-decrement)

            ([?\s-r] . exwm-reset)
            ([?\s-w] . exwm-workspace-switch)

            ([?\s-d]
             . (lambda (cmd)
              (interactive
                  (list (read-shell-command "$ ")))
              (start-process-shell-command cmd nil cmd)))

            ,@(mapcar
               (lambda (i)
              `(,(kbd (format "s-%d" i))
                   . (lambda ()
                       (interactive)
                       (exwm-workspace-switch-create ,i))))
               (number-sequence 0 9))))
  :init
  (exwm-wm-mode 1)
  )

(use-package exwm-edit
  :straight t
  :config
  ;; Edit text in an *exwm-edit* buffer
  (add-to-list 'exwm-input-global-keys '([?\C-c ?\'] . exwm-edit--compose))

  ;; You can use hooks to, e.g., set desired mode:
  (defun ag-exwm/on-exwm-edit-compose ()
    (funcall 'org-mode))

  (add-hook 'exwm-edit-compose-hook 'ag-exwm/on-exwm-edit-compose)
  )

;; }}}


;;; {{{ My functions

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

;;; Custom file
(setopt custom-file
      (locate-user-emacs-file "custom.el"))

(when (file-exists-p custom-file)
  (load custom-file)
  )
