local keymap = vim.keymap

-- リーダーキーマップ
keymap.set("n", "<leader>q", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- 自動ペアリング
local npairs = require("nvim-autopairs")
npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})
