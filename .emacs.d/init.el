;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments. 
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Add our local list files to the load path.
(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp")

;; Add multiple cursors
(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp/multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; Dynamic abbreviations
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Julia programming
(require 'julia-mode)
(require 'julia-repl)
;; When on cygwin, rewrite the file names.
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode

