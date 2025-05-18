require("nvchad.configs.lspconfig").defaults()

require('lspconfig').phpactor.setup({
  cmd = { "/home/tibi/.config/composer/vendor/bin/phpactor", "language-server" },
  filetypes = { "php" },
  root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
})
local servers = { "html", "cssls", "phpstan" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
