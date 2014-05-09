(add-to-list 'load-path "~/git/lib/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(setq tab-width 2)
