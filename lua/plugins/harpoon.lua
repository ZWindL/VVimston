local constants = require("core.constants")
local map_group = require("core.utils").add_keymap_group
local map = require("core.utils").safe_keymap_set

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({ -- required
			cmd = {
				add = function(possible_value)
					-- get the current line idx
					local idx = vim.fn.line(".")

					-- read the current line
					local cmd = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
					if cmd == nil then
						return nil
					end

					return {
						value = cmd,
						context = {
							file_name = vim.fn.expand("%:t"),
						},
					}
				end,

				--- This function gets invoked with the options being passed in from
				--- list:select(index, <...options...>)
				-- select = function(list_item, list, option)
				--     vim.cmd(list_item.value)
				-- end
			},
		})

		local extensions = require("harpoon.extensions")
		harpoon:extend(extensions.builtins.highlight_current_file())
		-- harpoon:extend(extensions.builtins.command_on_nav("foo bar"));
		harpoon:extend(extensions.builtins.navigate_with_number())

		map_group({ "n", "v" }, "<leader>h", "Harpoon", constants.icons.common.anchor)

		map({ "n", "v" }, "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon add to list" })

		map("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon list" })

		map("n", "<A-1>", function()
			harpoon:list():select(1)
		end)
		map("n", "<A-2>", function()
			harpoon:list():select(2)
		end)
		map("n", "<A-3>", function()
			harpoon:list():select(3)
		end)
		map("n", "<A-4>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<A-[>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon prev" })
		map("n", "<A-]>", function()
			harpoon:list():next()
		end, { desc = "Harpoon next" })
	end,
}
