(cd "~/Dropbox")

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-input-method "MacOSX")

;; http://journal.mycom.co.jp/column/osx/079/index.html
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH"
	(concat '"/usr/local/bin:" (getenv "PATH")))

(setq load-path
      (append (list
	       (expand-file-name "~/.emacs.d/elisp/")
	       (expand-file-name "~/.emacs.d/elisp/org-8.3.3/lisp"))
	      load-path))

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

(setq ring-bell-function '(lambda())) ;; no beep

;; macos specific
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; http://sourceforge.jp/projects/macemacsjp/lists/archive/users/2010-June/001671.html
;;(mac-add-key-passed-to-system 'shift)

;; http://molekun.blogspot.com/2011/03/homebrewemacs233.html
;; (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

(add-to-list 'auto-mode-alist
	     '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; http://mobileorg.ncogni.to/doc/getting-started/using-dropbox/

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

(setq frame-title-format
      '("%b " (:eval (if (buffer-file-name)
			 (concat "[" (abbreviate-file-name (buffer-file-name)) "]")
		       "")) "on " system-name))

(Require 'imenu)
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

(global-set-key "\C-cg" 'imenu)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(blink-cursor-blinks 4)
 '(blink-cursor-mode nil)
 '(calendar-week-start-day 1)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-format "%F %H:%M")
 '(display-time-load-average-threshold 100)
 '(display-time-mode t)
 '(global-whitespace-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(kill-whole-line t)
 '(make-backup-files nil)
 '(org-agenda-files "~/Dropbox/org/agenda.org")
 '(org-directory "~/Dropbox/org")
 '(org-hide-leading-stars t)
 '(org-imenu-depth 3)
 '(org-startup-folded nil)
 '(org-startup-truncated nil)
 '(recentf-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(tool-bar-mode nil)
 '(which-function-mode t)
 '(whitespace-line-column 200)
 '(whitespace-style (quote (face tabs newline tab-mark newline-mark))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fffff0" :foreground "grey25" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "grey30"))))
 '(org-hide ((t (:foreground "gray75"))))
 '(whitespace-newline ((t (:foreground "LightSkyBlue"))))
 '(whitespace-tab ((t (:foreground "LightSkyBlue")))))


(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN"))
(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
