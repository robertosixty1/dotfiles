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

;; setup MELPA and packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" "c5164f3138d0fe7e75f4b43b83f08d591d2f669b653a00b038f1f73ae3a5c8b7" default))
 '(fci-rule-color "#383838")
 '(frame-brackground-mode 'dark)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(yasnippet-snippets yasnippet yaml-mode gruber-darker-theme nasm-mode rust-mode magit markdown-mode lua-mode csharp-mode))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; tabs or spaces

(setq c-default-style "linux"
      c-basic-offset 4)
