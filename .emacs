;;;; Packages
(let ((default-directory  "~/.emacs.d/lisp/"))
  (setq load-path
        (append
         (let ((load-path  (copy-sequence load-path))) ;; Shadow
           (normal-top-level-add-subdirs-to-load-path))
         load-path)))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("elpa" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa milk" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(edts
                     magit
                     web-mode
                     guide-key
                     helm
                     smart-tab
                     wanderlust
                     org-plus-contrib
                     tao-theme
                     powerline
                     avy
                     swiper
                     swiper-helm
                     import-popwin
                     ace-window
                     simple-httpd
                     tdd-status-mode-line
                     hydra
                     transpose-frame
                     ace-jump-helm-line
                     ace-jump-buffer
                     elpy
                     ensime
                     key-chord
                     image+
                     elixir-mode
                     alchemist
                     company
                     alert
                     request-deferred
                     paredit
                     ))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;;; Theme
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(load-theme 'tao-yin t)
(setq show-trailing-whitespace t)
(set-frame-font "Terminus 8")
(display-time-mode 1)
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " "))))
(require 'powerline)
(powerline-center-theme)



;;;; General
(setq inhibit-startup-message t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq-default column-number-mode t)
(setq-default truncate-lines t)
(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(put 'narrow-to-region 'disabled nil)
(show-paren-mode t)
(setq show-paren-delay 0)
(normal-erase-is-backspace-mode 0)
(winner-mode 1)
(global-visual-line-mode)
(setq-default fill-column 80)
(setq undo-limit 10000000)
(global-auto-complete-mode)
(require 'iso-transl)
;; meaningful names for buffers with the same name
;; from prelude
;; https://github.com/bbatsov/prelude
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;;;; Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;;;; Guide-key
(require 'guide-key)
(guide-key-mode 1)
(setq guide-key/guide-key-sequence
      '("C-x"
        "C-c"
        "M-s"
        "C-h"
        "C-o"
        "C-<tab>"
        "C-,")) ;; Avy
(setq guide-key/idle-delay 0.1)
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/recursive-key-sequence-flag t)


;;;; Orgmode
(require 'org)
(require 'ox-bibtex)
(require 'org-habit)
(require 'ox-latex)

(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("cv" "\\documentclass[10pt]{article}
\\usepackage[scale=0.8]{geometry}
\\usepackage{palatino}
\\usepackage{sectsty}
\\usepackage[T1]{fontenc}
\\usepackage{libertine}"
               ("\\section{%s}" . "\\section*{%s}")
               ))

(setq org-agenda-files
      '("~/org/calendar.org" "~/org/gtd.org"))

(setq org-default-notes-file
      "~/org/gtd.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline       "~/org/gtd.org" "Tasks")
         "* WAIT %?\n  %i\n  %a")))

(setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                 (timeline . "  % s")
                                 (todo . " %i %b ")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))

(defun org ()
  (interactive)
  (find-file "~/org/calendar.org"))

(setq org-todo-keywords
      '((sequence "NEXT(n)" "WAIT(w)" "|" "DONE(d)")))

(setq org-latex-pdf-process
      '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))
                                        ;(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t) (python . t) (emacs-lisp . t))) ;; activate languages

(setq org-latex-default-figure-position "H")
(defun my-org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "ditaa") (string= lang "python") (string= lang "emacs-lisp"))))  ; don't ask for evaluation
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; (setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose
;; --batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f"
;; "texi2dvi --pdf --clean --verbose --batch %f")))

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(setq org-adapt-indentation nil)
(setq org-ditaa-jar-path "/home/eanlamo/.emacs.d/ditaa.jar")

;; Flow monitor state tempalte

