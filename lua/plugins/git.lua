-- Git integration
return {
	-- Show git blame buffer
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Open git blame buffer" })
		end,
	},
	-- Git gutter and git actions
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gs = require("gitsigns")

			gs.setup()

			vim.keymap.set("n", "<leader>gh", gs.preview_hunk, { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
			vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo staged hunk" })
			vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
			vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
			vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
			vim.keymap.set("n", "<leader>gn", gs.next_hunk, { desc = "Jump to next hunk" })
			vim.keymap.set("n", "<leader>gp", gs.prev_hunk, { desc = "Jump to previous hunk" })
			-- vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, {desc = "Show git blame for current line"})
		end,
	},
}
