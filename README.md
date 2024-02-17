# My bromide Neovim configuration in Lua

TODO: screenshots here

## Introduction
A configuration inspired by [LazyVim](https://github.com/LazyVim/LazyVim) and [Sergio's config](https://bitbucket.org/sergio/mylazy-nvim).

- Modern
- Modular
- Documented

This config requires Neovim >= 0.9

## Installation
Backup your existing config with `mv ~/.config/nvim{,.bak}`
Run `git clone https://github.com/ZWindL/.nvim.git ~/.config/nvim`

## File Structure
```
.
├── init.lua
├── lua
│   ├── autocmd.lua
│   ├── mappings.lua
│   ├── neovide_options.lua
│   ├── options.lua
│   ├── plugconfs
│   │   ├── autopairs.lua
│   │   ├── blankline.lua
│   │   ├── bufferline.lua
│   │   ├── cheatsheet.lua
│   │   ├── cmp.lua
│   │   ├── vim-table.lua
│   │   ├── which.lua
│   │   └── zen-mode.lua
│   └── plugins.lua
├── README.md
├── settings.json
└── snippets
```

## Plugins
### Themes
### UI Enhancement
TBD

## Troubleshooting

## Todos
- https://github.com/simrat39/rust-tools.nvim/

## Known issues
### copilot
It needs an older version of node.js to run.

The key `TAB` can't work properly, investigating.
