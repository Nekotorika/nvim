return {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local function get_lazygit_win()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)

        if vim.bo[buf].filetype == "lazygit" then
          return win
        end
      end
      return nil
    end

    vim.keymap.set("n", "<leader>gg", function()
      local win = get_lazygit_win()

      if win then
        vim.api.nvim_win_close(win, true)
      else
        vim.cmd("LazyGit")
      end
    end, { desc = "LazyGit Toggle" })

    

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lazygit",
      callback = function()
        local opts = { buffer = 0 }
        
        vim.keymap.set("t", "<esc>", function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
            "n",
            false
          )
        
          vim.schedule(function()
            if vim.bo.filetype == "lazygit" then
              vim.cmd("normal! gg0")
            end
          end)
        end, { buffer = 0 })
    
        vim.keymap.set("n", "q", function()
          vim.cmd("stopinsert")
    
          vim.schedule(function()
            vim.cmd("close")
          end)
        end, opts)
    
        vim.keymap.set("n", "<leader>gg", "<cmd>close<cr>", opts)
      end,
    })
  end,
}
