;;   _____   _____  ___
;;   ||-||   | ___| /|| RobertoSixty1's emacs config file
;;   ||  ||  |___ |  ||
;;   ||-||    __| |  || Github: https://github.com/robertohermenegildodias
;;   ||  ||  |____|  || 


;; simplify GUI

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)

;; autoload files

(load-file "/home/syxarch/.emacs.d/lisp/porth-mode.el")

;; setup MELPA and packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(custom-enabled-themes '(ample))
 '(custom-safe-themes
   '("36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" default))
 '(package-selected-packages '(linum-relative ample-theme lua-mode csharp-mode)))
(custom-set-faces)
