-- Leader key
vim.g.mapleader = " "

-- Exit insert mode
vim.keymap.set('i', "jk", "<ESC>")
vim.keymap.set('i', "JK", "<ESC>")

-- Navigate within insert mode
-- vim.keymap.set('i', '<C-h>', '<Left>')
-- vim.keymap.set('i', '<C-l>', '<Right>')
-- vim.keymap.set('i', '<C-j>', '<Down>')
-- vim.keymap.set('i', '<C-k>', '<Up>')

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh <CR>')

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>')

-- Toggle numbers
vim.keymap.set('n', '<leader>n', '<cmd> set nu! <CR>')
vim.keymap.set('n', '<leader>rn', '<cmd> set rnu! <CR>')

-- When hightlighted, you can move the lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When searching, maintain cursor in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<c-d>', '<C-d>zz')
vim.keymap.set('n', '<c-u>', '<C-u>zz')

-- When you want to replace a highlighted text and maintain the clipboard, use leader p
vim.keymap.set('x', '<leader>p', '\"_dP')

---- clipboard ----
    -- copy into system clipboard
vim.keymap.set('n', '<leader>y', '\"+y') -- Enter in copy mode (concatenate with commands
vim.keymap.set('v', '<leader>y', '\"+y') -- Copy highlighted text
vim.keymap.set('n', '<leader>Y', '\"+Y') -- Copy entire line

    -- Dont save what you delete on vim clipboard
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

    -- Paste from system clipboard
vim.keymap.set('n', '<leader>pp', '\"+p')
-----------------

-- Move navigation from errors (I think? idk)
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Rename all words like the cursor
--vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

