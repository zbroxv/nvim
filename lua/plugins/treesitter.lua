-- Install treesitter parsers and configure code folding
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.install({
			"python",
			"cpp",
			"c",
			"cmake",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"html",
			"bash",
			"markdown",
			"markdown_inline",
			"glsl",
			"make",
			"rust",
			"json",
			"yaml",
			"toml",
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}
