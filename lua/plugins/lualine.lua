-- Pretty status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.opt.showmode = false
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_c = { { "filename", path = 1 } },
			},
		})
	end,
}
