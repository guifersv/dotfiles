(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/")
;;              t)

(package-initialize)

(setenv "PATH"
        (concat (getenv "PATH")
                ":~/.local/share/mise/shims"))

(setq exec-path
      (append exec-path
              '("~/.local/share/mise/shims")))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t)
(setq message-log-max nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Appearance

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(electric-pair-mode 1)
(global-auto-revert-mode 1)

(set-face-attribute 'default nil
                    :font "CaskaydiaCove Nerd Font"
                    :height 120
                    :weight 'medium)

(set-face-attribute 'fixed-pitch nil
                    :font "CaskaydiaCove Nerd Font"
                    :height 120)

(set-face-attribute 'variable-pitch nil
                    :font "Cantarell"
                    :height 140)

;; Packages

(use-package emacs
  :init
  (setq custom-file "~/.emacs.d/emacs-custom.el")
  (load custom-file)
  (setq frame-title-format "%b")

  :custom
  (use-short-answers t))

(use-package doom-themes
  :config
  (load-theme 'doom-ayu-mirage t))

(use-package go-mode
  :hook
  (go-mode . eglot-ensure))

(use-package zig-mode
  :hook
  (zig-mode . eglot-ensure))

(use-package magit)

;; Eglot

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls")))

  (add-to-list 'eglot-server-programs
               '(zig-mode
                 . ("zls"
                    :initializationOptions
                    (;; Whether to enable build-on-save diagnostics
                     ;;
                     ;; Further information about build-on-save:
                     ;; https://zigtools.org/zls/guides/build-on-save/
                     ;; enable_build_on_save t

                     ;; Omit the following line if `zig` is in your PATH
                     ;; :zig_exe_path "/path/to/zig_executable"
                     )))))
