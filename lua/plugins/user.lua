return {
  {
    "LazyVim/LazyVim",
    config = function()
      vim.opt.clipboard = "unnamedplus"
      vim.opt.number = true
      vim.opt.relativenumber = false
      vim.cmd.colorscheme("industry")
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },
}