(add-to-list 'org-structure-template-alist
             ;; backquote to eval exp after , and return a quioted list
             `("m" ,
               (format "** %s\n\n_phy_\n\n_ment_\n\n_emo_\n\n_flow_"
                       (format-time-string "<%Y-%m-%d %a %H:%M>"))))


;;;; Tramp
(setq tramp-default-method "ssh")


;;;; Sunrise
(require 'sunrise-commander)


;;;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)


;;;; Erlang
;; (global-set-key (kbd "C-c e")   'erlang-compile)
;; (add-hook 'after-init-hook 'my-after-init-hook)
;; (defun my-after-init-hook ()
;;   (require 'edts-start))


;;;; Quick Yes
(defun quick-yes (prompt)
  "Prompt for yes/no, but only test for no."
  (if (string= "no"
               (downcase
                (read-from-minibuffer
                 (concat prompt "(yes or no) "))))
      nil
    t))
(defalias 'yes-or-no-p 'quick-yes)


;;;; Eshell
(setq eshell-visual-subcommands '(("git" "log" "show" "diff")))

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(setq eshell-cmpl-cycle-completions nil)


;;;; Helm
(require 'helm-config)
(require 'helm-eshell)

(helm-mode 1)
(helm-autoresize-mode t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring) ;; History for shell
(setq helm-ff-auto-update-initial-value t)

(define-key helm-map (kbd "C-w") 'backward-kill-word)

(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "C-x b")    'helm-buffers-list)
(global-set-key (kbd "M-x")      'helm-M-x)
(global-set-key (kbd "C-c h")    'helm-command-prefix)
(global-set-key (kbd "C-x C-f")  'helm-find-files)
(global-set-key (kbd "M-y")      'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC")  'helm-all-mark-rings)
(global-set-key (kbd "C-s")      'swiper-helm)


;;;; Elisp
(add-hook
 'lisp-mode-hook
 (lambda ()
   (setq tab-always-indent 'complete)
   (add-to-list 'completion-styles 'initials t)))


;;;; Async
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)
(async-bytecomp-package-mode 1)


;;;; Delete other window
(defun delete-other-window ()
  (interactive)
  (other-window 1)
  (delete-window))


;; Alex 80 columns
(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (delete-other-windows)
  (split-window-right (+ 2 fill-column))
  (other-window 1)
  (switch-to-buffer "*scratch*")
  (other-window 1))


;;;; Window related

(require 'popwin)
(popwin-mode 1)
(require 'windmove)
(require 'transpose-frame) ;; install transpose-frame


;;;; Scala
(add-hook 'scala-mode-hook 'ensime-mode)
(setq ensime-sbt-perform-on-save "test")


;;;; Elixir
(require 'elixir-mode)
(add-hook 'elixir-mode (lambda ()
                         (alchemist-mode)
                         (company-mode)
                         (add-hook 'save-buffer 'alchemist-mix-test)
                         ))


;;;; Image+
(eval-after-load 'image '(require 'image+))
(eval-after-load 'image+ '(imagex-global-sticky-mode 1))


;;;; Keys
(global-set-key (kbd "C-x w") 'kill-region)
(global-set-key (kbd "C-q") 'backward-delete-char-untabify)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "M-n") 'just-one-space)
(global-set-key (kbd "M-e") 'hippie-expand)

(global-set-key (kbd "C-0") 'delete-other-window)
(global-set-key (kbd "C-1") 'delete-other-windows)

(global-set-key (kbd "C-c p") 'org-export-as-pdf)
(global-set-key (kbd "C-c h") 'org-html-export-to-html)
(global-set-key (kbd "C-c a") 'org-agenda)


(define-prefix-command 'my-map)
(global-set-key (kbd "C-<tab>") 'my-map)
(global-set-key (kbd "C-o") 'my-map)
(define-key my-map (kbd "a") 'artist-mode)
(define-key my-map (kbd "o")'org-mode)
(define-key my-map (kbd "s") 'shell)
(define-key my-map (kbd "d") 'sunrise)
(define-key my-map (kbd "e") 'eshell)
(define-key my-map (kbd "t") 'term)
(define-key my-map (kbd "c") 'term-char-mode)
(define-key my-map (kbd "l") 'term-line-mode)
(define-key my-map (kbd "x") 'eval-buffer)
(define-key my-map (kbd "8") 'set-80-columns)
(define-key my-map (kbd "r") 'helm-flyspell-correct)
(define-key my-map (kbd "f") 'flyspell-mode)
(define-key my-map (kbd "g") 'flyspell-buffer)
(define-key my-map (kbd "1") 'russian-translit)
(define-key my-map (kbd "2") 'latin)
(define-key my-map (kbd "g") 'org-capture)

(defun russian-translit ()
  (interactive)
  (cyrillic-translit))

(defun latin ()
  (interactive)
  (set-input-method "ucs"))

;;;; Chords 
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.015)

;; window chords "j"

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(key-chord-define-global "ja" 'windmove-left)
(key-chord-define-global "jd" 'windmove-right)
(key-chord-define-global "jw" 'windmove-up)
(key-chord-define-global "js" 'windmove-down)
(key-chord-define-global "jx" 'ace-delete-window)
(key-chord-define-global "jz" 'delete-window)
(key-chord-define-global "jf" 'ace-window)
(key-chord-define-global "jt" 'transpose-frame)
(key-chord-define-global "jb" 'ace-jump-buffer)
(key-chord-define-global "jv" 'ace-swap-window)
(key-chord-define-global "jq" 'split-window-right)
(key-chord-define-global "je" 'split-window-below)

;; other window, winner
(key-chord-define-global "us" 'scroll-other-window)
(key-chord-define-global "uw" 'scroll-other-window-down)
(key-chord-define-global "ua" 'winner-undo) 
(key-chord-define-global "ud" 'winner-redo)

;; avy and other nchords "k"
(key-chord-define-global "kw" 'avy-goto-word-or-subword-1)
(key-chord-define-global "kd" 'avy-goto-line)
(key-chord-define-global "kv" 'avy-goto-char-2)
(key-chord-define-global "kc" 'avy-goto-char)
(key-chord-define-global "ks" 'avy-push-mark)
(key-chord-define-global "kb" 'avy-pop-mark)
(key-chord-define-global "kg" 'pop-global-mark)
(key-chord-define-global "kz" 'just-one-space)

;; org chords "o"
(key-chord-define-global "oa" 'helm-org-in-buffer-headings)
(key-chord-define-global "os" 'helm-org-parent-headings)

;; org files "p"
(key-chord-define-global "pc" 'org)
(key-chord-define-global "ps" 'org-gcal-sync)
(key-chord-define-global "pf" 'org-gcal-fetch)


;;;; deskel
(load-library "desk.el")


;;;; org-gcal
(load-library "org-gcal.el")


;;;; load secrets
(if (file-exists-p "~/secret.el")
    (load-file "~/secret.el"))

