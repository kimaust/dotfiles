return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = {
							query = "@function.outer",
							desc = "Select outer part of a function",
						},
						["if"] = {
							query = "@function.inner",
							desc = "Select inner part of a function",
						},
						["acl"] = {
							query = "@class.outer",
							desc = "Select outer part of a class",
						},
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["icl"] = {
							query = "@class.inner",
							desc = "Select inner part of a class region",
						},
						-- You can also use captures from other query groups like `locals.scm`
						["as"] = {
							query = "@scope",
							query_group = "locals",
							desc = "Select language scope",
						},
						["a="] = {
							query = "@assignment.outer",
							desc = "Select outer part of an assignment",
						},
						["i="] = {
							query = "@assignment.inner",
							desc = "Select inner part of an assginment",
						},
						["l="] = {
							query = "@assignment.lhs",
							desc = "Select lhs of an assignment",
						},
						["r="] = {
							query = "@assignment.rhs",
							desc = "Select rhs of an assignment",
						},
						["apa"] = {
							query = "@parameter.outer",
							desc = "Select outer part of a parameter",
						},
						["ipa"] = {
							query = "@parameter.inner",
							desc = "Select inner part of a parameter",
						},
						["aco"] = {
							query = "@conditional.outer",
							desc = "Select outer part of a conditional",
						},
						["ico"] = {
							query = "@conditional.inner",
							desc = "Select inner part of a conditional",
						},
						["al"] = {
							query = "@loop.outer",
							desc = "Select outer part of a loop",
						},
						["il"] = {
							query = "@loop.inner",
							desc = "Select inner part of a loop",
						},
						["afc"] = {
							query = "@call.outer",
							desc = "Select function call",
						},
						["ifc"] = {
							query = "@call.inner",
							desc = "Select inner function call",
						},
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "v",
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = true,
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>snp"] = "@parameter.inner",
						["<leader>snf"] = "@function.outer",
					},
					swap_previous = {
						["<leader>spp"] = "@parameter.inner",
						["<leader>spf"] = "@function.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = {
							query = "@function.outer",
							desc = "Next function start",
						},
						["]c"] = {
							query = "@call.outer",
							desc = "Next function call start",
						},
						["]a"] = {
							query = "@parameter.outer",
							desc = "Next argument start",
						},
						-- ["]c"] = {
						-- 	query = "@class.outer",
						-- 	desc = "Next class start",
						-- },
						["]i"] = {
							query = "@conditional.outer",
							desc = "Next conditional start",
						},
						["]l"] = {
							query = "@loop.outer",
							desc = "Next loop start",
						},
					},
					goto_next_end = {
						["]F"] = {
							query = "@function.outer",
							desc = "Next function end",
						},
						["]C"] = {
							query = "@call.outer",
							desc = "Next function call end",
						},
						["]A"] = {
							query = "@parameter.outer",
							desc = "Next argument end",
						},
						-- ["]C"] = {
						-- 	query = "@class.outer",
						-- 	desc = "Next class end",
						-- },
						["]I"] = {
							query = "@conditional.outer",
							desc = "Next conditional end",
						},
						["]L"] = {
							query = "@loop.outer",
							desc = "Next loop end",
						},
					},
					goto_previous_start = {
						["[f"] = {
							query = "@function.outer",
							desc = "Previous function start",
						},
						["[c"] = {
							query = "@call.outer",
							desc = "Previous function call start",
						},
						["[a"] = {
							query = "@parameter.outer",
							desc = "Previous argument start",
						},
						-- ["[c"] = {
						-- 	query = "@class.outer",
						-- 	desc = "Previous class start",
						-- },
						["[i"] = {
							query = "@conditional.outer",
							desc = "Previous conditional start",
						},
						["[l"] = {
							query = "@loop.outer",
							desc = "Previous loop start",
						},
					},
					goto_previous_end = {
						["[C"] = {
							query = "@call.outer",
							desc = "Previous function call end",
						},
						["[F"] = {
							query = "@function.outer",
							desc = "Previous function end",
						},
						["[A"] = {
							query = "@parameter.outer",
							desc = "Previous argument end",
						},
						-- ["[C"] = {
						-- 	query = "@class.outer",
						-- 	desc = "Previous class end",
						-- },
						["[I"] = {
							query = "@conditional.outer",
							desc = "Previous conditional end",
						},
						["[L"] = {
							query = "@loop.outer",
							desc = "Previous loop end",
						},
					},
				},
				lsp_interop = {
					enable = true,

					border = "none",
					floating_preview_opts = {},
					peek_definition_code = {
						["<leader>df"] = "@function.outer",
						["<leader>dc"] = "@class.outer",
					},
				},
			},
		})
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- Repeat movement with ; and ,
		-- ensure ; goes forward and , goes backward regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		-- vim way: ; goes to the direction you were moving.
		-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
	end,
}
