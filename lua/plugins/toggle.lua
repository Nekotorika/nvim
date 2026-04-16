return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>o", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      size = 12,
      start_in_insert = true,
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
