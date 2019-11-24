# How to use Julia with Cygwin Emacs

## Setting up the `.emacs.d` directory

### Install the files for the Julia mode and the Julia REPL

`julia-mode.el`
`julia-repl.el`


### The `init.el` file

Add the `list` directory to the load path.
```
(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp")
(require 'julia-mode)
(require 'julia-repl)
(setq julia-repl-path-rewrite-rules julia-repl-cygwin-path-rewrite-rules)
```

### Git

For working with Git I use command-line `git`running in a regular
Emacs shell, opened with the command `open git`.  The shell is renamed
to `*git*`.

### Dynamic abbreviations

HippieExpand

### Multiple cursors

http://pragmaticemacs.com/emacs/multiple-cursors/
M-x multiple-cursors-mode (toggle)

## Notes

C-x k kill buff
M-C-SPC followed by M-left select word
C-k kill line

(mark-sexp)