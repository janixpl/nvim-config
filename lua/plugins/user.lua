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

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust-analyzer" },
    },
  },
}
