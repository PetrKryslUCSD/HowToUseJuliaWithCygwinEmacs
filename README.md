# How to use Julia with Cygwin Emacs

## Configuration of Cygwin

### Which  Emacs?

I am running `cygwin` version 2.897 (64-bit) on Windows 10.

I use the `emacs-w32` package in `cygwin`. As I understand it this is emacs
compiled for the win 32 api, and so it is using the native UI.
Importantly, it supports the ANSI term.

The problem for me with `emacs-X11` is that the window of the
application is not recognized as anything else but `Xwin`. That makes
it impossible to connect a command set in my voice recognition program
to the window.

The problem with `emacs-X11` for everyone is that it requires the X
server to be running under `cygwin`: it is resource hungry, and it
slows down Windows noticeably. The `emacs-w32` is without doubt
snappier.

I went with the latest version of `emacs-w32`, that is 26.3 (November 2019). The
packages to download are `emacs-w32` and `emacs-common`.

### Git

The Emacs package `magit` is a really convenient and intuitive wrapper
to Git.  If you wish to use it under `cygwin`, it is imperative that
you install the `git` `cygwin` package. Otherwise Emacs would probably
try to use a Windows `git` instead of the `cygwin` one, and `magit`
would fail to bring up `emacsclient` when committing.

## Starting Emacs

The quickest way to get started is to copy the `.emacs.d` directory
from this repository to your home folder under `cygwin` (for instance
`/home/YourName`).  Then also unzip the `ctags58.7z` in the home
folder ("Extract here" of 7-zip).

Then, if you execute `emacs-w32` in the `cygwin` shell you should get
a fully functional Emacs window. Please be patient, Emacs will first
download and install a handful of packages from the web. This only
happens the first time Emacs starts. The automatic configuration is
made possible by the fantastic `use-package` Emacs package.

If you wish, this default set up may be modified as described below.

## Makeup of the `.emacs.d` directory

My personal copy of this directory, partially equipped, is part of
this repository.


- The Julia mode, `julia-mode.el`, and the Julia minor mode for the
  REPL, `julia-repl.el`, are installed from the MELPA archive when
  Emacs starts for the first time.
- For some weird reason `s.el` is needed but not found in some default
  location. It is also installed automatically.
- The `yasnippet` package is also installed from the web.
- The `.emacs.d/lisp` directory holds a copy of the `multiple-cursors` package.
- The `.emacs.d/snippets` directory also includes my version of the
  Julia snippets for the `yasnippet` package.

It is certainly possible to install updates to certain packages (such
as the Julia modes) from MELPA.  You may wish to use `package` to
install from Emacs package repositories (for which `init.el` file is
already set up).

### The `init.el` file

My copy of the `init.el` file is part of this repository
[(see)](https://github.com/PetrKryslUCSD/HowToUseJuliaWithCygwinEmacs/tree/master/.emacs.d).
It is fully commented.

### Additional installs

Use the package manager to install `markdown-mode`.

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

For working with Git I use the Emacs package `magit`.  It may be
opened with the voice command `open git`. Additional commands are
available for `magit-status` and so on.


### Tags

I use the program *Exuberant CTAGS*
(http://ctags.sourceforge.net/). Furthermore, the language-definition
file [julia-ctags](https://github.com/JuliaEditorSupport/julia-ctags )
is needed. Both of these are packaged in a zip archive included with
this repository.

The usage of the tags is supported with voice commands, including the
creation of the TAGS file (refer to the `init.el` file).

### Dynamic abbreviations

I use HippieExpand. A voice command is linked to `hippie-expand` which
is remapped from `dabbrev-expand`:
```
(global-set-key [remap dabbrev-expand] 'hippie-expand)
```
Visiting a TAGS file makes also the source-code tags available to HippieExpand.

### Multiple cursors

I use the excellent [Multiple cursors
package](http://pragmaticemacs.com/emacs/multiple-cursors/).  The
package needs to be toggled on and off (via a voice command), and
there is a couple of voice commands for setting the multiple cursor.

### YASnippets

The functionality is provided by [YASnippets](https://github.com/joaotavora/yasnippet).
The package is installed automatically when Emacs starts for the first time.


The foundation consists of Julia snippets courtesy of AndreaCrotti
(https://github.com/AndreaCrotti/yasnippet-snippets).  I added a few
of my own.

### Expansion of directory and folder names

- `ido-mode`

### Selecting

- `expand-region`

### Markdown

I use the [markdown mode](http://jblevins.org/projects/markdown-mode/).
It needs to be installed from the  package menu initially.

## Notes


## Acknowledgments

[orialb](https://discourse.julialang.org/u/orialb) provided code to
automatically install necessary packages from the Emacs
archives. [tamas_papp](https://discourse.julialang.org/u/tamas_papp)
is the (co-)author of the Julia packages, and was instrumental in
making this whole thing work under `cygwin`.

