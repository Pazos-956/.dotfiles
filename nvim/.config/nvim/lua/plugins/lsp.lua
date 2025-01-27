return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            "saghen/blink.cmp",
            -- Plugins to manage language servers from neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            "neovim/nvim-lspconfig",
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}

                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                end
            })
            
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require('mason').setup()
            require('mason-lspconfig').setup()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup{
                    capabilities = capabilities
                }
                end,
            }
        end
    }
}

