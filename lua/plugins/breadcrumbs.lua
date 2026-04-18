return {
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "echasnovski/mini.icons",
    },
    opts = {
      vim.keymap.set("n", "<leader>p", function()
        require("dropbar.api").pick()
      end, { desc = "Pick dropbar component" }),
    },
  },
}
