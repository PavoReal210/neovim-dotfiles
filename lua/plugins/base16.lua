-- Change this to match stylix.base16Scheme in home-manager/theming/stylix.nix
local theme = "base16-atelier-forest"

return {
  "RRethy/base16-nvim",
  config = function()
    vim.cmd("colorscheme " .. theme)
  end,
}
