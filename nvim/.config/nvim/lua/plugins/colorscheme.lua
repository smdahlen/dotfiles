return {
  {
    'RRethy/nvim-base16',
    priority = 1000,          -- Ensures theme loads before others
    config = function()
      vim.o.termguicolors = true
      vim.cmd('colorscheme base16-tomorrow-night-eighties')
      vim.cmd [[ hi Normal guibg=NONE ]]
      vim.cmd [[ hi NormalNC guibg=NONE ]]
    end,
  }
}

