return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/Dropbox/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_code_highlight = 1
    vim.g.vimwiki_hl_cb_checked = 1
  end,
  config = function()
    vim.api.nvim_create_user_command("WikiScreenshot", function()
      local wiki_dir = vim.fn.expand(vim.g.vimwiki_list[1].path)
      local img_dir = wiki_dir .. "/images"
      local filename = os.date("screenshot-%Y-%m-%d-%H%M%S") .. ".png"
      vim.fn.mkdir(img_dir, "p")
      vim.fn.system("screencapture -i " .. vim.fn.shellescape(img_dir .. "/" .. filename))
      if vim.v.shell_error == 0 then
        vim.api.nvim_put({ "![](" .. "images/" .. filename .. ")" }, "c", true, true)
      end
    end, {})
  end,
  keys = {
    { "<leader>ws", "<cmd>WikiScreenshot<CR>", desc = "Screenshot and insert into wiki" },
  },
}
