vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<CR>', ':noh<CR>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.o.scrolloff = 5

vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'

vim.o.number = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

require('config.lazy')
