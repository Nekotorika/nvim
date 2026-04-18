return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      direction = "float",
      start_in_insert = true,
    })

    toggleterm.setup({
      direction = "float",
      start_in_insert = true,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.9),
      },
    })

    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.9),
        row = math.floor((vim.o.lines - vim.o.lines * 0.9) / 2),
        col = math.floor((vim.o.columns - vim.o.columns * 0.9) / 2),
      },
      on_open = function(term)
        vim.cmd("startinsert")
        vim.defer_fn(function()
          vim.api.nvim_chan_send(term.job_id, "r")
        end, 50)
      end,
    })

    vim.keymap.set("n", "<leader>oo", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { desc = "LazyGit" })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local opts = { buffer = 0 }

        
        vim.keymap.set("t", "<leader>oo", [[<C-\><C-n><cmd>ToggleTerm<cr>]], opts)
        vim.keymap.set("t", "<leader>gg", function()
          lazygit:toggle()
        end, opts)
      end,
    })
  end,
}
