local colors = {
  negro   = '#242b38',
  violeta   = '#ccb3ff',
  gris   = '#2E303E',
  gris_medio   = '#272d38',
  verde  = '#bbe67e',
  azul  = '#59c2ff',
  rojo   = '#f07178',
  blanco   = '#c6c6c6',
  none = ''
}
local custom_theme = {
    visual = {
        a = { fg = colors.negro, bg = colors.violeta, gui = 'bold' },
        b = { fg = colors.blanco, bg = colors.gris_medio },
        c = { fg = colors.blanco, bg = colors.none },
    },
    replace = {
        a = { fg = colors.negro, bg = colors.rojo, gui = 'bold' },
        b = { fg = colors.blanco, bg = colors.gris_medio },
        c = { fg = colors.blanco, bg = colors.none },
    },
    inactive = {
        a = { fg = colors.gris, bg = colors.gris_medio, gui = 'bold' },
        b = { fg = colors.blanco, bg = colors.gris_medio },
        c = { fg = colors.gris, bg = colors.negro },
    },
    normal = {
        a = { fg = colors.negro, bg = colors.azul, gui = 'bold' },
        b = { fg = colors.blanco, bg = colors.gris },
        c = { fg = colors.blanco, bg = colors.none },
    },
    insert = {
        a = { fg = colors.negro, bg = colors.verde, gui = 'bold' },
        b = { fg = colors.blanco, bg = colors.gris_medio },
        c = { fg = colors.blanco, bg = colors.none  },
    },
    command = {
        a = { fg = colors.negro, bg = colors.rojo, gui = 'bold'},
        b = { fg = colors.blanco, bg = colors.gris_medio },
        c = { fg = colors.blanco, bg = colors.none  },
    },
}

return{
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
        -- local icons = require("config.icons")
        require("lualine").setup({
            options = {
                --theme = "auto",
                theme = custom_theme,
                globalstatus = true,
                icons_enabled = true,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {
                        "alfa-nvim",
                        "help",
                        "neo-tree",
                        "Trouble",
                        "spectre_panel",
                        "toggleterm",
                    },
                    winbar = {},
                },
            },
            sections = {
                -- lualine_a = {'mode'},
                lualine_b = {
                    "fancy_branch",
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1, -- 2 for full path
                        symbols = {
                            modified = "  ",
                            readonly = "  ",
                            unnamed = "  ",
                        },
                    },
                    { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
                    { "fancy_searchcount" },
                },
                lualine_x = {
                    'filetype',

                },
                --lualine_y = {'progress'},
                --lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "neo-tree", "lazy" },
        })
    end,
}

