# How to use Julia with Cygwin Emacs

## Setting up the `.emacs.d` directory

### Installed the files for the Julia mode and the Julia REPL

`julia-mode.el`


### The `init.el` file

Add the `list` directory to the load path.
```
(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp")
(require 'julia-mode)
(require 'julia-repl)
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)
```
