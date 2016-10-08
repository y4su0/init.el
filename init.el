;; 日本語文字幅と英数字文字幅の確認日本語文字幅と英数字文字幅の確認日本語文字幅と英数字文字幅の確認
;; abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr

;; 〇一二三四五六七八九〇一二三四五六七八九〇一二三四五六七八九〇一二三四五六七八九
;; 01234567890123456789012345678901234567890123456789012345678901234567890123456789

(cd "~/Dropbox")
(setq load-path
      (append (list (expand-file-name "~/.emacs.d/elisp/")
		    (expand-file-name "~/.emacs.d/elpa/"))
	      load-path))
(setq exec-path (parse-colon-path (getenv "PATH")))
(setq eshell-path-env (getenv "PATH"))

(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する

(require 'package)
(package-initialize)

(require 'helm-config)
(require 'migemo)

(require 'org)

(require 'scratch-ext)

(require 'japanese-holidays)
(setq calendar-holidays japanese-holidays)

(require 'imenu)

;; macos specific
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; http://sourceforge.jp/projects/macemacsjp/lists/archive/users/2010-June/001671.html
;; (mac-add-key-passed-to-system 'shift)

;; キーバインドいろいろ
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(global-set-key (kbd "C-x b") 'helm-for-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "C-c g") 'imenu)
(global-set-key (kbd "C-z") 'ignore)

(setq frame-title-format
      '("[%*] "(:eval (if (buffer-file-name)
			 (abbreviate-file-name (buffer-file-name))
		       "%b")) " - Emacs " emacs-version " on " system-name))

(defcustom imenu-modes
  '(emacs-lisp-mode c-mode c++-mode makefile-mode org-mode)
  "List of major modes for which Imenu mode should be used."
  :group 'imenu
  :type '(choice (const :tag "All modes" t)
		 (repeat (symbol :tag "Major mode"))))
(defun my-imenu-ff-hook ()
  "File find hook for Imenu mode."
  (if (member major-mode imenu-modes)
      (imenu-add-to-menubar "imenu")))
(add-hook 'find-file-hooks 'my-imenu-ff-hook t)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(setq default-frame-alist initial-frame-alist)

