(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/gtd.org"
                             "~/org/notes.org"
                             "~/org/someday.org"
                             "~/org/journal.org"))

(require 'ox-latex)
(add-to-list 'org-latex-classes
          '("koma-article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; smart quotes
(setq org-export-with-smart-quotes t)

;; org tweaks http://www.brool.com/index.php/using-org-mode-with-gtd
(setq org-return-follows-link t)

(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
        ("n" todo "NEXT" nil)
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))
        ("H" "Office and Home Lists"
         ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "MOVIE")
          (tags-todo "READING")))
        ("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0))))))
)

(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
)

;; capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
 '(("s" "Todo with source link" entry (file+headline "~/org/notes.org" "Tasks")
    "* TODO %^{Description} %^g\n  %?\n  %i\n  %a\n  Entered on: %U")
   ("t" "Todo" entry (file+headline "~/org/notes.org" "Tasks")
    "* TODO %^{Description} %^g\n  %?\n  %i\n  Entered on: %U" )
   ("j" "Journal" entry (file+datetree "~/org/journal.org")
    "* %?\n  Entered on %U\n  %i\n  %a")))

(setq org-use-fast-todo-selection t)

(setq org-refile-targets (quote (("gtd.org" :maxlevel . 1)
                                 ("someday.org" :level . 2))))
