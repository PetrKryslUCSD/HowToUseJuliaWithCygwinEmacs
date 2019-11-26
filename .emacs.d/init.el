;; Added by Package.el.  This must come before configurations of
;; installed packages.  
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Add the local list files to the load path.
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Add multiple cursors
(add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors")
(require 'multiple-cursors)
;; This key  will expand the selection.
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; Dynamic abbreviations
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Replace highlighted text with what I type?.
(delete-selection-mode 1)

;; Show matching parentheses.
(setq show-paren-mode t)

;; Command to insert a matching pair of brackets
(global-set-key (kbd "M-[") 'insert-pair)

;; Quiet, please! No dinging!
(setq visible-bell nil)
(setq ring-bell-function `(lambda ()
                            (let ((face-background (face-background 'default)))
                              (set-face-background 'default "DodgerBlue")
                              (set-face-background 'default face-background))))

;; Julia programming
(require 'julia-mode)
(require 'julia-repl)
;; When on cygwin, rewrite the file names.
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode
(setenv "JULIA_NUM_THREADS" "2")	     ; set the default number of threads


;; YASnippet is a code template system for Emacs. http://github.com/capitaomorte/yasnippet
(yas-global-mode 1)

;; Tags
(setq path-to-ctags (expand-file-name "~/ctags58/ctags.exe")) ;; <- your ctags path here
(setq path-to-julia-ctags (expand-file-name "~/ctags58/julia-ctags")) ;; <- your julia-ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS --options=%s -e -R --totals=yes *.jl"
	   (julia-repl--path-rewrite path-to-ctags julia-repl-path-rewrite-rules)
	   (julia-repl--path-rewrite path-to-julia-ctags julia-repl-path-rewrite-rules)
	   ))
  )

;; Git
;; Code to be linked to a voice command.
(defun create-git-shell (dir-name)
  "Create git shell."
  (interactive "DDirectory: ")
  (cd dir-name)
  (eshell nil)
  (rename-buffer
   (format "*git %s" dir-name))
  )

;; Custom variables.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(mouse-drag-and-drop-region t)
 '(package-selected-packages (quote (markdown-mode yasnippet)))
 '(visible-cursor t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red")))))
