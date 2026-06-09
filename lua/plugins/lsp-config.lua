-- LSPs, linters, and formatters
return {
  -- LSP, linter, and formatter installation
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
  -- Auto install LSPs
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"clangd",
				"bashls",
				"glslls",
				"rust_analyzer",
			},
		},
	},
  -- Auto install linters and formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"black",
				"isort",
				"flake8",
				"stylua",
			},
		},
	},
  -- Configure LSPs
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},

						typeCheckingMode = "standard",
						-- reportUnknownMemberType = false,
					},
				},
				capabilities = capabilities,
			})
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})
			vim.lsp.config("glslls", {
				capabilities = capabilities,
			})
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})
			vim.filetype.add({ extension = { vert = "glsl", frag = "glsl" } })

			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = true,
				underline = true,
				signs = {
					text = {
						-- 
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			})

			local diagnostics_active = true
			local function toggle_diagnostics()
				diagnostics_active = not diagnostics_active
				vim.diagnostic.enable(diagnostics_active)
			end

			vim.keymap.set("n", "<leader>tt", toggle_diagnostics, { desc = "Toggle diagnostics" })

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open documentation" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code actions" })
			vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
			vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
		end,
	},
}
