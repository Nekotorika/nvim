return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.material_style = "deep ocean"

    require('material').setup({
      styles = {
        comments = { italic = true },
        keywords = { bold = false },
        functions = { bold = false },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = {
        ["alpha"] = true,
        ["telescope"] = true,
        ["nvim-cmp"] = true,
        ["nvim-navic"] = true,
        ["which-key"] = true,
      },
      custom_highlights = {
        LineNr = { fg = "#4b5668" },
        CursorLineNr = { fg = "#c678dd", bold = true },

      }
    })

    vim.cmd.colorscheme 'material'
  end
}
