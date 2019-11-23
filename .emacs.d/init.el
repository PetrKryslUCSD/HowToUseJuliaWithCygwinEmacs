
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp")
(require 'julia-mode)
(require 'julia-repl)
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)

