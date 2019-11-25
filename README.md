# How to use Julia with Cygwin Emacs

## Setting up the `.emacs.d` directory

### Install the files for the Julia mode and the Julia REPL

The Julia  programming is supported by:
- `julia-mode.el` to be found at [https://github.com/tpapp/julia-emacs](https://github.com/tpapp/julia-emacs).
- `julia-repl.el` to be found at [https://github.com/tpapp/julia-repl](https://github.com/tpapp/julia-repl).


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
`(global-set-key [remap dabbrev-expand] 'hippie-expand)`

### Multiple cursors

[Multiple cursors package](http://pragmaticemacs.com/emacs/multiple-cursors/)
`M-x multiple-cursors-mode`

```
(add-to-list 'load-path "/home/PetrKrysl/.emacs.d/lisp/multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
```

### YASnippets

[YASnippets](https://github.com/joaotavora/yasnippet)
Julia snippets courtesy of AndreaCrotti (https://github.com/AndreaCrotti/yasnippet-snippets)

## Notes

C-x k kill buff

