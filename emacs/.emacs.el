if Mac OS X (Aqua)
(if (eq window-system 'ns)
    (progn
      (set-language-environment 'Japanese)
      (prefer-coding-system 'utf-8)
      (tool-bar-mode 0)
      (scroll-bar-mode -1)
      (setq next-line-add-newlines nil)
      (setq default-input-method "MacOSX")
      (setq ns-command-modifier 'meta)
      (setq mac-pass-control-to-system nil)
      (setq mac-pass-command-to-system nil)
      (setq mac-pass-option-to-system nil)
      (create-fontset-from-ascii-font "Menlo-13:weight=normal:slant=normal" nil "menlokakugo")
      (set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" :size 13) nil 'append)
      (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
      )
  )
(global-set-key "\C-h" 'delete-backward-char)
(setq line-number-mode t)
(setq column-number-mode t)
(global-font-lock-mode t)


					;------my setting---------------

					;Background Highlight
(global-hl-line-mode t)                   ;; 現在行をハイライト
(custom-set-faces
 '(hl-line ((t (:background "color-236"))))
 )
(show-paren-mode t)                       ;; 対応する括弧をハイライト
(transient-mark-mode t)                   ;; 選択範囲をハイライト
;;
;; volatile-highlights
;;
					;(require 'volatile-highlights)
					;(volatile-highlights-mode t)


					;line number
(global-linum-mode t)

					;opnening massage deleted
					;(setq inhibit-startup-message t)


					;--------------------------------------

;;;
;;; Settings for Computer Science II
;;; y-takata, 2011, 2012
;;;

;;; C-k (kill-line) at the beginning of line kills the whole line.
(setq kill-whole-line t)

;;; Do not indent the braces for a substatement.
(c-set-offset 'substatement-open 0)

;;; Use flymake (on-the-fly syntax checking) for C programs.
(require 'flymake)
(defun flymake-c-init ()
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
		      'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-W" "-pedantic" "-fsyntax-only" local-file))))
(push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)
(add-hook 'c-mode-hook '(lambda () (if (string-match "\\.c$" buffer-file-name)
				       (flymake-mode t))))

;;Color
(if window-system (progn
		    (set-background-color "Black")
		    (set-foreground-color "LightGray")
		    (set-cursor-color "Gray")
		    ;;(set-frame-parameter nil 'alpha 99)
		    ))
;(global-linum-mode t)
