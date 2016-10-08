(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(blink-cursor-blinks 4)
 '(calendar-date-style (quote iso))
 '(calendar-mark-diary-entries-flag t)
 '(calendar-mark-holidays-flag t)
 '(calendar-month-header
   (quote
    (propertize
     (format "%d-%s" year
	     (calendar-month-name month))
     (quote font-lock-face)
     (quote calendar-month-header))))
 '(calendar-month-name-array
   ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"])
 '(calendar-today-invisible-hook (quote (japanese-holiday-mark-weekend)))
 '(calendar-today-visible-hook (quote (calendar-mark-today japanese-holiday-mark-weekend)))
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(custom-file "~/.emacs.d/emacs-custom.el")
 '(default-input-method "MacOSX")
 '(desktop-path (quote ("~")))
 '(desktop-save-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-format "%F (%a) %H:%M")
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(global-whitespace-mode t)
 '(helm-flx-mode t)
 '(helm-fuzzier-mode t)
 '(helm-fuzzy-matching-highlight-fn (quote helm-flx-fuzzy-highlight-match))
 '(helm-fuzzy-sort-fn (quote helm-flx-fuzzy-matching-sort))
 '(helm-migemo-mode t)
 '(helm-mode t)
 '(hfy-display-class
   (quote
    ((type . tty)
     (class . grayscale)
     (background . light))))
 '(hfy-src-doc-link-unstyle "")
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(keyboard-coding-system (quote utf-8-unix))
 '(kill-whole-line t)
 '(mac-auto-ascii-mode t)
 '(mac-mouse-wheel-mode t)
 '(make-backup-files nil)
 '(migemo-coding-system (quote utf-8-unix))
 '(migemo-command "cmigemo")
 '(migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
 '(migemo-options (quote ("-q" "--emacs")))
 '(migemo-regex-dictionary nil)
 '(migemo-user-dictionary nil)
 '(org-agenda-files "~/Dropbox/org/agenda.org")
 '(org-agenda-format-date "%F (%a)")
 '(org-agenda-include-diary t)
 '(org-agenda-span (quote fortnight))
 '(org-archive-default-command (quote org-archive-set-tag))
 '(org-directory "~/Dropbox/org")
 '(org-hide-leading-stars t)
 '(org-imenu-depth 3)
 '(org-insert-mode-line-in-empty-file t)
 '(org-startup-folded nil)
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "WAITING" "|" "CANCELLED" "DONE"))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-enable-at-startup t)
 '(package-selected-packages
   (quote
    (scratch-ext helm-helm-commands helm-flx helm-fuzzier org helm-package helm-safari helm-themes helm-unicode japanese-holidays twittering-mode migemo helm)))
 '(recentf-exclude
   (quote
    ("^/[^/:]+:" "\\\\.org\\\\" "\\\\.org_archive\\\\" "\\\\.recentf")))
 '(recentf-mode t)
 '(ring-bell-function (quote ignore))
 '(savehist-mode t)
 '(selection-coding-system (quote utf-8-mac))
 '(server-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(tool-bar-mode nil)
 '(which-function-mode t)
 '(whitespace-style (quote (face tabs newline tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "gray20" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 141 :width normal :foundry "nil" :family "Myrica M"))))
 '(cursor ((t (:background "grey30"))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "red" :weight bold))))
 '(org-hide ((t (:foreground "gray75"))))
 '(region ((t (:background "LightBlue1"))))
 '(whitespace-newline ((t (:foreground "LightSkyBlue"))))
 '(whitespace-tab ((t (:foreground "LightSkyBlue")))))
