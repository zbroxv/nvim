-- Set up Neovim pane movement to work seamlessly with tmux panes
return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "left to Neovim or tmux pane" }),
	vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Move down to Neovim or tmux pane" }),
	vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Move up to Neovim or tmux pane" }),
	vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Move right to Neovim or tmux pane" }),
}
