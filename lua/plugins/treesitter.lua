return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.config")

    configs.setup({
      ensure_installed = {
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
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

  vim.opt.foldlevel = 20
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter folds
  end,
}

