return {
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  {
    'greggh/claude-code.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'ClaudeCode', 'ClaudeCodeToggle', 'ClaudeCodeAccept', 'ClaudeCodeReject' },
    keys = {
      { '<leader>cc', '<cmd>ClaudeCode<CR>', desc = 'Toggle Claude Code' },
    },
    opts = {
      -- Using all defaults
    },
  },
}
