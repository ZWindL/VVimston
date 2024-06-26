# My Neovim configuration in Lua

TODO: screenshots here

## Introduction
A configuration inspired by [LazyVim](https://github.com/LazyVim/LazyVim) and [Sergio's config](https://bitbucket.org/sergio/mylazy-nvim).
Also mixed with flavors from [Allaman's Nvim config](https://github.com/Allaman/nvim/tree/main).

- Modern: Using Lua as the config language, and adopting as much fancy features in the new version of Neovim as possible.
- Modular: The configs of different aspects are splitted into different files.
- Documented: The goal is to eaily recall what this line/file does.

**This config requires Neovim >= 0.9**

## Installation
Backup your existing config with `mv ~/.config/nvim{,.bak}`
Run `git clone https://github.com/ZWindL/.nvim.git ~/.config/nvim`

## File Structure
```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazyplug.lua
│   │   ├── options.lua
│   │   └── utils.lua
│   ├── neovide_options.lua
│   └── plugins
│       ├── dashboard.lua
│       ├── lsp.lua
│       └── tools.lua
│       └── ...
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
`fswatch` for better performance while watching files.
`ttf-nerd-fonts-symbols` for symbols.

## Keybindings
### Global
leader key: `<space>`
*TODO: other mappings*

### Plugins
**coq**
`<c-space>`: manual complete
`<c-k>`: open preview in a bigger frame
`<c-h>`: jump to next placeholder
`<c-c>`: exit to normal edit

**nvim-cmp**
`<c-u>`: completion doc scroll back
`<c-d>`: completion doc scroll forward
`<c-f>`: snippet jump to next node
`<c-b>`: snippet jump to prev node
`<c-e>`: snippet switch choices
`<c-spc>`: trigger complete
`<c-c>`: abort complete
`<enter>`: confirm completion

**lsp raw keybindings**


### Misc
`q`, `n`: close help/dap/man... window.


## Known issues
### formatoptions
I want nvim not to auto-insert comment lead characters after pressing `o` or `O`, but does after hitting enter.
This can be configured via `vim.opt.formatoptions`, however it won't set `"r"` by operating directly on this
option as `vim.opt.formatoptions += "r"`, because options are table type. And if modify it by using
`vim.opt.formatoptions:append { "c", "q", "j", "r" }` inside `autoCmd` blocks, nvim reports "illegal character"
error. The workaround is to hardcode the value of `formatoptions` and remove the unwanted options by
`formatoptions:remove` inside`autoCmd`, although it's not recommended, see `:help formatoptions`.

### copilot
It needs an older version of node.js to run.

The key `TAB` can't work properly, investigating.
