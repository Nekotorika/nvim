return {
  {
    "echasnovski/mini.icons",
    opts = {},
    config = function(_, opts)
      local icons = require("mini.icons")
      icons.setup(opts)
      icons.mock_nvim_web_devicons()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",

        view = {
          width = 30,
        },

        renderer = {
          group_empty = true,
          icons = {
            web_devicons = {
              file = {
                enable = true,
                color = true,
              },
              folder = {
                enable = true,
                color = true,
              },
            },

            git_placement = "after",
            symlink_arrow = " ➛ ",

            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },

        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          icons = {
            hint = "󰌵",
            info = "󰋼",
            warning = "󰀪",
            error = "󰅚",
          },
        },

        filters = {
          dotfiles = false,
        },

        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end
          vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        end,
      })
    end,
  },
}
