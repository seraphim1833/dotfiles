(require 'package)
(setq package-archives '(
			 ;;("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Don't collect garbage while initialising.
;;(setq gc-cons-threshold most-positive-fixnum)

;;(use-package esup
  ;;:ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
;;:pin melpa)

;;(setq esup-depth 0)

(setq inhibit-startup-echo-area-message "tychoish")
(setq inhibit-startup-message 't)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message 'nil)

(setq inhibit-startup-message t)
;;(setq initial-major-mode 'org-mode)

(recentf-mode 1) ;; Guardar historial de archivos
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; Atajo para abrir archivos recientes

;;	  (use-package undo-tree
;;	    :ensure 1
;;	    :config
;;	    (global-undo-tree-mode 1)
;;	     )

(electric-pair-mode t) ;; Cerrar automáticamente los paréntesis etc

;;(package-vc-install '(ultra-scroll :vc-backend Git :url  "https://github.com/jdtsmith/ultra-scroll"))
  ;;(use-package ultra-scroll
					  ;:load-path "~/code/emacs/ultra-scroll" ; if you git clone'd instead of package-vc-install
    ;;:init
    ;;(setq scroll-conservatively 101 ; important!
;;	  scroll-margin 0) 
  ;;  :config
    ;;(ultra-scroll-mode 1))

;;(custom-theme-set-faces

(use-package nerd-icons)

(set-face-attribute 'default nil
		    :family "Iosevka Fixed Curly Slab"
		    :weight 'medium
		    :height 180)
(set-face-attribute 'fixed-pitch nil
		    :family "Iosevka Fixed Curly Slab"
		    :weight 'medium
		    :height 180)
(set-face-attribute 'variable-pitch nil
		    :family "EB Garamond"
		    :height 1.25)

(setq custom-safe-themes t)

;; Dracula
(use-package dracula-theme)
(load-theme 'dracula :no-confirm)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)
	   )
  )
(setq doom-modeline-buffer-modification-icon nil)
(setq doom-modeline-time-icon t)
(setq doom-modeline-enable-word-count t)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq mode-line-right-align-edge 'right-fringe)
(line-number-mode 0)

(use-package nyan-mode)
(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)
(nyan-mode)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq server-client-instructions nil)
(setq frame-inhibit-implied-resize t)
(setq-default cursor-type '(bar . 3))

(use-package visual-fill-column
  :hook (org-mode . org-appear-mode))
(setq-default visual-fill-column-center-text t)
(setq visual-fill-column-enable-sensible-window-split t)
(use-package adaptive-wrap
  :hook (org-mode . org-appear-mode))

(setq org-hide-emphasis-markers t)

(use-package org-bullets
  :hook (org-mode . org-appear-mode))
(setq-default org-pretty-entities t
	      org-use-sub-superscripts "{}"
	      org-startup-with-inline-images t
	      org-image-actual-width '(300)
	      )
  ;;(font-lock-add-keywords 'org-mode
                          ;;'(("^ *\\([-]\\) "
                             ;;(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (use-package org-appear
    :hook (org-mode . org-appear-mode))
  (setq org-ellipsis "☜")
  ;;      (add-hook 'org-mode-hook
  ;;		(lambda ()
;;  (setq default-text-properties '(line-spacing 0.25 line-height 1.25))
  ;;		  (setq line-spacing 0.25)
  ;;		  (setq default-text-properties line-height 1.25))

(use-package org-faces
  :hook (org-mode . org-appear-mode)
  :ensure nil
  :custom-face
  ;;(org-indent ((nil (:inherit (org-hide fixed-pitch)))))
  ;;(org-block ((nil (:inherit fixed-pitch :foreground nil))))
  (org-checkbox ((nil (:inherit fixed-pitch))))
  (org-block ((nil (:inherit (fixed-pitch) :height 0.8))))
  (org-code ((nil (:inherit (shadow fixed-pitch)))))
  (org-indent ((nil (:inherit (org-hide fixed-pitch)))))
  (org-meta-line ((nil (:inherit (font-lock-comment-face fixed-pitch)))))
  (org-property-value ((nil (:inherit fixed-pitch))))
  (org-special-keyword ((nil (:inherit (font-lock-comment-face fixed-pitch)))))
  (org-table ((nil (:inherit fixed-pitch :foreground "#83a598" :height 0.8))))
  (org-tag ((nil (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  (org-verbatim ((nil (:inherit (shadow fixed-pitch)))))
  (org-block-begin-line ((nil (:inherit fixed-pitch :height 0.8))))
  (org-block-end-line ((nil (:inherit fixed-pitch :height 0.8))))
  (org-list-dt ((nil (:inhetir fixed-pitch))))

  (org-level-8 ((nil (:family "Cormorant SC"))))
  (org-level-7 ((nil (:family "Cormorant SC"))))
  (org-level-6 ((nil (:family "Cormorant SC"))))
  (org-level-5 ((nil (:family "Cormorant SC"))))
  (org-level-4 ((nil (:family "Cormorant SC"))))
  (org-level-3 ((nil (:family "Cormorant SC" :height 1.1))))
  (org-level-2 ((nil (:family "Cormorant SC" :height 1.25))))
  (org-level-1 ((nil (:family "Cormorant SC" :weight black :height 1.7))))
  (org-document-title ((nil (:family "Cormorant SC" :weight black :height 2.0 :underline nil))))
  (org-document-author ((nil (:family "Cormorant SC" :weight black :underline nil))))
  )

(use-package ox-reveal
  :hook (org-mode . org-appear-mode))
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'adaptive-wrap-prefix-mode)
(add-hook 'org-mode-hook 'visual-fill-column-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

(use-package auctex
  :ensure t
  :defer t)
