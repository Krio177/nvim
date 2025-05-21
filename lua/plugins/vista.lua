return {
  "liuchengxu/vista.vim",
  event = "VeryLazy",
  keys = {
    { "<leader>cv", ":Vista!!<CR>", desc = "Toggle Vista" },
  },
  config = function()
    vim.g.vista_default_executive = "ctags"
  end,
}
