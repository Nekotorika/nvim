local keymap = vim.keymap

-- リーダーキーマップ
keymap.set("n", "<leader>q", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- 補完関連
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-c>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})

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

