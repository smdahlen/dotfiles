vim.g.mapleader = ","

require("config.lazy")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<CR>", ":noh<CR>")

vim.o.scrolloff = 5

-- Set 4-space indents as the global default
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Override for Lua files: use 2-space indents
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})
