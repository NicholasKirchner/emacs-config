(defvar current-user
  (getenv
    (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(defvar my-emacs-dir (file-name-directory load-file-name))
(defvar my-modules-dir (expand-file-name "modules" my-emacs-dir))
(setq custom-file (expand-file-name "custom.el" my-emacs-dir))

(add-to-list 'load-path my-modules-dir)

(require 'my-packages)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; ui stuff

(load-theme 'sanityinc-tomorrow-night t)

(menu-bar-mode (if (and
		    (eq system-type 'darwin)
		    (display-graphic-p))
		   1
		 -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(blink-cursor-mode -1)

(setq inhibit-startup-screen t)

(set-default-font "InconsolataDZ 10")

;; keys

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control)

(define-key global-map (kbd "M-<up>") 'beginning-of-buffer)
(define-key global-map (kbd "M-<down>") 'end-of-buffer)
(define-key global-map (kbd "M-<left>") 'move-beginning-of-line)
(define-key global-map (kbd "M-<right>") 'move-end-of-line)

(define-key global-map (kbd "s-<up>") 'backward-paragraph)
(define-key global-map (kbd "s-<down>") 'forward-paragraph)
(define-key global-map (kbd "s-<left>") 'backward-word)
(define-key global-map (kbd "s-<right>") 'forward-word)

(define-key global-map (kbd "M-s-<left>") 'beginning-of-defun)
(define-key global-map (kbd "M-s-<right>") 'end-of-defun)
(define-key global-map (kbd "M-s-<down>") 'scroll-down)
(define-key global-map (kbd "M-s-<up>") 'scroll-up)
