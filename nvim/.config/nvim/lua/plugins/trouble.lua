local conf = {
  mode = "diagnostics", -- inherit from diagnostics mode
  modes = {
    mydiags = {
      filter = {
        any = {
          buf = 0, -- current buffer
          {
            severity = vim.diagnostic.severity.ERROR, -- errors only
            -- limit to files in the current project
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    }
  }
}
return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --[[ opts = {
        mode = "diagnostics",
        modes = {
            diagnostics_buffer = {
                mode = "diagnostics", -- inherit from diagnostics mode
                filter = { buf = 0 }, -- filter diagnostics to the current buffer
            },
        }
    }, ]]
    -- keys = {
    --     {
    --         "<leader>tt",
    --         function ()
    --             require("trouble").toggle()
    --         end,
    --         desc = "Diagnostics (Trouble)",
    --     },
    -- },
    config = function()
        require("trouble").setup({
            mode = "diagnostics",
            modes = {
                diagnostics_buffer = {
                    mode = "diagnostics", -- inherit from diagnostics mode
                    filter = { buf = 0 }, -- filter diagnostics to the current buffer
                },
            }
        })

        vim.keymap.set("n", "<leader>et", function()
            require("trouble").toggle(conf)
        end)

    --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>en", function()
            require("trouble").next(conf, {skip_groups = true, jump = true});
        end)
        vim.keymap.set("n", "<leader>ep", function()
            require("trouble").prev(conf, {skip_groups = true, jump = true});
        end)
    end,
}

