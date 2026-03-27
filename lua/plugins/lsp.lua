return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(_, bufnr)
                local map = vim.keymap.set
                map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                map("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
                map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
            end

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright", "rust_analyzer", "ts_ls" },
                automatic_installation = true,
                hanglers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim", "MiniIcons" } },
                                    workspace = { checkThirdParty = false },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
