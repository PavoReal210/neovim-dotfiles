return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 30 },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local opts = function(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        pcall(api.config.mappings.default_on_attach, bufnr)

        vim.keymap.set("n", "O", function()
          local node = api.tree.get_node_under_cursor()
          if node then
            vim.fn.jobstart({ "xdg-open", node.path }, { detach = true })
          end
        end, opts("System open"))
      end,
    })
  end,
}
