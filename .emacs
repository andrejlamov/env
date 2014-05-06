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
(set-foreground-color "white")
(set-background-color "black")


;;;; Fonts
(set-frame-font
  "-xos4-Terminus-normal-normal-normal-*-12-*-*-*-c-60-iso10646-1" nil t)


;;;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


;;;; Packages
(setq my-packages
  '(scala-mode2 erlang haskell-mode magit auto-complete windmove))
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" .
                 "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
               '("marmalade" .
                 "http://marmalade-repo.org/packages/") t)

  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-refresh-contents)
      (package-install package))))


;;;; Autocomplete everything
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)


;;;; Tabsize
(setq tab-width 2
      indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)


;; Hippieexpand
(global-set-key (kbd "M-i") 'hippie-expand)


;;;; Haskell indent
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;;;; Tramp!
(require 'tramp)


;;;; Org-mode
;; Latex
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}
                 \\usepackage{amsmath}"
               ("\\section{%s}" . "\\section*{%s}")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-file-apps (quote ((auto-mode . emacs) ("\\.mm\\'" . default) ("\\.x?html?\\'" . default) ("\\.pdf\\'" . emacs)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; DocView
;; Continuous scrolling.
(setq doc-view-continuous t)
;; Auto-revert
(add-hook 'doc-view-mode-hook 'auto-revert-mode)


;;;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;;;; Full screen for x
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)
(put 'erase-buffer 'disabled nil)


;;;; Date, time in status bar
(setq display-time-day-and-date t
                display-time-24hr-format t)
             (display-time)


;;;; Battery status
(display-battery-mode 1)
