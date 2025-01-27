local augroup = vim.api.nvim_create_augroup -- Crear/llamar autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Crear atocommand
print(vim.fn.getcwd())

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '200' })
    end
})


vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

