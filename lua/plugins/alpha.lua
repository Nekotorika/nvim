return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- ヘッダーの設定
    dashboard.section.header.val = {
      "     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗ ██╗ ███╗   ███╗",
      "    ████╗  ██║██╔════╝██╔═══██╗██║   ██║ ██║ ████╗ ████║",
      "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║ ██║ ██╔████╔██║",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝ ╚═╝     ╚═╝",
      "",
      "                        Neovim",
          }

    -- ボタンの設定
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("f", "󰈞  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "󰈬  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", "<cmd>e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    -- フッターなど他のセクションのハイライト設定（必要に応じて）
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"

    return dashboard.opts
  end,
  config = function(_, opts)
    require("alpha").setup(opts)
  end,
}
