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
                         ("elpa" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa milk" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(org edts magit web-mode))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;;; Keys
(global-set-key (kbd "C-x w") 'kill-region)
(global-set-key (kbd "C-w")   'backward-kill-word)
(global-set-key (kbd "M-e")   'backward-delete-char-untabify)
(global-set-key (kbd "C-o")   'other-window)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "M-n")   'just-one-space)
(global-set-key (kbd "M-e")   'hippie-expand)
(global-set-key (kbd "C-c b") 'ibuffer)

(global-set-key (kbd "M-.") 'shrink-window-horizontally)
(global-set-key (kbd "M-,") 'enlarge-window-horizontally)
(global-set-key (kbd "M-u") 'shrink-window)
(global-set-key (kbd "M-o") 'enlarge-window)

(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-k") 'windmove-down)


;;;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)


;;;; Orgmode
(require 'org)
(require 'org-habit)
'(org-agenda-files (quote ("/andrej@andrej.nu:~/org/org.org")))

(defun org ()
  (interactive)
  (find-file "/andrej@andrej.nu:~/org/org.org"))

(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(global-set-key (kbd "C-c p") 'org-export-as-pdf)
(global-set-key (kbd "C-c h") 'org-html-export-to-html)
(global-set-key (kbd "C-c a") 'org-agenda)

;;;; Theme
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "color-232" :foreground "color-255" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "white" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "color-245" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-done ((t (:foreground "PaleGreen"))))
 '(org-todo ((t (:foreground "Pink")))))


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
