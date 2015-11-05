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
(ido-mode 1)
(winner-mode 1)

;;;; Packages
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa milk" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(org magit))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;;; Keys
(global-set-key (kbd "C-x w") 'kill-region)
(global-set-key (kbd "C-w")   'backward-kill-word)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "M-n")   'just-one-space)
(global-set-key (kbd "M-i")   'hippie-expand)
(global-set-key (kbd "C-c b") 'ibuffer)

(global-set-key (kbd "M-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>")  'shrink-window)
(global-set-key (kbd "M-<up>")    'enlarge-window)

(global-set-key (kbd "M-C-<left>")  'windmove-left)
(global-set-key (kbd "M-C-<right>") 'windmove-right)
(global-set-key (kbd "M-C-<up>")    'windmove-up)
(global-set-key (kbd "M-C-<down>")  'windmove-down)


;;;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


;;;; Orgmode
(require 'org)
(require 'org-habit)
(setq org-agenda-files (list "~/org/org.org"))
(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(global-set-key (kbd "C-c p") 'org-export-as-pdf)
(global-set-key (kbd "C-c h") 'org-html-export-to-html)
(global-set-key (kbd "C-c a") 'org-agenda)



;;;; Tramp
(setq tramp-default-method "ssh")


;;;; Magit colors
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-diff-add "color-232")
     (set-face-foreground 'magit-diff-add "color-119")
     (set-face-background 'magit-diff-del "color-232")
     (set-face-foreground 'magit-diff-del "color-160")
     (set-face-foreground 'magit-diff-none "white")
     (unless window-system
       (set-face-background 'magit-item-highlight "color-233"))))


;;;; Customs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-habit-show-all-today t)
 '(package-selected-packages
   (quote
    (zencoding-mode zenburn-theme zenburn zen-mode tao-theme magit hc-zenburn-theme gnuplot anti-zenburn-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "color-232" :foreground "color-255" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "white" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "color-245" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-done ((t (:foreground "PaleGreen"))))
 '(org-todo ((t (:foreground "Pink"))))
 '(sr-directory-face ((t (:inherit dired-directory)))))


;;;; Sunrise
(require 'sunrise-commander)


;;;; Elpy
(elpy-enable)


;;;; Web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;;;; Erlang
(global-set-key (kbd "C-c e")   'erlang-compile)
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))
