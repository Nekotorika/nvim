return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup({
      ensure_installed = {
        "lua",
        "python",
        "vim",
        "vimdoc",
        "bash",
        "sql",
        "json",
        "yaml",
        "toml",
        "c",
        "cpp",
        "python",
        "rust",
        "go",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "xml",
        "tex",
        "markdown",
        "markdown_inline",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
    })
  end,

  init = function()
    vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
      group = vim.api.nvim_create_augroup("ForceTS", { clear = true }),
      callback = function()
        vim.schedule(function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.treesitter.start, buf)
            vim.bo[buf].syntax = "off"
          end
        end)
      end,
    })
  end,
}
