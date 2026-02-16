vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 100

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.keymap.set("n", "<leader>/", ":noh<cr>", {})

vim.cmd("nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')")
vim.cmd("nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')")

vim.keymap.set("n", "<leader>z", ":set spell spelllang=en_us<CR>")
vim.keymap.set("n", "<leader>zr", ":set nospell<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = True, silent = True })
