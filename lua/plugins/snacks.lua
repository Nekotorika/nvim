return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
      preset = {
        -- ヘッダーの設定 (提示されたASCIIアートを移植)
        header = [[
      ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗  ██╗  ███╗   ███╗
     ████║  ██╔╝██╔═════╝██╔══╝██║ ██╔╝  ██╔╝ ██╔╝ ████║ ████╔╝
    ██╔██║ ██╔╝█████╗   ██╔╝  ██╔╝██╔╝  ██╔╝ ██╔╝ ██╔████╝██╔╝
  ██║║██║██╔╝██╔═══╝  ██╔╝  ██╔╝ ██╝ ██╔═╝ ██╔╝ ██║╚██╔╝██╔╝
██╔╝╚████╔╝███████╗  ██████╔═╝  ████╔═╝  ██╔╝ ██╔╝ ╚═╝██╔╝
╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝    ╚═╝  ╚═╝     ╚═╝

        ]],
        -- ボタン（キー）の設定
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene" },
          { icon = "󰈞 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = "󰈬 ", key = "w", desc = "Find Word", action = ":Telescope live_grep" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
          { icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC" },
          { icon = "󰒲 ", key = "l", desc = "Lazy Package", action = ":Lazy" },
          { icon = "󱐥 ", key = "m", desc = "Mason Package", action = ":Mason" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
