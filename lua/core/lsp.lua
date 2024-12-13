-- LSP Config moved to here since lspconfig is no longer required
-- This file does nothing more than config options and setting keymaps

local utils = require("core.utils")
local constants = require("core.constants")
local server_settings = require("plugins.lsp.lang_settings")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local icons = constants.icons

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
