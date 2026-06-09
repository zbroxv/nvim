-- Configure linters and formatters
local function get_max_line_length()
	local cur_dir = vim.fs.root(0, {
		".black",
		"ruff.toml",
		".flake8",
		"tox.ini",
	})

	if not cur_dir then
		return nil
	end

	local config_files = { cur_dir .. "/.black", cur_dir .. "/ruff.toml", cur_dir .. "/.flake8", cur_dir .. "/tox.ini" }

	local data = nil

	for _, file_path in ipairs(config_files) do
		local flake_file = io.open(file_path, "r")
		if flake_file then
			data = flake_file:read("*a")
			flake_file:close()
			break
		end
	end

	if not data then
		return nil
	end

	local max = string.match(data, "line%-length%s*=%s*(%d+)")
	if not max then
		max = string.match(data, "max%-line%-length%s*=%s*(%d+)")
	end

	return tonumber(max)
end

-- Sets up linters and formatters to appear as LSPs to Neovim
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local max_line_length = get_max_line_length()
		if max_line_length then
			vim.opt.colorcolumn = tostring(max_line_length + 1)
		-- vim.cmd("set colorcolumn=" .. max_line_length + 1)
		else
			max_line_length = 79
		end
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black.with({
					extra_args = { "--line-length=" .. max_line_length },
				}),
				null_ls.builtins.formatting.isort.with({
					extra_args = { "--line-length=" .. max_line_length },
				}),
				require("none-ls.diagnostics.flake8").with({
					diagnostic_config = {
						virtual_text = false,
						signs = true,
						update_in_insert = true,
						underline = true,
					},
					extra_args = {
						"--max-line-length=" .. max_line_length,
						"ignore=...",
					},
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format the current buffer" })
	end,
}
