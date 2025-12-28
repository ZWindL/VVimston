local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		-- Disable entire built-in ftplugin mappings to avoid conflicts.
		-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true,
			},
		})

		-- Keymaps

		-- Select
		local t_select = require("nvim-treesitter-textobjects.select").select_textobject
		local select_maps = {
			["aal"] = { query = "@assignment.lhs", query_group = "textobjects", desc = "Select assignment lhs" },
			["aar"] = { query = "@assignment.rhs", query_group = "textobjects", desc = "Select assignment rhs" },
			["aaa"] = { query = "@assignment.outer", query_group = "textobjects", desc = "Select a assignment" },
			["ia"] = { query = "@assignment.inner", query_group = "textobjects", desc = "Select inner assignment" },
			["ac"] = { query = "@class.outer", query_group = "textobjects", desc = "Select a class" },
			["ic"] = { query = "@class.inner", query_group = "textobjects", desc = "Select inner class" },
			["af"] = { query = "@function.outer", query_group = "textobjects", desc = "Select a function" },
			["if"] = { query = "@function.inner", query_group = "textobjects", desc = "Select inner function" },
			["a/"] = { query = "@comment.outer", query_group = "textobjects", desc = "Select a comment" },
			["i/"] = { query = "@comment.inner", query_group = "textobjects", desc = "Select a inner comment" },
			["ad"] = { query = "@conditional.outer", query_group = "textobjects", desc = "Select a conditional" },
			["id"] = { query = "@conditional.inner", query_group = "textobjects", desc = "Select inner conditional" },
			["ao"] = { query = "@loop.outer", query_group = "textobjects", desc = "Select a loop" },
			["io"] = { query = "@loop.inner", query_group = "textobjects", desc = "Select inner loop" },
			["ap,"] = { query = "@parameter.outer", query_group = "textobjects", desc = "Select a parameter" },
			["ip,"] = { query = "@parameter.inner", query_group = "textobjects", desc = "Select inner parameter" },
			["ar"] = { query = "@return.outer", query_group = "textobjects", desc = "Select a return" },
			["ir"] = { query = "@return.inner", query_group = "textobjects", desc = "Select inner return" },
			["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
		}

		for lhs, mapping in pairs(select_maps) do
			map({ "x", "o" }, lhs, function()
				t_select(mapping.query, mapping.query_group)
			end, { desc = mapping.desc })
		end

		-- Swap
		local t_swap_next = require("nvim-treesitter-textobjects.swap").swap_next
		local t_swap_previous = require("nvim-treesitter-textobjects.swap").swap_previous

		local swap_next_maps = {
			["gs]a"] = { query = "@assignment.outer", desc = "Swap w/ next assignment" },
			["gs]it"] = { query = "@attribute.inner", desc = "Swap w/ next inner attr" },
			["gs]t"] = { query = "@attribute.outer", desc = "Swap w/ next attr" },
			["gs]ic"] = { query = "@class.inner", desc = "Swap w/ next inner class" },
			["gs]c"] = { query = "@class.outer", desc = "Swap w/ next class" },
			["gs]i/"] = { query = "@comment.inner", desc = "Swap w/ next inner comment" },
			["gs]/"] = { query = "@comment.outer", desc = "Swap w/ next comment" },
			["gs]id"] = { query = "@conditional.inner", desc = "Swap w/ next inner conditional" },
			["gs]d"] = { query = "@conditional.outer", desc = "Swap w/ next conditional" },
			["gs]if"] = { query = "@function.inner", desc = "Swap w/ next inner function" },
			["gs]f"] = { query = "@function.outer", desc = "Swap w/ next function" },
			["gs]io"] = { query = "@loop.inner", desc = "Swap w/ next inner loop" },
			["gs]o"] = { query = "@loop.outer", desc = "Swap w/ next loop" },
			["gs]i,"] = { query = "@parameter.inner", desc = "Swap w/ next inner parameter" },
			["gs],"] = { query = "@parameter.outer", desc = "Swap w/ next parameter" },
			["gs]ir"] = { query = "@return.inner", desc = "Swap w/ next inner return" },
			["gs]r"] = { query = "@return.outer", desc = "Swap w/ next return" },
		}
		local swap_previous_maps = {
			["gs[a"] = { query = "@assignment.outer", desc = "Swap w/ prev assignment" },
			["gs[it"] = { query = "@attribute.inner", desc = "Swap w/ prev inner attr" },
			["gs[t"] = { query = "@attribute.outer", desc = "Swap w/ prev attr" },
			["gs[ic"] = { query = "@class.inner", desc = "Swap w/ prev inner class" },
			["gs[c"] = { query = "@class.outer", desc = "Swap w/ prev class" },
			["gs[i/"] = { query = "@comment.inner", desc = "Swap w/ prev inner comment" },
			["gs[/"] = { query = "@comment.outer", desc = "Swap w/ prev comment" },
			["gs[id"] = { query = "@conditional.inner", desc = "Swap w/ prev inner conditional" },
			["gs[d"] = { query = "@conditional.outer", desc = "Swap w/ prev conditional" },
			["gs[if"] = { query = "@function.inner", desc = "Swap w/ prev inner function" },
			["gs[f"] = { query = "@function.outer", desc = "Swap w/ prev function" },
			["gs[io"] = { query = "@loop.inner", desc = "Swap w/ prev inner loop" },
			["gs[o"] = { query = "@loop.outer", desc = "Swap w/ prev loop" },
			["gs[i,"] = { query = "@parameter.inner", desc = "Swap w/ prev inner parameter" },
			["gs[,"] = { query = "@parameter.outer", desc = "Swap w/ prev parameter" },
			["gs[ir"] = { query = "@return.inner", desc = "Swap w/ prev inner return" },
			["gs[r"] = { query = "@return.outer", desc = "Swap w/ prev return" },
		}

		for lhs, mapping in pairs(swap_next_maps) do
			map("n", lhs, function()
				t_swap_next(mapping.query)
			end, { desc = mapping.desc })
		end
		for lhs, mapping in pairs(swap_previous_maps) do
			map("n", lhs, function()
				t_swap_previous(mapping.query)
			end, { desc = mapping.desc })
		end

		-- Move
		local t_goto_next_start_map = {
			["]aa"] = { query = "@assignment.outer", desc = "Next assignment start" },
			["]ar"] = { query = "@assignment.rhs", desc = "Next assignment rhs start" },
			["]al"] = { query = "@assignment.lhs", desc = "Next assignment lhs start" },
			["]it"] = { query = "@attribute.inner", desc = "Next inner attribute start" },
			["]t"] = { query = "@attribute.outer", desc = "Next attribute start" },
			["]ic"] = { query = "@class.inner", desc = "Next inner class start" },
			["]c"] = { query = "@class.outer", desc = "Next class start" },
			["]//"] = { query = "@comment.outer", desc = "Next comment start" },
			["]id"] = { query = "@conditional.inner", desc = "Next inner conditional start" },
			["]d"] = { query = "@conditional.outer", desc = "Next conditional start" },
			["]if"] = { query = "@function.inner", desc = "Next inner function start" },
			["]f"] = { query = "@function.outer", desc = "Next function start" },
			["]io"] = { query = "@loop.inner", desc = "Next inner loop start" },
			["]o"] = { query = "@loop.outer", desc = "Next loop start" },
			["]i,"] = { query = "@parameter.inner", desc = "Next inner parameter start" },
			["],"] = { query = "@parameter.outer", desc = "Next parameter start" },
			["]ir"] = { query = "@return.inner", desc = "Next inner return start" },
			["]r"] = { query = "@return.outer", desc = "Next return start" },
			["]l"] = { query = "@statement.outer", desc = "Next statement start" },
		}

		local t_goto_next_start = require("nvim-treesitter-textobjects.move").goto_next_start
		for lhs, mapping in pairs(t_goto_next_start_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_next_start(mapping.query)
			end, { desc = mapping.desc })
		end

		local t_goto_next_end_map = {
			["]aA"] = { query = "@assignment.outer", desc = "Next assignment end" },
			["]aR"] = { query = "@assignment.rhs", desc = "Next assignment rhs end" },
			["]aL"] = { query = "@assignment.lhs", desc = "Next assignment lhs start" },
			["]iT"] = { query = "@attribute.inner", desc = "Next inner attribute end" },
			["]T"] = { query = "@attribute.outer", desc = "Next attribute end" },
			["]iC"] = { query = "@class.inner", desc = "Next inner class end" },
			["]C"] = { query = "@class.outer", desc = "Next class end" },
			["]/$"] = { query = "@comment.outer", desc = "Next comment end" },
			["]iD"] = { query = "@conditional.inner", desc = "Next inner conditional end" },
			["]D"] = { query = "@conditional.outer", desc = "Next conditional end" },
			["]iF"] = { query = "@function.inner", desc = "Next inner function end" },
			["]F"] = { query = "@function.outer", desc = "Next function end" },
			["]iO"] = { query = "@loop.inner", desc = "Next inner loop end" },
			["]O"] = { query = "@loop.outer", desc = "Next loop end" },
			["]i."] = { query = "@parameter.inner", desc = "Next inner parameter end" },
			["]."] = { query = "@parameter.outer", desc = "Next parameter end" },
			["]iR"] = { query = "@return.inner", desc = "Next inner return end" },
			["]R"] = { query = "@return.outer", desc = "Next return end" },
			["]L"] = { query = "@statement.outer", desc = "Next statement end" },
		}

		local t_goto_next_end = require("nvim-treesitter-textobjects.move").goto_next_end
		for lhs, mapping in pairs(t_goto_next_end_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_next_end(mapping.query)
			end, { desc = mapping.desc })
		end

		local t_goto_previous_start_map = {
			["[aa"] = { query = "@assignment.outer", desc = "Prev assignment start" },
			["[ar"] = { query = "@assignment.rhs", desc = "Prev assignment rhs start" },
			["[al"] = { query = "@assignment.lhs", desc = "Prev assignment lhs start" },
			["[it"] = { query = "@attribute.inner", desc = "Prev inner attribute start" },
			["[t"] = { query = "@attribute.outer", desc = "Prev attribute start" },
			["[ic"] = { query = "@class.inner", desc = "Prev inner class start" },
			["[c"] = { query = "@class.outer", desc = "Prev class start" },
			["[//"] = { query = "@comment.outer", desc = "Prev comment start" },
			["[id"] = { query = "@conditional.inner", desc = "Prev inner conditional start" },
			["[d"] = { query = "@conditional.outer", desc = "Prev conditional start" },
			["[if"] = { query = "@function.inner", desc = "Prev inner function start" },
			["[f"] = { query = "@function.outer", desc = "Prev function start" },
			["[io"] = { query = "@loop.inner", desc = "Prev inner loop start" },
			["[o"] = { query = "@loop.outer", desc = "Prev loop start" },
			["[i,"] = { query = "@parameter.inner", desc = "Prev inner parameter start" },
			["[,"] = { query = "@parameter.outer", desc = "Prev parameter start" },
			["[ir"] = { query = "@return.inner", desc = "Prev inner return start" },
			["[r"] = { query = "@return.outer", desc = "Prev return start" },
			["[l"] = { query = "@statement.outer", desc = "Prev statement start" },
		}

		local t_goto_previous_start = require("nvim-treesitter-textobjects.move").goto_previous_start
		for lhs, mapping in pairs(t_goto_previous_start_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_previous_start(mapping.query)
			end, { desc = mapping.desc })
		end

		local t_goto_previous_end_map = {
			["[aA"] = { query = "@assignment.outer", desc = "Prev assignment end" },
			["[aR"] = { query = "@assignment.rhs", desc = "Prev assignment rhs end" },
			["[aL"] = { query = "@assignment.lhs", desc = "Prev assignment lhs start" },
			["[iT"] = { query = "@attribute.inner", desc = "Prev inner attribute end" },
			["[T"] = { query = "@attribute.outer", desc = "Prev attribute end" },
			["[iC"] = { query = "@class.inner", desc = "Prev inner class end" },
			["[C"] = { query = "@class.outer", desc = "Prev class end" },
			["[/$"] = { query = "@comment.outer", desc = "Prev comment end" },
			["[iD"] = { query = "@conditional.inner", desc = "Prev inner conditional end" },
			["[D"] = { query = "@conditional.outer", desc = "Prev conditional end" },
			["[iF"] = { query = "@function.inner", desc = "Prev inner function end" },
			["[F"] = { query = "@function.outer", desc = "Prev function end" },
			["[iO"] = { query = "@loop.inner", desc = "Prev inner loop end" },
			["[O"] = { query = "@loop.outer", desc = "Prev loop end" },
			["[i."] = { query = "@parameter.inner", desc = "Prev inner parameter end" },
			["[."] = { query = "@parameter.outer", desc = "Prev parameter end" },
			["[iR"] = { query = "@return.inner", desc = "Prev inner return end" },
			["[R"] = { query = "@return.outer", desc = "Prev return end" },
			["[L"] = { query = "@statement.outer", desc = "Prev statement end" },
		}

		local t_goto_previous_end = require("nvim-treesitter-textobjects.move").goto_previous_end
		for lhs, mapping in pairs(t_goto_previous_end_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_previous_end(mapping.query)
			end, { desc = mapping.desc })
		end

		-- Below will go to either the start or the end, whichever is closer.
		local t_goto_next_map = {
			["]]aa"] = { query = "@assignment.outer", desc = "Next assignment" },
			["]]ar"] = { query = "@assignment.rhs", desc = "Next assignment rhs" },
			["]]al"] = { query = "@assignment.lhs", desc = "Next assignment lhs" },
			["]]it"] = { query = "@attribute.inner", desc = "Next inner attribute" },
			["]]t"] = { query = "@attribute.outer", desc = "Next attribute" },
			["]]ic"] = { query = "@class.inner", desc = "Next inner class" },
			["]]c"] = { query = "@class.outer", desc = "Next class" },
			["]]/"] = { query = "@comment.outer", desc = "Next comment" },
			["]]id"] = { query = "@conditional.inner", desc = "Next inner conditional" },
			["]]d"] = { query = "@conditional.outer", desc = "Next conditional" },
			["]]if"] = { query = "@function.inner", desc = "Next inner function" },
			["]]f"] = { query = "@function.outer", desc = "Next function" },
			["]]io"] = { query = "@loop.inner", desc = "Next inner loop" },
			["]]o"] = { query = "@loop.outer", desc = "Next loop" },
			["]]i,"] = { query = "@parameter.inner", desc = "Next inner parameter" },
			["]],"] = { query = "@parameter.outer", desc = "Next parameter" },
			["]]ir"] = { query = "@return.inner", desc = "Next inner return" },
			["]]r"] = { query = "@return.outer", desc = "Next return" },
			["]]l"] = { query = "@statement.outer", desc = "Next statement" },
		}

		local t_goto_next = require("nvim-treesitter-textobjects.move").goto_next
		for lhs, mapping in pairs(t_goto_next_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_next(mapping.query)
			end, { desc = mapping.desc })
		end

		local t_goto_previous_map = {
			["[[a"] = { query = "@assignment.outer", desc = "Prev assignment" },
			["[[ra"] = { query = "@assignment.rhs", desc = "Prev assignment rhs" },
			["[[al"] = { query = "@assignment.lhs", desc = "Prev assignment lhs" },
			["[[it"] = { query = "@attribute.inner", desc = "Prev inner attribute" },
			["[[t"] = { query = "@attribute.outer", desc = "Prev attribute" },
			["[[ic"] = { query = "@class.inner", desc = "Prev inner class" },
			["[[c"] = { query = "@class.outer", desc = "Prev class" },
			["[[/"] = { query = "@comment.outer", desc = "Prev comment" },
			["[[id"] = { query = "@conditional.inner", desc = "Prev inner conditional" },
			["[[d"] = { query = "@conditional.outer", desc = "Prev conditional" },
			["[[if"] = { query = "@function.inner", desc = "Prev inner function" },
			["[[f"] = { query = "@function.outer", desc = "Prev function" },
			["[[io"] = { query = "@loop.inner", desc = "Prev inner loop" },
			["[[o"] = { query = "@loop.outer", desc = "Prev loop" },
			["[[i,"] = { query = "@parameter.inner", desc = "Prev inner parameter" },
			["[[,"] = { query = "@parameter.outer", desc = "Prev parameter" },
			["[[ir"] = { query = "@return.inner", desc = "Prev inner return" },
			["[[r"] = { query = "@return.outer", desc = "Prev return" },
			["[[l"] = { query = "@statement.outer", desc = "Prev statement" },
		}

		local t_goto_previous = require("nvim-treesitter-textobjects.move").goto_previous
		for lhs, mapping in pairs(t_goto_previous_map) do
			map({ "n", "x", "o" }, lhs, function()
				t_goto_previous(mapping.query)
			end, { desc = mapping.desc })
		end

		-- add groups for keymaps
		map_group({ "n", "x", "o" }, "gs", "Swap TS Objects")
		map_group({ "n", "x", "o" }, "gs]", "Swap w/ next TS Object")
		map_group({ "n", "x", "o" }, "gs[", "Swap w/ prev TS Object")
		map_group({ "n", "x", "o" }, "gs]i", "Swap w/ next inner TS Object")
		map_group({ "n", "x", "o" }, "gs[i", "Swap w/ prev inner TS Object")

		map_group({ "n", "x", "o" }, "[[", "Prev nearest TS Object")
		map_group({ "n", "x", "o" }, "]]", "Next nearest TS Object")
		map_group({ "n", "x", "o" }, "[i", "Prev inner TS Object")
		map_group({ "n", "x", "o" }, "]i", "Next inner TS Object")

		map_group({ "n", "x", "o" }, "]a", "Next assignment")
		map_group({ "n", "x", "o" }, "[a", "Prev assignment")
		map_group({ "n", "x", "o" }, "]/", "Next comment")
		map_group({ "n", "x", "o" }, "[/", "Prev comment")

		-- local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
		--
		-- -- Repeat movement with ; and ,
		-- -- ensure ; goes forward and , goes backward regardless of the last direction
		-- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
		--
		-- -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		-- map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		-- map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		-- map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		-- map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
