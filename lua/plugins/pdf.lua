return {
  "r-pletnev/pdfreader.nvim",
  dependencies = {
    "3rd/image.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("pdfreader").setup()
  end,
}
