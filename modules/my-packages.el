(require 'package)
(require 'cl) ;; For every function

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-user-dir (expand-file-name "elpa" my-emacs-dir))
(package-initialize)

(defvar my-theme-packages
  '(zenburn-theme
    solarized-theme
    color-theme-sanityinc-tomorrow
    cider
    exec-path-from-shell))

(defun install-packages (list-of-packages)
  (unless (every #'package-installed-p list-of-packages)
    (package-refresh-contents)
    (mapc (lambda (package)
                  (unless (package-installed-p package)
                          (package-install package)))
            list-of-packages)))

(install-packages my-theme-packages)

(provide 'my-packages)
