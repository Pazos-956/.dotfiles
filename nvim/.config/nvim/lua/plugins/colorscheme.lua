return {
  ---[[
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load first 
    config  = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  --]]
  --[[
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme catppuccin-latte")
    -- end
  },
  -- ]]
}

