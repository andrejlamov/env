;;;; General
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq-default column-number-mode t)
(setq-default truncate-lines t)
(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(put 'narrow-to-region 'disabled nil)

;;;; Keys
(global-set-key (kbd "C-x w") 'kill-region)
(global-set-key (kbd "C-w")   'backward-kill-word)
(global-set-key (kbd "C-c u") 'windresize)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "C-c p") 'org-export-as-pdf)
(global-set-key (kbd "M-n")   'just-one-space)
(global-set-key (kbd "C-c a") 'org-agenda)

;;;; Resize windows
(global-set-key (kbd "M-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>")  'shrink-window)
(global-set-key (kbd "M-<up>")    'enlarge-window)

;;;; Movement
(global-set-key (kbd "M-C-<left>")  'windmove-left)
(global-set-key (kbd "M-C-<right>") 'windmove-right)
(global-set-key (kbd "M-C-<up>")    'windmove-up)
(global-set-key (kbd "M-C-<down>")  'windmove-down)

;;;; Winner mode - undo movement/resize
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;;; Basic colors
(set-foreground-color "black")
(set-background-color "white")

;;;; Fonts
(set-frame-font
  "-xos4-Terminus-normal-normal-normal-*-12-*-*-*-c-60-iso10646-1" nil t)

;;;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Hippieexpand
(global-set-key (kbd "M-i") 'hippie-expand)

;; Packages
(setq package-list '(org magit magit-filenotify scala-mode2))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Orgmode

(setq org-agenda-files (list "~/org/org.org"))
(setq org-todo-keywords
      '((sequence "TODO" "PENDING" "CANCEL" "DONE")))
;; Tramp

(setq tramp-default-method "ssh")
