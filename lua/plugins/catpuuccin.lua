-- Use the catppuccin macchiato color scheme
local use_catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local configs = require("catppuccin")

    configs.setup({
      flavour = "macchiato",
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

return use_catppuccin
