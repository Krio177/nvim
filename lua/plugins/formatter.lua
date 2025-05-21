return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          html = { "prettier" },
          lua = { "stylua" },
          javascript = { "prettier" },
          php = { "pint", "php_cs_fixer", stop_after_first = true },
          go = { "goimports", "gofmt", stop_after_first = true },
          ["*"] = { "trim_whitespace" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      }

      -- Manuális formázás hotkey
      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        require("conform").format { async = true, lsp_fallback = true }
      end, { desc = "[C]ode [F]ormat" })
    end,
  },
}
