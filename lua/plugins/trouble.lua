return {
  {
    "folke/trouble.nvim",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "Trouble",
    keys = {
      { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>tr", "<cmd>Trouble lsp_references<cr>", desc = "References" },
      { "<leader>tq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix" },
    },
    opts = {},
  },
}
