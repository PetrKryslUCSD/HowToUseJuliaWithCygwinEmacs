# How to use Julia with Cygwin Emacs

## Which  Emacs?

I am running `cygwin` version 2.897 (64-bit) on Windows 10.

I use the `emacs-w32` package in `cygwin`. As I understand it this is emacs
compiled for the win 32 api, and so it is using the native UI.
Importantly, it supports the ANSI term.

I went with the latest version (November 2019), that is 26.3. The
packages to download are `emacs-w32` and `emacs-common`. 

## Setting up the `.emacs.d` directory

My personal copy of this directory, partially equipped, is part of
this repository.

For some weird reason `s.el` is needed but not found in some default location.
To cover this case  I have included `s.el` in my `.emacs.d/lisp` directory.

The `.emacs.d/plugins` directory also includes a copy of the `yasnippet` package.

### The `init.el` file

My copy of the `init.el` file is part of this repository
[(see)](https://github.com/PetrKryslUCSD/HowToUseJuliaWithCygwinEmacs/tree/master/.emacs.d).
It is fully commented.

## Dragon voice commands

The Dragon voice commands are grouped into sections, defined in the
`Emacs-Dragon-commands.xml` file. This file can be imported into
Dragon Professional 15 and up.  The commands are thoroughly
documented. Some commands require lisp commands to work: refer to
`init.el`.

## More details

### Julia mode and the Julia REPL

The Julia  programming is supported by:
- `julia-mode.el` to be found at [https://github.com/tpapp/julia-emacs](https://github.com/tpapp/julia-emacs).
- `julia-repl.el` to be found at [https://github.com/tpapp/julia-repl](https://github.com/tpapp/julia-repl).
These files are installed in the `lisp` directory.

Operating Julia within Emacs on cygwin requires some care: Windows
programs (such as Julia, or ctags) do not handle correctly `cygwin`
directory and file names. Fortunately, `julia-repl.el` implements a
set of rewriting rules that can translate between the paths under
cygwin and the Windows drives.



### Git

For working with Git I use command-line `git`running in an extended
Emacs shell, opened with the command `open git`.  The shell is renamed
to `*git ddd*`, where `ddd` is the name of the git repository (directory).
The command is supported with  the following Lisp code:
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

### Tags

Needs to be written

### Dynamic abbreviations

I use HippieExpand. A voice command is linked  to
`(global-set-key [remap dabbrev-expand] 'hippie-expand)`.

### Multiple cursors

I use the excellent [Multiple cursors
package](http://pragmaticemacs.com/emacs/multiple-cursors/).  The
package needs to be toggled on and off (via a voice command), and
there is a couple of voice commands for setting the multiple cursor.

### YASnippets

The functionality is provided by [YASnippets](https://github.com/joaotavora/yasnippet).
If you wish, you can install this package by yourself:
```
cd ~/.emacs.d/plugins
git clone --recursive https://github.com/joaotavora/yasnippet
```
Otherwise the `.emacs.d/plugins/` directory contains a copy of this package.

The foundation consists of Julia snippets courtesy of AndreaCrotti (https://github.com/AndreaCrotti/yasnippet-snippets).
I added a few of my own.

### Markdown

(http://jblevins.org/projects/markdown-mode/)

## Notes


