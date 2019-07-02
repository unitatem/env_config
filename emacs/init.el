; prevent screen spliting after startup
(setq inhibit-startup-screen t)
; maximize emacs frame on start-up
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; load dracula theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/dracula-theme.el")
(load-theme 'dracula t)

; enable whitespace-mode
(require 'whitespace)
(global-whitespace-mode 1)
; whitespace display style
(setq whitespace-style '(
                         face ; enable visualisation with faces (highlights)
                         ; characters visualised with faces
                         trailing
                         tabs
                         lines-tail
                         newline
                         empty ; lines at the beginning and end of the buffer
                         indentation
                         big-inden
                         ; characters visualised with marks
                         space-mark
                         ))

; stop creating backup~ files
(setq make-backup-files nil)
; stop creating #autosave# files
(setq auto-save-default nil)
; never insert tabs
(setq-default indent-tabs-mode nil)
