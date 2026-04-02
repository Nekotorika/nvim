return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
      local api = require("nvim-tree.api")

      vim.api.nvim_create_autocmd("BufWinEnter", {
        callback = function()
          -- alpha.nvimのときは絶対開かない
          if vim.bo.filetype == "alpha" or vim.fn.argc() == 0 then
            return
          end

          -- すでに開いてたら何もしない
          if api.tree.is_visible() then
            return
          end

          -- 特定のバッファは無視
          local bt = vim.bo.buftype
          if bt ~= "" then
            return
          end

          -- ファイルが存在する時だけ
          local name = vim.api.nvim_buf_get_name(0)
          if name == "" then
            return
          end

          api.tree.open()
        end,
      })

      -- タブ開いたときは強制的に出す（alpha以外）
      vim.api.nvim_create_autocmd("TabNewEntered", {
        callback = function()
          if vim.bo.filetype ~= "alpha" then
            api.tree.open()
          end
        end,
      })
    end,
  },
}
