## Dotfiles

This is both a linux and zsh specific set of configuration files.

### Things needed before installing
A few things need to be installed on your machine before running the install script:

* oh-my-zsh (run `rm ~/.zshrc` afterwards since we'll be replacing that file)
* neovim >= 0.7.0
    * packer.nvim (use their install command on your CLI)
* fzf
* ripgrep
* stow
* fd-find

#### Install
Clone this repo into your `$HOME` directory then run `./install` from within it.
Aftwards you'll want to open vim and run `:PackerSync` to install the included plugins.

#### Uninstall
From within this directory (in `$HOME/.dotfiles`) run `./clean-env`.
