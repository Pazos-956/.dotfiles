return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        -- "tomblind/local-lua-debugger-vscode", me lo instale con yay
    },
    enabled = false,
    config = function()
        local dap = require "dap"
        local ui = require "dapui"
        require("dapui").setup()

        dap.adapters["local-lua"] = {
            type = "executable",
            command = "node",
            args = {
                "/usr/lib/node_modules/local-lua-debugger-vscode/extension/debugAdapter.js"
            },
            enrich_config = function(config, on_config)
                if not config["extensionPath"] then
                    local c = vim.deepcopy(config)
                    c.extensionPath = "/usr/lib/node_modules/local-lua-debugger-vscode/"
                    on_config(c)
                else
                    on_config(config)
                end
            end,
        }

        dap.configurations.lua = {
            {
                name = "Debug",
                type = "local-lua",
                request = "launch",
                cwd = '${workspaceFolder}',
                program = {
                    lua = "lua",
                    file = "${file}",
                },
            },
        }

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = '/home/abel/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
                args = {"--port", "${port}"},
            }
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                port = 5005,
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        -- vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        -- vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
        -- vim.keymap.set("n", "<leader>?", function()
        --     require("dapui").eval(nil, {enter = true })
        -- end)
        --
        -- vim.keymap.set("n", "<F1>", dap.continue)
        -- vim.keymap.set("n", "<F2>", dap.step_into)
        -- vim.keymap.set("n", "<F3>", dap.step_over)
        -- vim.keymap.set("n", "<F4>", dap.step_out)
        -- vim.keymap.set("n", "<F5>", dap.restart)
        -- vim.keymap.set("n", "<F8>", dap.step_back)
        -- vim.keymap.set("n", "<F6>", dap.terminate)
        --
        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
