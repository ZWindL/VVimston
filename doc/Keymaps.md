# Keybindings

Every keybinding should do its best stick to the principles.

1. Most often used functions are mapped to single key or `M-[x]`.
3. `<F1>` ~ `<F12>` are mapped to functions like LSP, compiler, etc.
2. Functions that are rather rarely used are mapped to `<leader>` groups.
    1. `<leader>t` for Toggles.
    2. `<leader>b` for Buffers.
    3. `[` and `]` stand for `prev/next`.

Keybindings are grouped into 3 types
1. Keys under `leader` key.
2. Keys following other keys.
3. Combined keys, which need to be pressed simultaneously.


Mappings led by certain keys (e.g. `<space>`) don't need to be memorized, as they can be easily listed using [which-key](https://github.com/folke/which-key.nvim).

**Leader key**: `<space>`

-------------------------------------------------------------------------
## Bindings under `<leader>`
### Plugin Manager (Lazy)
`<leader>p`: Plugin manager

### Buffers
`<leader>bb`: Switch to the most recent buffer
`<leader>bp`: Prev buffer
`<leader>bn`: Next buffer
`<leader>bD`: Close all but the current buffer
`<leader>bd`: Close buffer
`<leader>bf`: Buffer magic picker (finder)
#### Order buffers
`<leader>bob`: Order buffers by buf number
`<leader>bon`: Order buffers by name
`<leader>bod`: Order buffers by directory
`<leader>bol`: Order buffers by language
`<leader>bow`: Order buffers by window number

### Misc
#### Mason lsp package manager
`<leader>mm`: Mason

### Files

### LSP

### Quick Fix

### Replace

### Search

### Toggles

### Undo

### Windows

### Spelling

### Tabs

-------------------------------------------------------------------------
## Bindings under `[` & `]`
Square brackets usually means `prev/next`.

### Buffers
`]b`: Next buffer
`[b`: Prev buffer

-------------------------------------------------------------------------
## Bindings under `g`
### Treesitter selections
`gts`: Start selecting nodes with TS
`gtn`: Select node incrementally
`gts`: Select scope incrementally
`gtd`: Decrement selection

-------------------------------------------------------------------------
## Combined keybindings
### Buffers
`<a-{1..9}>`: Buffer 1 ~ 9
`<a-0>`: Last buffer
`<a-p>`: Buffer magic picker

-------------------------------------------------------------------------
## Plugin-specific keybindings
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

-------------------------------------------------------------------------
## Misc
`q`, `n`: close help/dap/man... window.
