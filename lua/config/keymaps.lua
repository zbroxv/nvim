-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Easy pane traversal with <ctrl>hjkl
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Turn off search highlighting with <leader>/
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Traverse wrapped text with jk
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true })

-- Toggle on spellcheck with <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>set spell spelllang=en_us<CR>", { desc = "Toggle on spell checking" })

-- Toggle off spellcheck with <leader>zr
vim.keymap.set("n", "<leader>zr", "<cmd>set nospell<CR>", { desc = "Toggle off spell checking" })

-- Leave insert mode with <ctrl>c acts as <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")
