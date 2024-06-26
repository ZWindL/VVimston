local M = {}

M.icons = {
    vscode = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
    },
    separators = {
        rightArrow = '  ',
        doubleRightArrow = '»',
        smallRightArrow = '➜',
    },
    arrows = {
        rightArrow = '',
        doubleRighArrow = '»',
        smallRightArrow = '➜',
    },
    ui = {
        plusSquare = ' ',
        plus = '+',
    },
}

M.lsp_servers = {
    "lua_ls", "rust_analyzer",
    "angularls", "ansiblels", "bashls",
    "clangd", "neocmake",
    "cssmodules_ls", "dockerls", "dotls", "emmet_ls",
    "gopls", "grammarly", "html", "jsonls",
    "tsserver", "jqls", "ltex",
    "autotools_ls", "spectral", "pylsp",
    "robotframework_ls", "ruby_lsp", "sqls", "svls",
    "taplo", "vimls", "vuels", "yamlls", "zls",
    -- "ocaml-lsp",
    -- "java_language_server",
    -- "hls",
    -- "asm_lsp",
    -- "pkgbuild_language_server",
}

return M
