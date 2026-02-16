return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "basedpyright", },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function get_venv_path()
        local cwd = vim.fn.getcwd()
        return cwd .. "/venv"
      end

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright= {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
            venvPath = get_venv_path(),
            venv = "venv",

            typeCheckingMode = "standard",
            -- reportUnknownMemberType = false,
          },
        },
        capabilites = capabilities,
      })
      vim.lsp.config("clangd", {
        capabilites = capabilities,
      })
      vim.lsp.config("bashls", {
        capabilites = capabilities,
      })
      vim.lsp.config("glslls", {
        capabilities = capabilities,
      })
      vim.filetype.add({ extension = { vert = "glsl", frag = "glsl" } })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev)


      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            update_in_insert = true,
            underline = true,
          })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

      vim.diagnostic.config({
        signs = {
          text = {
            -- 
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          -- linehl = {
          --   [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          -- },
          -- numhl = {
          --   [vim.diagnostic.severity.WARN] = 'WarningMsg',
          -- },
        },
      })

      vim.g.diagnostics_active = true
      function _G._toggle_diagnostics()
        if vim.g.diagnostics_active then
          vim.g.diagnostics_active = false
          vim.diagnostic.reset()
          vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
        else
          vim.g.diagnostics_active = true
          vim.lsp.handlers["textDocument/publishDiagnostics"] =
              vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                signs = true,
                update_in_insert = true,
                underline = true,
              })
          vim.cmd("LspRestart")
        end
      end

      vim.keymap.set("n", "<leader>tt", ":lua _G._toggle_diagnostics()<CR>", { noremap = true, silent = true })
    end,
  },
}
