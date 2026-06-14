return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls", "lua_ls", "pyright", "ts_ls",
          "rust_analyzer", "nixd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "bashls", "lua_ls", "pyright", "ts_ls", "rust_analyzer", "nixd" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}
