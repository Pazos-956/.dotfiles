-- This file is the one that should load all files from the profile
-- Load requires
require("core.remap")
require("core.lazy")
require("core.autocmds")
require("core.terminal")

-- Config 
-- Line numbers init
vim.wo.relativenumber = true
vim.wo.number =	true

-- Indentation line
vim.opt.expandtab = true      -- Make tabs with spaces
vim.opt.shiftwidth = 4      -- Value of intendation
vim.opt.softtabstop = 4    -- Use value of shiftwidth
-- vim.opt.smartindent = true no hace un carajo lpm
vim.opt.tabstop = 4       -- Make files change the intendation (I think?)
vim.opt.smarttab = true       --Use shiftwidth to mark the value of indentation

-- Si la linea es muy larga no se corta
vim.opt.wrap = false

-- Usar clipboard del sistema
vim.opt.clipboard = "unnamedplus"

-- Stop vim from doing backups and allow undodir plugin to see backups from days ago if undodir is removed, mabye the nvim backup is useful ;)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Al buscar solo se marca una palabra, no todas las que coincidan
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Set minnimum lines as you scroll up or down
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@") idk

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"


