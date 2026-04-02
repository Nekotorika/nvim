local autocmd = vim.api.nvim_create_autocmd

-- ファイルタイプごとの設定
autocmd("FileType", {
  pattern = { "python", "lua", "javascript", "typescript", "go", "rust", "cpp", "c" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

autocmd("BufNewFile", {
  callback = function()
    local basename = vim.fn.expand("%:t")
    if basename ~= "" and vim.fn.filereadable(basename) == 1 then
      local counter = 1
      local newname
      repeat
        newname = string.format("%s_%d", basename, counter)
        counter = counter + 1
      until vim.fn.filereadable(newname) == 0
      vim.cmd("file " .. newname)
    end
  end,
})

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#5b6370" })
  end,
})

vim.keymap.set("n", "<leader>a", function()
  if vim.bo.filetype == "NvimTree" then
    vim.cmd("wincmd p")
  else
    local nvimtree_win = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "NvimTree" then
        nvimtree_win = win
        break
      end
    end
    if nvimtree_win then
      vim.api.nvim_set_current_win(nvimtree_win)
    end
  end
end, { desc = "Switch focus between NvimTree and editor" })

vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<C-e>", "<cmd>bd!<CR>", { desc = "Close tab" })

vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<CR>", { desc = "Previous tab" })
