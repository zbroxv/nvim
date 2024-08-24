local git_gutter = {
  "airblade/vim-gitgutter",
  config = function()
    vim.cmd("let g:gitgutter_sign_priority = 0")
    vim.cmd("let g:gitgutter_realtime = 1")
    vim.cmd("let g:git_gutter_eager = 1")
  end,
}
return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", {})
      vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", {})
      -- vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
}