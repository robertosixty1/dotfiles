;; simplify GUI

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)

;; autoload files

(load-file "/home/syxarch/.emacs.d/lisp/lua-mode.el")
(load-file "/home/syxarch/.emacs.d/lisp/porth-mode.el")
;(load-file "/home/syxarch/.emacs.d/lisp/csharp-mode.el")

;; setup MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages '(csharp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
