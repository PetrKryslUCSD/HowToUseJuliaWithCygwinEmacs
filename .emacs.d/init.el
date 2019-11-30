;; Added by Package.el.  This must come before configurations of
;; installed packages.  
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

  ;; install use-package if not installed
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))

;; install s.el
(use-package s
      :ensure t
      :config
      ;; some config for s here
      )

;; install expand-region.el
(use-package expand-region
      :ensure t
      :config
      ;; some config for expand-region here
      )
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Set up the immensely useful Ido mode.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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

;; Show the kill ring as a pop-up menu
(defun show-kill-ring-pop-up-menu ()
  "Show the kill ring pop-up menu."
  (interactive)
  (popup-menu 'yank-menu)
  )

;; Quiet, please! No dinging!
(setq visible-bell nil)
(setq ring-bell-function `(lambda ()
                            (let ((face-background (face-background 'default)))
                              (set-face-background 'default "DodgerBlue")
                              (set-face-background 'default face-background))))

;; Julia programming
;; install julia-mode
(use-package julia-mode
      :ensure t
      :config
      ;; some config for julia-mode here
)
;; install julia-repl
(use-package julia-repl
      :ensure t
      :config
      ;; some config for julia-repl here
)
;; When on cygwin, rewrite the file names.
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode
(setenv "JULIA_NUM_THREADS" "2")	     ; set the default number of threads

;; Snippets.
;; YASnippet is a code template system for Emacs. http://github.com/capitaomorte/yasnippet
  ;; install use-package if not installed
(use-package yasnippet
      :ensure t
      :config
      ;; some config for yasnippet here
)
(yas-global-mode 1)

;; Tags: Exuberant CTAGS.
;; The executable. I installed the entire directory into my home folder.
;; Change this if it is in a different place.
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

;; Custom variables.
;; I like to be able to drag regions with the mouse.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(mouse-drag-and-drop-region t)
 '(package-selected-packages (quote (expand-region magit markdown-mode yasnippet)))
 '(visible-cursor t))

;; It is great to be able to see the cursor at the first glance.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red")))))
