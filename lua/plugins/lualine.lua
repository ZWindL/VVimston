--[[
-- TODO: show hydra status on lualine
local hydra = require("hydra.statusline")

local hydra_status = function()
    if not hydra.is_active() then
        return ""
    end
    local icon = " "
    local name = hydra.get_name()
    print(icon .. name)
    return icon .. name
end
]]
--

local codeium = function()
	return vim.api.nvim_call_function("codeium#GetStatusString", {})
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"meuter/lualine-so-fancy.nvim",
		},
		config = function()
			-- local empty = require("lualine.component"):extend()

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					-- component_separators = {left = '', right = ''},
					-- section_separators = {left = '', right = ''},
					disabled_filetypes = { statusline = {}, winbar = {} },
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
				},
				sections = {
					lualine_a = {
						{ "fancy_mode", width = 3 },
					},
					lualine_b = {
						"fancy_branch",
						"fancy_diff",
						--{
						--    "diff",
						--    colored = true,
						--    diff_color = {
						--        added    = 'LuaLineDiffAdd',
						--        modified = 'LuaLineDiffChange',
						--        removed  = 'LuaLineDiffDelete',
						--    },
						--    symbols = {added = ' ', modified = ' ', removed = ' '},
						--}
					},
					lualine_c = {
						{ "fancy_cwd", substitute_home = true },
						{
							"filename",
							max_length = vim.o.columns * 2 / 3,
						},
					},
					lualine_x = {
						{ codeium },
						{ "fancy_macro" },
						{ "fancy_diagnostics" },
						{ "fancy_searchcount" },
					},
					lualine_y = {
						{ "encoding" },
						{ "fileformat" },
						{ "fancy_filetype", ts_icon = "" },
						{ "fancy_lsp_servers" },
					},
					lualine_z = {
						{ "progress" },
						{ "fancy_location" },
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = { "%f %y %m" },
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {
					"lazy",
					"mason",
					"man",
					"neo-tree",
					"nvim-dap-ui",
					"oil",
					"quickfix",
					"trouble",
				},
			})
		end,
	},
}
