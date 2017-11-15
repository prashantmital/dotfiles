README
======

The `dotfiles` project aims to create a powerful, portable development
environment.


Startup script
--------------

The `profile` script should be symlinked to `~/.profile` to activate the
customizations described therein. In order to ensure propagation of shell
customizations to all login shells, a symlink called `~/.bashrc` should also be
created.


Solarized colorscheme
---------------------

The colorscheme must be installed manually for the terminal emulator being
used. The instructions for this can be found in the project repository.
Installation for VIm is automated by Vundle (see below).


VIm
---

1. Install `vundle` manually.
2. Symlink `vimrc` to `$HOME`.
3. Open VIm and do `:PluginInstall` to install everything.
4. `YCM` autocompletion has compiled components and needs special installation.


TMUX
----

1. Install `tmux-plugin-manager` manually.
2. Symlink `tmux.conf` to `$HOME`.
3. Open TMUX and do `Prefix + I` to install everything.
