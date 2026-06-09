-- Directory tree system
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
            vim.opt_local.relativenumber = True
					end,
				},
			},
			close_if_last_window = true,
			window = {
				width = 40,
				mappings = {
					-- ["gu"] = "git_unstage_file",
					-- ["ga"] = "git_add_file",
					-- ["gr"] = "git_revert_file",
					-- ["gc"] = "git_commit",
					-- ["gp"] = "git_push",
					-- ["gg"] = "git_commit_and_push",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle reveal left<CR>", { desc = "Open Neotree"})
	end,
}
