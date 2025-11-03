vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local ok, mason_registry = pcall(require, "mason-registry")
    if ok then
      -- odczekaj sekundę, aż Mason skończy instalacje w tle
      vim.defer_fn(function()
        if mason_registry.refresh then
          mason_registry.refresh()
        end
      end, 1000)
    end
  end,
})

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
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  -- Mason LSP bridge + Rust analyzer
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
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
