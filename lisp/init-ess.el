;;; init-ess.el --- Support for ess with R configuration
;;; Commentary:

;;; Code:

(use-package ess
  :init
  (setq ess-style 'RStudio)
  :mode
  (("\\.[rR]" . ess-r-mode)
   ;; If you also use julia or some other language
   ("\\.[jJ][lL]" . ess-julia-mode))
  ;; Add my personal key-map
  :config
  ;; ESS process (print all)
  (setq ess-eval-visibly-p t)
  ;; Silence asking for aprenth directory
  (setq ess-ask-for-ess-directory nil)
  ;; Syntax highlights
  (setq ess-R-font-lock-keywords
	'((ess-R-fl-keyword:keywords . t)
	  (ess-R-fl-keyword:constants . t)
	  (ess-R-fl-keyword:modifiers . t)
	  (ess-R-fl-keyword:fun-defs . t)
	  (ess-R-fl-keyword:assign-ops . t)
	  (ess-R-fl-keyword:%op% . t)
	  (ess-fl-keyword:fun-calls . t)
	  (ess-fl-keyword:numbers . t)
	  (ess-fl-keyword:operators)
	  (ess-fl-keyword:delimiters)
	  (ess-fl-keyword:=)
	  (ess-R-fl-keyword:F&T . t))))

;; eglot
(add-hook 'ess-r-mode-hook 'eglot-ensure)

;; R markdown
(use-package polymode)
(use-package poly-R)
(use-package poly-markdown)
(use-package quarto-mode)

;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.qmd" . poly-markdown+r-mode))

(defalias 'lp 'ess-r-devtools-load-package)
(defalias 'lt 'ess-r-devtools-test-package)
(defalias 'lc 'ess-r-devtools-check-package)
(defalias 'ld 'ess-r-devtools-document-package)

(provide 'init-ess)
