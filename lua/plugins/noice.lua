return {
  "folke/noice.nvim",
  lazy = false,
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- snacks.notifierを使うため、noice側の通知をオフにする
    notify = {
      enabled = false,
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
    },
    views = {
      cmdline_popup = {
        position = {
          row = "30%",
          col = "50%",
        },
        size = {
          width = 55,
          height = "auto",
        },
      },
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)

    local highlights = {
      NoiceCmdlinePopupBorder = { fg = "#7aa2f7" },
    }
    for group, settings in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, settings)
    end
  end,

  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
