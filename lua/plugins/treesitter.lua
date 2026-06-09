--
return {
  "nvim-treesitter/nvim-treesitter",
  tag="v0.10.0",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

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
        "rust",
        "json",
        "yaml",
        "toml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99
  end,
}

