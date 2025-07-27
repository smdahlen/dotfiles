return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        fzf_bin = "fzf",
      })
      
      vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find buffers" })
    end,
  }
}
