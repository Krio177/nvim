return {
{
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    -- phpcs testreszabása
    local phpcs = lint.linters.phpcs
    phpcs.args = {
      "-q",
      "--standard=PSR12",      -- vagy pl. "--standard=/path/to/your/phpcs.xml"
      "--report=json",
      "-",
    }

    lint.linters_by_ft = {
      php = { "php", "phpcs", "phpstan" },
      javascript = { "eslint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
}
