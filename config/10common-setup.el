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
(setq sml/override-theme nil)
(setq sml/active-background-color "#073642")
(setq sml/active-foreground-color "#586e75")
(setq sml/inactive-background-color "#073642")
(setq sml/inactive-foreground-color "#073642")
(setq sml/theme 'respectful)
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

;; configure smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; configure fiplr
(global-set-key (kbd "C-x f") 'fiplr-find-file)

;; configure guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p"))
(guide-key-mode 1) ; enable guide-key mode

;; zeal-at-point
(require 'zeal-at-point)
(global-set-key "\C-cd" 'zeal-at-point)

;; ido vertical completion
;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)


;; put autosaves in backup dir
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups/" t)))


;; help-fns+
(require 'help-fns+)
