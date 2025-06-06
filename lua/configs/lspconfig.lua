require("nvchad.configs.lspconfig").defaults()

require('lspconfig').phpactor.setup({
  cmd = { "/home/tibi/.config/composer/vendor/bin/phpactor", "language-server" },
  filetypes = { "php" },
  root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
})

-- Szerverek listája és beállítása
local servers = {
  "html",
  "cssls",
  "sqlls",    -- SQL Language Server
  -- "phpstan",  # PHPStan nem LSP szerver, érdemes eltávolítani
  "gopls"      -- Go nyelvhez
}

-- Szerverek automatikus beállítása
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup({})
end

-- Opcionális: gopls speciális beállítások
require('lspconfig').gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
})
require('lspconfig').sqlls.setup({})
