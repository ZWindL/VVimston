return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        vim.cmd [[:TSUpdate]]
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash", "c", "c_sharp", "clojure", "cmake", "comment", "commonlisp",
                "cpp", "css", "cuda", "dart", "dockerfile", "dot", "erlang", "fennel",
                "fish", "go", "gomod", "graphql", "haskell", "hcl", "html",
                "http", "java", "javascript", "json", "json5", "jsonc", "julia",
                "kotlin", "llvm", "lua", "make", "markdown", "ninja", "nix",
                "ocaml", "pascal", "perl", "php", "phpdoc", "python",
                "query", "r", "regex", "rst", "ruby", "rust", "scala", "scheme", "scss",
                "toml", "typescript", "vala", "verilog", "vim", "vue", "yaml"
            },
            async_install = true,
            auto_install = true,
        }
    end,
}