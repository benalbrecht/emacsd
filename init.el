;; use cask/pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/mypkgs/smartparens")
(add-to-list 'load-path "~/.emacs.d/mypkgs/enhanced-ruby-mode")


(load "00common-setup.el")
(load "01ruby.el")
(load "02org.el")
(load "50smartparens.el")
(load "51projectile.el")
(load "52highlight-indentation.el")
(load "99smarter-move-beginning-of-line.el")
;;(load '02org.el')
