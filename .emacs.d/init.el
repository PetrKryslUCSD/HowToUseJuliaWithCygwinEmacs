;; Added by Package.el.  This must come before configurations of
;; installed packages.  
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Custom variables.
;; I like to be able to drag regions with the mouse.
(custom-set-variables
 '(custom-enabled-themes (quote (misterioso)))
 '(mouse-drag-and-drop-region t)
 '(package-selected-packages (quote (markdown-mode yasnippet)))
 '(visible-cursor t))

;; It is great to be able to see the cursor at the first glance.
(custom-set-faces
 '(cursor ((t (:background "red")))))

;; Add the local list files to the load path.
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Add multiple cursors.
;; Toggling the mode on and off, and setting the multiple cursors is
;; carried out via voice commands.
;; I installed the package into my local lisp directory.
(add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors")
(require 'multiple-cursors)
;; This key  will expand the selection.
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; Dynamic abbreviations. The lookup command is bound to a voice command.
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Replace highlighted text (region) with what I type.
(delete-selection-mode 1)

;; Show matching parentheses.
(setq show-paren-mode t)

;; Command to insert a matching pair of square brackets
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

;; Snippets.
;; YASnippet is a code template system for Emacs. http://github.com/capitaomorte/yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Tags: Exuberant CTAGS.
;; The executable: I installed the entire directory into my home folder.
;; Change this if yours is in a different place.
(setq path-to-ctags (expand-file-name "~/ctags58/ctags.exe")) ;; <- your ctags path here
;; Note that the julia-ctags file is needed to inform the executable
;; of the syntax of Julia. This one is renamed from the one available
;; at https://github.com/JuliaEditorSupport/julia-ctags, and copied into the ctags58 installation directory.
(setq path-to-julia-ctags (expand-file-name "~/ctags58/julia-ctags")) ;; <- your julia-ctags path here
;; Lisp code bound to a voice command.
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
;; Function to create a Git shell. This code is linked to a voice command.
(defun create-git-shell (dir-name)
  "Create git shell."
  (interactive "DDirectory: ")
  (cd dir-name)
  (eshell nil)
  (rename-buffer
   (format "*git %s*" dir-name))
  )
