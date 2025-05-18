return {

  {
    "shrynx/line-numbers.nvim",
    lazy = false,
    config = function()
      require("line-numbers").setup({
        mode = "both",
        format = "abs_rel",
        separator = "|",
      })
    end,
  }
}
