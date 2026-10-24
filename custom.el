;;; -*- lexical-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-gruvbox))
 '(custom-safe-themes t)
 '(dimmer-fraction 0.2)
 '(dired-listing-switches "-l -a")
 '(display-line-numbers-grow-only t)
 '(display-line-numbers-width nil)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(eshell-buffer-name "Terminal")
 '(org-modern-star 'replace)
 '(spacious-padding-mode t)
 '(spacious-padding-widths
   '(:internal-border-width 20 :header-line-width 2 :mode-line-width 6
                            :custom-button-width 3 :tab-width 4
                            :right-divider-width 30 :scroll-bar-width
                            8 :fringe-width 8))
 '(whitespace-line-column 150))

;; (set-frame-font
;;  (font-spec
;;   :family "Iosevka"
;;   :weight 'bold
;;   :slant 'oblique
;;   :size 19)
;;  nil t)

;; (set-frame-font
;;  (font-spec
;;   :family "Vulf mono"
;;   :weight 'bold
;;   :size 19)
;;  nil t)


(set-frame-font
 (font-spec
  :family "Aporetic Sans Mono"
  :weight 'bold
  :size 19)
 nil t)

;; (set-frame-font "-PfEd-Spleen 32x64-medium-normal-normal-*-23-*-*-*-m-0-iso10646-1" nil t)
;; (set-frame-font "-Adobe-New Century Schoolbook-bold-normal-normal-*-19-*-*-*-*-113-iso10646-1" nil t)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:height 1.3 :weight bold))))
 '(org-level-2 ((t (:height 1.2 :weight bold))))
 '(org-level-3 ((t (:height 1.1 :weight bold)))))
