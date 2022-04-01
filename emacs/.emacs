;;   _____   _____  ___
;;   ||-||   | ___| /|| RobertoSixty1's emacs config file
;;   ||  ||  |___ |  ||
;;   ||-||    __| |  || Github: https://github.com/robertohermenegildodias
;;   ||  ||  |____|  || 


;; simplify GUI & appearance

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(set-frame-font "Iosevka 12" nil t)

;; autoload files

(load-file "/home/rosyx/.emacs.d/lisp/porth-mode.el")

;; setup themes

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; emacs keep changing this section, don't touch anything in here

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" "c5164f3138d0fe7e75f4b43b83f08d591d2f669b653a00b038f1f73ae3a5c8b7" default))
 '(package-selected-packages
   '(yasnippet-snippets yasnippet yaml-mode gruber-darker-theme nasm-mode rust-mode magit markdown-mode lua-mode csharp-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; tabs or spaces

(setq c-default-style "linux"
      c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq-default tab-width 4)
