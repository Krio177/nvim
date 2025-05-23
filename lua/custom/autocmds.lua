vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "WinEnter"}, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = true
    vim.opt.number = true
  end,
})
