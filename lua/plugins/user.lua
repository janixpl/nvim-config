return {
  {
    "LazyVim/LazyVim",
    config = function()
      vim.opt.relativenumber = false
      vim.cmd.colorscheme("industry")
    end,
  },

  -- Mason (menedżer LSP, DAP, narzędzi)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  -- Mason LSP bridge + Rust analyzer
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },

  -- Konfiguracja LSP dla Rust
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
      },
    },
  },
}
