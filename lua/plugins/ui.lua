return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { show_start = false, show_end = false },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "echasnovski/mini.icons",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              cond = function()
                local ft = vim.bo.filetype
                local special_filetypes = {
                  "neo-tree", -- neo-tree filesystem
                  "snacks_dashboard",
                  "TelescopePrompt", -- telescope
                  "lazygit",
                  "lazy", -- lazy.nvim
                  "mason",
                  "trouble",
                  "toggleterm",
                }
                return not vim.tbl_contains(special_filetypes, ft)
              end,
              path = 0, -- 0 = filename only（1にすると相対パスも出る）
              shorting_target = 40,
              symbols = { modified = " ●", readonly = " " },
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPost",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "Explore",
              separator = true,
            },
          },
        },
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = {},
  },

  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<leader>cb", "<cmd>CBccbox<CR>", mode = { "n", "v" }, desc = "Comment Box: Centered" },
      { "<leader>cl", "<cmd>CBccline<CR>", mode = { "n", "v" }, desc = "Comment Line: Centered" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
