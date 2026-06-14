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
          "rust_analyzer", "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig" },
    config = function()
      local servers = { "bashls", "lua_ls", "pyright", "ts_ls", "rust_analyzer", "nixd", "clangd" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
