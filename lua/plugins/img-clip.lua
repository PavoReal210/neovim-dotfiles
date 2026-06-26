return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    default = {
      dir_path = "assets",  -- saves images next to your wiki files
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
