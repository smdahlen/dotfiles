return {
  {
    "chriskempson/vim-tomorrow-theme",
    priority = 1000,          -- Ensures theme loads before others
    config = function()
      vim.o.termguicolors = true
      vim.cmd("colorscheme Tomorrow-Night-Eighties")
      vim.cmd [[ hi Normal guibg=NONE ]]
    end,
  }
}

