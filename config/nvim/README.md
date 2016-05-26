A Sane, Modular (Neo)vim Configuration
==============================

## Installation

For a minimal installation, just link this directory into `~/.config/nvim`

To enable all plugins:
```
$ mkdir ~/.config/nvim/bundle
$ git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
$ nvim -c "PluginInstall"
```

CtrlP's custom matcher (enabled in `configs/ctrlp_matcher.vim`) requires
building matcher (which is contained as a submodule to this project). This is
highly recommended, as it is much faster than default CtrlP and the matching
logic is similar to the Command-T plugin:
```
$ make -C ~/.config/nvim/bin/matcher
```

To selectively enable some plugins, modify `~/.config/nvim/configs/options.vim`
before running `:PluginInstall`
