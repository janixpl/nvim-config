return {
  {
    "LazyVim/LazyVim",
    config = function()
      vim.opt.relativenumber = false
      vim.cmd.colorscheme("industry")
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },
}
