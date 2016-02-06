(cd "~/Dropbox")

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-input-method "MacOSX")

;; http://journal.mycom.co.jp/column/osx/079/index.html
;; (Add-to-list 'exec-path "/usr/local/bin")
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH"
	(concat '"/usr/local/bin:" (getenv "PATH")))

(setq load-path
      (append (list
	       (expand-file-name "~/Dropbox/elisp/")
;;	       (expand-file-name "~/Dropbox/elisp/w3m")
	       (expand-file-name "~/Dropbox/elisp/org-8.3.3/lisp"))
	      load-path))

;; cf. http://macemacsjp.sourceforge.jp/index.php?MacFontSetting#h3b01bb4
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
		  'unicode
		  (font-spec :family "Hiragino Kaku Gothic ProN" )
		  nil 'append)
(add-to-list 'face-font-rescale-alist '(".*Hiragino.*" . 1.2))
(add-to-list 'face-font-rescale-alist '(".*Menlo.*" . 1.0))

;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
(set-face-font 'default "fontset-menlokakugo")

;; machine-specific settings
(when (equal system-name "iMac.local")
  (setq initial-frame-alist
	(append (list
		 '(width . 120)
		 '(height . 50)
		 '(top . 300)
		 '(left . 1200)
		 '(cursor-type . (bar . 3))))))

(when (equal system-name "MacBook-Air.local")
  (setq initial-frame-alist
	(append (list
		 '(width . 120)
		 '(height . 36)
		 '(top . 30)
		 '(left . 10)
		 '(cusor-type . (bar . 3))))))

(setq default-frame-alist initial-frame-alist)
(tool-bar-mode 0)
(setq initial-scratch-message "")

(defvar my/bg-color "#fffff0")
(defvar my/fg-color "grey25")

(set-face-attribute 'default t
                    :background my/bg-color
		    :foreground my/fg-color)
(set-face-attribute 'cursor t
		    :background "grey30")

(blink-cursor-mode 0)

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

(add-to-list 'auto-mode-alist
	     '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files "~/Dropbox/org/agenda.org")

;; http://mobileorg.ncogni.to/doc/getting-started/using-dropbox/
(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; for w3m
;; (require 'w3m-load)

;; for twittering-mode
;; (require 'twittering-mode)

;;; *scratch* buffer
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; make "*scratch*" buffer at buffer-list
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
		   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
	  ((= arg 1) (message "another *scratch* is created")))))

(add-hook 'kill-buffer-query-functions
	  ;; delete contents when *scratch* buffer is killed
	  (lambda ()
	    (if (string= "*scratch*" (buffer-name))
		(progn (my-make-scratch 0) nil)
	      t)))

(add-hook 'after-save-hook
	  ;; new *scratch* buffer after saving *scratch*
	  (lambda ()
	    (unless (member (get-buffer "*scratch*") (buffer-list))
	      (my-make-scratch 1))))

(require 'whitespace)

(global-whitespace-mode 1)

(setq whitespace-line-column 200
      whitespace-style '(face
			 tabs newline
			 tab-mark newline-mark))

(set-face-attribute 'whitespace-tab nil
		    :foreground "LightSkyBlue"
		    :background my/bg-color)
(set-face-attribute 'whitespace-newline nil
		    :foreground "LightSkyBlue"
		    :background my/bg-color)

(which-function-mode t)

(require 'imenu)
(defcustom imenu-modes
  '(emacs-lisp-mode c-mode c++-mode makefile-mode)
  "List of major modes for which Imenu mode should be used."
  :group 'imenu
  :type '(choice (const :tag "All modes" t)
		 (repeat (symbol :tag "Major mode"))))
(defun my-imenu-ff-hook ()
  "File find hook for Imenu mode."
  (if (member major-mode imenu-modes)
      (imenu-add-to-menubar "imenu")))
(add-hook 'find-file-hooks 'my-imenu-ff-hook t)

(global-set-key "\C-cg" 'imenu)

(show-paren-mode t)
(setq show-paren-style 'mixed)

(transient-mark-mode t)

(recentf-mode 1)
