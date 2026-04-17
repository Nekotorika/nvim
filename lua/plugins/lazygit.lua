return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- Telescopeを依存関係に追加
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      -- Telescope連携用のキーマップ（例：<leader>gt）
      { "<leader>gt", "<cmd>Telescope lazygit<cr>", desc = "Telescope LazyGit" },
    },
    config = function()
      -- 前回のEscバグ対策
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lazygit",
        callback = function()
          vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = true, silent = true })
        end,
      })

      -- Telescope に lazygit エクステンションをロードさせる
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("lazygit")
      end
    end,
  },
}
