local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins.colorscheme" },
    { import = "plugins.completion" },
    { import = "plugins.filetree" },
    { import = "plugins.treesitter" },
    { import = "plugins.conform" },
    { import = "plugins.lsp" },
    { import = "plugins.snippets" },
    { import = "plugins.ui" },
    { import = "plugins.telescope" },
    { import = "plugins.toggleterm" },
    { import = "plugins.snacks" },
    { import = "plugins.noice" },
    { import = "plugins.trouble" },
    { import = "plugins.lazygit" },
    { import = "plugins.breadcrumbs" },
  },

  defaults = { lazy = false, version = false },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  rocks = {
    enabled = false,
  },
})

require("core.options")
require("core.keymaps")
require("core.autocmds")
