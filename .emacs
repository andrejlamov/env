;;;; Theme
(menu-bar-mode 0)
(toggle-scroll-bar 0)
(tool-bar-mode 0)

(custom-set-faces
 '(default ((t (:inherit nil :stipple
			 nil :background "#080808" :foreground "#eeeeee" :inverse-video
			 nil :box nil :strike-through nil :overline nil :underline
			 nil :slant normal weight: default :height 100))))
 '(helm-selection ((t (:background "indian
 red" :distant-foreground "black"))))
 '(helm-source-header ((t (:background "dim
 gray" :foreground "white" :weight bold :height
 1.3 :family "Mono"))))
 '(minibuffer-prompt ((t (:foreground "white"))))
 '(mode-line-highlight ((t (:box (:line-width
				  2 :color "white" :style released-button)))))
 '(mode-line-inactive ((t (:inherit
			   mode-line :background "grey30" :foreground "color-245" :box (:line-width
											-1 :color "grey40") :weight light))))
 '(org-done ((t (:foreground "PaleGreen"))))
 '(org-todo ((t (:foreground "Pink")))))

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

;;;; Packages
;; (let ((default-directory "~/.emacs.d/lisp/"))
;;   (normal-top-level-add-subdirs-to-load-path))
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
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(edts magit web-mode guide-key helm smart-tab wanderlust org-plus-contrib))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;;; Keys
(global-set-key (kbd "C-x w") 'kill-region)
(global-set-key (kbd "C-w")   'backward-kill-word)
(global-set-key (kbd "M-e")   'backward-delete-char-untabify)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "M-n")   'just-one-space)
(global-set-key (kbd "M-e")   'hippie-expand)

(global-set-key (kbd "M-.") 'shrink-window-horizontally)
(global-set-key (kbd "M-,") 'enlarge-window-horizontally)
(global-set-key (kbd "M-u") 'shrink-window)
(global-set-key (kbd "M-o") 'enlarge-window)

(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-k") 'windmove-down)

(global-set-key (kbd "C-0") 'delete-other-window)
(global-set-key (kbd "C-1") 'delete-other-windows)

(define-prefix-command 'my-map)
(global-set-key (kbd "C-o") 'my-map)
(define-key my-map (kbd "a") 'artist-mode)
(define-key my-map (kbd "o") 'org-mode)
(define-key my-map (kbd "s") 'shell)
(define-key my-map (kbd "d") 'sunrise)
(define-key my-map (kbd "e") 'eshell)
(define-key my-map (kbd "t") 'term)
(define-key my-map (kbd "c") 'term-char-mode)
(define-key my-map (kbd "l") 'term-line-mode)
(define-key my-map (kbd "x") 'eval-buffer)


(require 'guide-key)
(guide-key-mode 1)
(setq guide-key/guide-key-sequence
      '("C-x"
        "C-c"
        "C-h"
        "C-o"))
(setq guide-key/idle-delay 0.1)
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/recursive-key-sequence-flag t)

;;;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


;;;; Orgmode
(require 'org)
(require 'ox-bibtex)
(require 'org-habit)
(require 'ox-latex)

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

'(org-agenda-files (quote ("/andrej@andrej.nu:/home/andrej/org/org.org")))

(defun org ()
  "Open org.org from andrej.nu"
  (interactive)
  (find-file "/andrej@andrej.nu:/home/andrej/org/org.org"))

(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(global-set-key (kbd "C-c p") 'org-export-as-pdf)
(global-set-key (kbd "C-c h") 'org-html-export-to-html)
(global-set-key (kbd "C-c a") 'org-agenda)

;(setq org-latex-pdf-process
;  '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))
(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))

(org-babel-do-load-languages
 'org-babel-load-languages
  '((ditaa . t))) ; this line activates ditaa


(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa")))  ; don't ask for ditaa
          (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; (setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose
;; --batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f"
;; "texi2dvi --pdf --clean --verbose --batch %f")))

(add-hook 'doc-view-mode-hook 'auto-revert-mode)


;;;; Tramp
(setq tramp-default-method "ssh")


;;;; Sunrise
(require 'sunrise-commander)


;;;; Web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;;;; Erlang
(global-set-key (kbd "C-c e")   'erlang-compile)
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))


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


;; Eshell
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

(global-set-key (kbd "C-x b")      'helm-buffers-list)
(global-set-key (kbd "M-x")        'helm-M-x)
(global-set-key (kbd "C-c h")      'helm-command-prefix)
(global-set-key (kbd "C-x C-f")    'helm-find-files)
(global-set-key (kbd "M-y")        'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC")    'helm-all-mark-rings)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action


(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring) ;; History for shell


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
