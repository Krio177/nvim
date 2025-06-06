vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.cmd("highlight NormalNC guibg=#222233")
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    vim.wo.winhighlight = "Normal:Normal,NormalNC:DiffAdd"
  end,
})
vim.o.shell = "/bin/fish"
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.wo.winhighlight = "Normal:NormalNC,NormalNC:NormalNC"
  end,
})
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"
-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
vim.g.dbs = {
  localhost = "mysql://root:root@localhost:3306/"
}

