;; auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20130724.1750/dict/"
             (ac-config-default))
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)
;; use solarized theme
(load-theme 'solarized-dark t)
;; display line numbers in margin.
(global-linum-mode 1)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)


(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; uniquify tweaks
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; yasnippet
(require 'yasnippet)
(yas-global-mode t)

;; configure gutter
(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)


;; configure modeline
(require 'smart-mode-line)
(sml/setup)

;; fix scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


;; no splash
(setq inhibit-startup-screen +1)

;; formatting and whitespace
(setq-default indent-tabs-mode nil)

(defun my/clean-buffer-formatting ()
  "Indent and clean up the buffer"
  (interactive)
  (indent-region (point-min) (point-max))
  (whitespace-cleanup))

(global-set-key "\C-cn" 'my/clean-buffer-formatting)

(setq show-trailing-whitespace 't)

(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cq" 'delete-indentation)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
