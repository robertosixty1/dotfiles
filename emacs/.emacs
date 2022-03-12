;; simplify GUI

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)

;; autoload files

(load-file "/home/syxarch/.emacs.d/lisp/lua-mode.el")

;; setup MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(custom-enabled-themes '(wombat)))
(custom-set-faces)
