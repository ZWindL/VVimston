local M = {}

M.icons = {
    vscode = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
    },
    separators = {
        rightArrow = "  ",
        doubleRightArrow = "»",
        smallRightArrow = "➜",
    },
    arrows = {
        rightArrow = "",
        doubleRighArrow = "»",
        smallRightArrow = "➜",
    },
    ui = {
        plusSquare = " ",
        plus = "+",
    },
    common = {
        colorscheme = " ",
        edit = "󰷉 ",
        order = "󰈍 ",
        file = " ",
        format = "󰸱 ",
        git = " ",
        lambda = "󰘧",
        misc = " ",
        magic = "󰁨 ",
        replace = "󰬳 ",
        search = " ",
        toggle = " ",
        window = " ",
        spelling = "󰓆 ",
        tab = "󰓩 ",
        undo = "󰕍 ",
        notifi = "󱥁 ",
        error = " ",
        warn = " ",
        info = " ",
        hint = "󰌵",
        anchor = "󰀱",
    },
}

--- List of LspInfos (language server info)
---@class LspInfo
---@field name string The name of the language server
---@field mason_alias string The alias of the language server in mason
---@field ensure_to_install boolean Default is true
---@field force_enable boolean Default is true
---
---@field lsp_servers (LspInfo|string)[] List of LspInfos
M.lsp_servers = {
    -- use rustaceanvim
    -- "rust_analyzer",

    "lua_ls",
    {
        name = "angularls",
        ensure_to_install = false,
        force_enable = false,
    },
    "ansiblels",
    "bashls",
    "clangd",
    "neocmake",
    "cssmodules_ls",
    "dockerls",
    {
        name = "dotls",
        ensure_to_install = false,
    },
    "emmet_ls",
    "gopls",
    -- "grammarly",
    "html",
    "jsonls",
    "ts_ls",
    "jqls",
    "ltex",
    "autotools_ls",
    "spectral",
    "pylsp",
    "robotframework_ls",
    "ruby_lsp",
    "sqls",
    "svls",
    "taplo",
    "vimls",
    "vuels",
    "yamlls",
    "zls",
    "phpactor",
    {
        name = "racket-langserver",
        ensure_to_install = false,
        force_enable = true,
    },

    -- {
    --        name = "phpactor",
    --        lang = "php",
    --    },
    -- "ocaml-lsp",
    -- "java_language_server",
    -- "hls",
    -- "asm_lsp",
    -- "pkgbuild_language_server",
}

---List of language servers that are ensured to install, used by mason.
---@return string[]
M.lsp_servers_ensure_to_install = function()
    local list = {}
    for _, lsp in ipairs(M.lsp_servers) do
        if type(lsp) == "string" then
            table.insert(list, lsp)
        else
            if lsp.ensure_to_install then
                table.insert(list, lsp.name)
            end
        end
    end
    return list
end

---List of language server names
---@return string[]
M.lsp_server_names = function()
    local list = {}
    for _, lsp in ipairs(M.lsp_servers) do
        if type(lsp) == "string" then
            table.insert(list, lsp)
        else
            table.insert(list, lsp.name)
        end
    end
    return list
end

---List of language servers that are forced to enable
---@return string[]
M.lsp_servers_force_enable = function()
    local list = {}
    for _, lsp in ipairs(M.lsp_servers) do
        if type(lsp) == "table" and lsp.force_enable then
            table.insert(list, lsp.name)
        end
    end
    return list
end

-- Treesitters
M.ts_src = {
    "bash",
    "c",
    "c_sharp",
    "clojure",
    "cmake",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "cuda",
    "dart",
    "dockerfile",
    "dot",
    "erlang",
    "fennel",
    "fish",
    "go",
    "gomod",
    "graphql",
    "haskell",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "julia",
    "kotlin",
    "llvm",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "ocaml",
    "pascal",
    "perl",
    "php",
    "phpdoc",
    "python",
    "query",
    "r",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scheme",
    "scss",
    "toml",
    "typescript",
    "vala",
    "verilog",
    "vim",
    "vue",
    "yaml",
}

return M
