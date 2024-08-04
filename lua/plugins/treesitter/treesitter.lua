local utils = require("core.utils")
local map_group = utils.add_keymap_group

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        vim.cmd("TSUpdate")
        map_group("n", "gt", "TreeSitter Select", " ")
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash", "c", "c_sharp", "clojure", "cmake", "comment", "commonlisp",
                "cpp", "css", "cuda", "dart", "dockerfile", "dot", "erlang", "fennel",
                "fish", "go", "gomod", "graphql", "haskell", "hcl", "html",
                "http", "java", "javascript", "json", "json5", "jsonc", "julia",
                "kotlin", "llvm", "lua", "make", "markdown", "markdown_inline",
                "ninja", "nix",
                "ocaml", "pascal", "perl", "php", "phpdoc", "python",
                "query", "r", "regex", "rst", "ruby", "rust", "scala", "scheme", "scss",
                "toml", "typescript", "vala", "verilog", "vim", "vue", "yaml"
            },
            async_install = true,
            auto_install = true,

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gts",
                    node_incremental = "gtn",
                    scope_incremental = "gts",
                    node_decremental = "gtd",
                }
            }
        }
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
}
