(defvar current-user
  (getenv
    (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(defvar my-emacs-dir (file-name-directory load-file-name))
(defvar my-modules-dir (expand-file-name "modules" my-emacs-dir))
(setq custom-file (expand-file-name "custom.el" my-emacs-dir))

(add-to-list 'load-path my-modules-dir)

(require 'my-packages)

;;ui stuff

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

(set-default-font "Inconsolata-dz 10")
