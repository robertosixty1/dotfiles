;;   _____   _____  ___
;;   ||-||   | ___| /|| RobertoSixty1's emacs config file
;;   ||  ||  |___ |  ||
;;   ||-||    __| |  || Github: https://github.com/robertohermenegildodias
;;   ||  ||  |____|  || 


;; simplify GUI

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(setq inhibit-startup-screen t)

;; autoload files

(load-file "/home/rosyx/.emacs.d/lisp/porth-mode.el")

;; setup themes

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; setup MELPA and packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("de1bf2ed5e8ff97ce2d8f277f1d022a8a9141d5c7afe5248c5df077f30168a1b" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" default))
 '(package-selected-packages '(rust-mode magit markdown-mode lua-mode csharp-mode)))
(custom-set-faces)
