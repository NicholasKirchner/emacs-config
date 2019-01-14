(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages") t)

(setq package-user-dir (expand-file-name "elpa" emacs-dir))
(package-initialize)

(defvar my-theme-packages
  '(zenburn-theme
    solarized-theme
    color-theme-sanityinc-tomorrow))

(defun install-packages (list-of-packages)
  (unless (every #'package-installed-p list-of-packages)
    (package-refresh-contents)
    (mapc (lambda (package)
                  (unless (package-installed-p package)
                          (package-install package))))))

(install-packages my-theme-packages)

(provide 'my-packages)