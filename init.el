(cd "~/Dropbox")

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-input-method "MacOSX")

;; http://journal.mycom.co.jp/column/osx/079/index.html
;; (Add-to-list 'exec-path "/usr/local/bin")
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH"
	(concat '"/usr/local/bin:" (getenv "PATH")))

(add-to-list 'load-path "~/Dropbox/elisp/")
(add-to-list 'load-path "~/Dropbox/elisp/org-7.8.11/lisp")
(add-to-list 'load-path "~/Dropbox/elisp/w3m")

;; cf. http://macemacsjp.sourceforge.jp/index.php?MacFontSetting#h3b01bb4
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
		  'unicode
		  (font-spec :family "Hiragino Kaku Gothic ProN" )
		  nil 'append)
(add-to-list 'face-font-rescale-alist '(".*Hiragino.*" . 1.2))
(add-to-list 'face-font-rescale-alist '(".*Menlo.*" . 1.0))

(add-to-list 'initial-frame-alist '(font . "fontset-menlokakugo"))
(add-to-list 'initial-frame-alist '(cursor-type . (bar . 3)))

;; machine-specific settings
(when (equal system-name "iMac.local")
  (add-to-list 'initial-frame-alist '(width . 120))
  (add-to-list 'initial-frame-alist '(height . 50))
  (add-to-list 'initial-frame-alist '(top . 300))
  (add-to-list 'initial-frame-alist '(left . 1200)))

(when (equal system-name "MacBook-Air.local")
  (add-to-list 'initial-frame-alist '(width . 120))
  (add-to-list 'initial-frame-alist '(height . 36))
  (add-to-list 'initial-frame-alist '(top . 30))
  (add-to-list 'initial-frame-alist '(left . 10)))

(setq default-frame-alist initial-frame-alist)
(tool-bar-mode 0)
(setq initial-scratch-message "")

;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
(set-face-font 'default "fontset-menlokakugo")

(set-cursor-color "Gray35")
(blink-cursor-mode t)

(setq ring-bell-function '(lambda())) ;; no beep
(font-lock-mode t)
(setq inhibit-startup-message t) ; don't show the startup message
(setq kill-whole-line t) ; C-k deletes the end of line

(setq auto-save-default nil) ; disable auto-saving
(setq make-backup-files nil) ; don't make *~
(setq auto-save-list-file-prefix nil) ; don't make ~/.saves-PID-hostname

(setq calendar-week-start-day 1)

;; macos specific
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; http://sourceforge.jp/projects/macemacsjp/lists/archive/users/2010-June/001671.html
;;(mac-add-key-passed-to-system 'shift)

;; http://molekun.blogspot.com/2011/03/homebrewemacs233.html
;;(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files "~/Dropbox/org/agenda.org")

;; http://mobileorg.ncogni.to/doc/getting-started/using-dropbox/
(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; https://github.com/rileyrg/org-googlecl
;; http://kikukawatei.blogspot.com/2011/01/org-googleclel-blogger_4570.html
;; can't use non-ascii characters in blogname?
(require 'org-googlecl)
(setq googlecl-blogname "diary.y4su0.com")
(setq googlecl-username "y4su0@y4su0.com")
(setq googlecl-default-labels nil)
(setq googlecl-footer
      "<br />-- <br />Posted with <a href=\"https://github.com/rileyrg/org-googlecl\">org-googlecl.el</a>")

;; for w3m
(require 'w3m-load)

;; for twittering-mode
(require 'twittering-mode)
