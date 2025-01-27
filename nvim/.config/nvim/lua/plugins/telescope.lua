local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end
            
            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }
            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end
            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end
            ---@diagnostic disable-next-line: deprecated
            return vim.tbl_flatten {
                args,
                {"--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
            }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }

    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
    }):find()
end

return {
    -- Start of loader for lazy --
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    -- end of loader for lazy --
    --
    -- configuration of telescope --	
    config = function()
        local builtin = require('telescope.builtin')
    	-- Keybindings 
    	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    	vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
     --    vim.keymap.set('n', '<leader>fs', function()
     --        builtin.grep_string({search = vim.fn.input("Grep > ") })
	    -- end)
        vim.keymap.set('n', '<leader>fs', live_multigrep)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- If you dont like that the buffers accumulate too much
                                                               -- buffer_manager.nvim works like a harpoon type of buffer manager, where you can remove them.
    end,
}



