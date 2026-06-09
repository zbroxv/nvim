-- Line number
vim.opt.relativenumber = true
vim.opt.number = true

-- Default tab behavior
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1

-- Enable mouse support
vim.opt.mouse = "a"

-- Use operating system clipboard with yank
vim.opt.clipboard = "unnamedplus"

-- Wrapped lines keep indentation
vim.opt.breakindent = true

-- Persistent undo history
vim.opt.undofile = true

-- Ignore search case unless uppercase is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Reserve space for git signs, lsp diagnostics, etc
vim.opt.signcolumn = "yes"

-- Speed up update time
vim.opt.updatetime = 100

-- Split pane location
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Highlight current line
vim.opt.cursorline = true

-- Keep lines visible above and below the cursor
vim.opt.scrolloff = 10
