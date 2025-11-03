vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local function safe_refresh()
      local ok, mason_registry = pcall(require, "mason-registry")
      if ok and mason_registry.refresh then
        mason_registry.refresh()
      else
        vim.defer_fn(safe_refresh, 500)
      end
    end
    safe_refresh()
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

  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },

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
