return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  lazy = false,
  config = function()
    require("gitsigns").setup {
      -- Itt testreszabhatod a beállításokat
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = true, -- Soronkénti blame bekapcsolása
    }
  end,
}
