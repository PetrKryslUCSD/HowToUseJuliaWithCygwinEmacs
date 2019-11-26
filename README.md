# How to use Julia with Cygwin Emacs

## Setting up the `.emacs.d` directory

My personal copy of this directory, partially equipped, is part of this repository.

### The `init.el` file

My copy of the `init.el` file is part of this repository.
It is fully commented.

## Dragon voice commands

The Dragon voice commands are described in the sections recorded in the
`Emacs-Dragon-commands.xml` file.

### Julia mode and the Julia REPL

The Julia  programming is supported by:
- `julia-mode.el` to be found at [https://github.com/tpapp/julia-emacs](https://github.com/tpapp/julia-emacs).
- `julia-repl.el` to be found at [https://github.com/tpapp/julia-repl](https://github.com/tpapp/julia-repl).
These files are installed in the `lisp` directory.


### Git

For working with Git I use command-line `git`running in a regular
Emacs shell, opened with the command `open git`.  The shell is renamed
to `*git*`.

```
(defun create-git-shell (dir-name)
  "Create git shell."
  (interactive "DDirectory: ")
  (cd dir-name)
  (eshell nil)
  (rename-buffer
   (format "*git %s" dir-name))
  )
```


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

### Markdown

(http://jblevins.org/projects/markdown-mode/)

## Notes

C-x k kill buff

