-- Fuzzy find config
return {
	-- Adds fuzzy find window and keybinds
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Fuzzy find text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Display help tags" })
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep for current string" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
			vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Find diagnostics" })
			vim.keymap.set(
				"n",
				"<leader>fc",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Fuzzy find in the current buffer" }
			)
		end,
	},
	-- Sets telescope picker as default ui picker
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
