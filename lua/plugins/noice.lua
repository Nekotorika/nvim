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
          width = 60,
          height = "auto",
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
