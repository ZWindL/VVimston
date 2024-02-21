# My Neovim configuration in Lua

TODO: screenshots here

## Introduction
A configuration inspired by [LazyVim](https://github.com/LazyVim/LazyVim) and [Sergio's config](https://bitbucket.org/sergio/mylazy-nvim).
Also has flavors from [Allaman's Nvim config](https://github.com/Allaman/nvim/tree/main)

- Modern: Using Lua as the config language, and adopting as much fancy features in the new version of Neovim as possible.
- Modular: The config of different aspect are splitted into different files.
- Documented: The goal is to eaily recall what this line/file does.

**This config requires Neovim >= 0.9**

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

## Features
### Themes

### UI Enhancement
- Theming Nvim splash screen: [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)

### Tools
- Auto remove incsearch highlight: [hlsearch](github.com/nvimdev/hlsearch.nvim)

### Dev tools
#### Lsp related tools
- Lsp UI enhancement: [lspsaga](https://github.com/nvimdev/lspsaga.nvim)

#### Other useful tools

## Dependencies

## Todos
- https://github.com/simrat39/rust-tools.nvim/

## Known issues
### copilot
It needs an older version of node.js to run.

The key `TAB` can't work properly, investigating.
