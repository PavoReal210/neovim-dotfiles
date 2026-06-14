# neovim-dotfiles

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

Managed as a git submodule of [nixos-dotfiles](https://github.com/PavoReal210/nixos-dotfiles) with an out-of-store symlink so config changes take effect immediately.

## Structure

```
neovim-dotfiles/
├── init.lua                   # Entry point; bootstraps lazy.nvim and loads plugins
├── lua/
│   ├── options.lua            # Global editor options (number, shiftwidth, etc.)
│   ├── keymaps.lua            # Key mappings (<leader>, buffer nav, windows, etc.)
│   └── plugins/               # Per-plugin configs, loaded by lazy.nvim
│       ├── autopairs.lua      # nvim-autopairs
│       ├── cmp.lua            # nvim-cmp (autocompletion) + LuaSnip
│       ├── comment.lua        # Comment.nvim
│       ├── gitsigns.lua       # gitsigns.nvim (git decorations)
│       ├── indentline.lua     # indent-blankline.nvim
│       ├── lsp.lua            # mason.nvim + lspconfig (LSP servers)
│       ├── lualine.lua        # lualine.nvim (statusline)
│       ├── nvimtree.lua       # nvim-tree.lua (file explorer)
│       ├── telescope.lua      # telescope.nvim (fuzzy finder)
│       ├── treesitter.lua     # nvim-treesitter (syntax highlighting)
│       └── whichkey.lua       # which-key.nvim (keymap popup)
└── README.md
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Autocompletion with snippet support |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP client and server installer |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indentation |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File tree explorer |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap help popup |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment toggling |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |

## LSP Servers

Automatically installed by mason.nvim:

- `bashls` — Bash
- `lua_ls` — Lua
- `pyright` — Python
- `ts_ls` — TypeScript / JavaScript
- `rust_analyzer` — Rust
- `nixd` — Nix

## Adding a New Plugin

1. Create a new file in `lua/plugins/` (e.g. `todo-comments.lua`)
2. Follow the lazy.nvim spec format:

```lua
return {
  "username/repo",
  dependencies = { ... },     -- optional
  config = function()
    require("plugin-name").setup({ ... })
  end,
}
```

3. Restart Neovim or run `:Lazy` to see the new plugin

## Adding a New LSP Server

1. Add the server name to the `ensure_installed` list in `lua/plugins/lsp.lua`
2. Add it to the `servers` table in the lspconfig setup block
3. Restart Neovim — mason will install it automatically

## Keymaps

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>w` | Save file |
| `<leader>q` | Quit |

Leader key is `<Space>`.

## Tips

- Run `:Lazy` to browse plugins, check for updates, or debug load issues
- Run `:Mason` to manage LSP servers / linters / formatters
- Run `:CheckHealth` to diagnose common issues
- Config changes are live (no rebuild needed) thanks to the out-of-store symlink
