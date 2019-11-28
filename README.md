# How to use Julia with Cygwin Emacs

## Which  Emacs?

I am running `cygwin` version 2.897 (64-bit) on Windows 10.

I use the `emacs-w32` package in `cygwin`. As I understand it this is emacs
compiled for the win 32 api, and so it is using the native UI.
Importantly, it supports the ANSI term.

I went with the latest version, that is 26.3 (November 2019). The
packages to download are `emacs-w32` and `emacs-common`. 

## Starting Emacs

The quickest way to get started is to copy the `.emacs.d` directory
from this repository to your home folder under `cygwin` (for instance `/home/YourName`).
Then also unzip the `ctags58.7z` in the home folder  ("Extract here"  of 7-zip).

Then, if you execute `emacs-w32` in the `cygwin`
shell you should get a fully functional Emacs window.

If you wish, this default set up may be modified as described below.

## Set up of the `.emacs.d` directory

My personal copy of this directory, partially equipped, is part of
this repository.

- The Julia mode, represented by the `julia-mode.el` file, is included in  `.emacs.d/lisp`.
- The Julia minor mode for the REPL, `julia-repl.el`,  is included in  `.emacs.d/lisp`.
- For some weird reason `s.el` is needed but not found in some default location.
To cover this case  I have included `s.el` in my `.emacs.d/lisp` directory.
- The `.emacs.d/lisp` directory holds a copy of the `multiple-cursors` package.
- The `.emacs.d/plugins` directory also includes a copy of the `yasnippet` package.
- The `.emacs.d/snippets` directory also includes my version of the Julia snippets for the  `yasnippet` package.

Both the Julia mode and  the Julia REPL will be soon available from [MELPA](https://melpa.org/#/getting-started).
When that happens, it should be enough to rely on `(require 'julia-mode)` etc. instead of the bundled files.

### Additional installs

Use the package manager to install `markdown-mode`.

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
The command is supported with a bit of Lisp code in `init.el`.

The Git commands in common use  (status, add, commit, ...) are provided as voice commands.
Any other Git command may also be used, of course.

### Tags

I use the program *Exuberant CTAGS* (http://ctags.sourceforge.net/). Furthermore, the language-definition file
[julia-ctags](https://github.com/JuliaEditorSupport/julia-ctags
) is needed. Both of these are packaged in a zip archive included with this repository.

The usage of the tags is supported with voice commands, including  the creation of the TAGS file (refer to the `init.el` file). 

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

I use the [markdown mode](http://jblevins.org/projects/markdown-mode/).
It needs to be installed from the  package menu initially.

## Notes


