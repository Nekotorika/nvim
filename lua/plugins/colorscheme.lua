return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#16161f",
          mantle = "#12121a",
          crust = "#0d0d14",
          surface0 = "#20202a",
          surface1 = "#2a2a36",
          surface2 = "#343444",
        },
      },
      styles = {
        comments = { "italic" },
      },

      integrations = {
        snacks = true,
        telescope = true,
        treesitter = true,
        cmp = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = colors.base },
          NormalNC = { bg = colors.base },
          NormalFloat = { bg = colors.mantle },

          LineNr = { fg = "#5a657a", bg = colors.base },
          CursorLineNr = { fg = colors.lavender, bold = true, bg = colors.base },

          SignColumn = { bg = colors.base },
          FoldColumn = { bg = colors.base },
          CursorLine = { bg = "#1a1b26" },
          Visual = { bg = "#2f334d" },
          Search = { bg = "#3b4261", fg = colors.text },

          FloatBorder = { bg = colors.mantle, fg = colors.surface2 },
          Pmenu = { bg = colors.mantle },

          TelescopeNormal = { bg = colors.mantle },
          TelescopeBorder = { fg = colors.surface2, bg = colors.mantle },

          ["@variable"] = { fg = colors.text },
          ["@parameter"] = { fg = colors.text },

          ["@function"] = { fg = colors.blue },
          ["@function.call"] = { fg = colors.blue },

          ["@keyword"] = { fg = colors.mauve, italic = true },

          ["@string"] = { fg = colors.green },
          ["@type"] = { fg = colors.yellow },

          ["@constant"] = { fg = colors.peach },

          ["@operator"] = { fg = colors.sky },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
