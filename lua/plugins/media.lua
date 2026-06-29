return {
  "media-handlers",
  config = function()
    local media_patterns = {
      "*.mp4", "*.mkv", "*.webm", "*.avi", "*.mov", "*.wmv", "*.flv",
      "*.mp3", "*.flac", "*.wav", "*.ogg", "*.opus", "*.m4a", "*.aac",
    }

    local function open_externally()
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" then return end
      vim.fn.jobstart({ "xdg-open", path }, { detach = true })
      vim.cmd("bdelete!")
    end

    for _, pattern in ipairs(media_patterns) do
      vim.api.nvim_create_autocmd("BufReadCmd", {
        pattern = pattern,
        callback = open_externally,
      })
    end

    vim.keymap.set("n", "<leader>mp", function()
      local file = vim.fn.expand("%:p")
      if file ~= "" then
        vim.fn.jobstart({ "mpv", file }, { detach = true })
      end
    end, { desc = "Play current file with mpv" })

    vim.keymap.set("n", "<leader>mo", function()
      local file = vim.fn.expand("%:p")
      if file ~= "" then
        vim.fn.jobstart({ "xdg-open", file }, { detach = true })
      end
    end, { desc = "Open current file with system default" })
  end,
}
