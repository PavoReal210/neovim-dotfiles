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
│       ├── image.lua          # 3rd/image.nvim (inline image rendering)
│       ├── indentline.lua     # indent-blankline.nvim
│       ├── lsp.lua            # mason.nvim + lspconfig (LSP servers)
│       ├── lualine.lua        # lualine.nvim (statusline)
│       ├── media.lua          # media handlers (video/audio external open)
│       ├── nvimtree.lua       # nvim-tree.lua (file explorer)
│       ├── pdf.lua            # pdfreader.nvim (in-editor PDF viewer)
│       ├── telescope.lua      # telescope.nvim (fuzzy finder)
│       ├── treesitter.lua     # nvim-treesitter (syntax highlighting)
│       └── whichkey.lua       # which-key.nvim (keymap popup)
└── README.md
```

## Plugins

| Plugin                                                                                                                | Purpose                             |
| --------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                      | Autocompletion with snippet support |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP client and server installer     |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                                                 | Syntax highlighting, indentation    |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                                                    | Fuzzy finder (files, grep, buffers) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                                                           | File tree explorer                  |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                                          | Statusline                          |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                                           | Git signs in gutter                 |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                                                             | Keymap help popup                   |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                                                              | Comment toggling                    |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                                            | Auto-close brackets/quotes          |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                                       | Indentation guides                  |
| [vim-fugitive](https://github.com/tpope/vim-fugitive)                                                                 | Git porcelain (commit, push, etc.)  |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                                         | Toggleable terminal                 |
| [image.nvim](https://github.com/3rd/image.nvim)                                                                       | Inline image rendering (png/jpg/gif/svg) |
| [pdfreader.nvim](https://github.com/r-pletnev/pdfreader.nvim)                                                         | In-editor PDF viewer with bookmarks |
| media-handlers (custom)                                                                                               | Video/audio external open + keymaps |

## LSP Servers

Automatically installed by mason.nvim:

- `bashls` — Bash
- `lua_ls` — Lua
- `pyright` — Python
- `ts_ls` — TypeScript / JavaScript
- `rust_analyzer` — Rust
- `nixd` — Nix
- `clangd` — C / C++

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

Leader key is `<Space>`.

| Key             | Action           |
| --------------- | ---------------- |
| `<leader>e`     | Toggle file tree |
| `<leader>ff`    | Find files       |
| `<leader>fg`    | Live grep        |
| `<leader>fb`    | Find buffers     |
| `<S-h>`         | Previous buffer  |
| `<S-l>`         | Next buffer      |
| `<C-h/j/k/l>`   | Navigate windows |
| `<leader>w`     | Save file        |
| `<leader>q`     | Quit             |
| `<leader>tt`    | Toggle terminal  |
| `<leader>ga`    | Stage current file |
| `<leader>gA`    | Stage all files  |
| `<leader>gS`    | Git stash push   |
| `<leader>gs`    | Git status       |
| `<leader>gp`    | Git push         |
| `<leader>gc`    | Git commit       |
| `<leader>gl`    | Git log          |
| `<leader>gd`    | Git diff         |
| `<leader>mp`    | Play current file with mpv |
| `<leader>mo`    | Open current file with system default |

## Common Hotkeys

A quick reference for frequently used Neovim and plugin hotkeys.

### Modes

| Key       | Action                        |
| --------- | ----------------------------- |
| `i`       | Enter insert mode             |
| `v`       | Enter visual mode             |
| `V`       | Enter visual line mode        |
| `<C-v>`   | Enter visual block mode       |
| `Esc`     | Return to normal mode         |
| `:`       | Enter command mode            |

### Navigation

| Key         | Action                                  |
| ----------- | --------------------------------------- |
| `h/j/k/l`   | Move left / down / up / right           |
| `w`         | Jump to start of next word              |
| `b`         | Jump to start of previous word          |
| `e`         | Jump to end of current/next word        |
| `0`         | Jump to start of line                   |
| `$`         | Jump to end of line                     |
| `gg`        | Jump to top of file                     |
| `G`         | Jump to bottom of file                  |
| `<C-d>`     | Scroll half-page down                   |
| `<C-u>`     | Scroll half-page up                     |
| `%`         | Jump to matching bracket                |
| `{` / `}`   | Jump to previous / next empty line      |

### Editing

| Key         | Action                                      |
| ----------- | ------------------------------------------- |
| `u`         | Undo                                        |
| `<C-r>`     | Redo                                        |
| `dd`        | Delete (cut) current line                   |
| `yy`        | Yank (copy) current line                    |
| `p`         | Paste after cursor                          |
| `P`         | Paste before cursor                         |
| `x`         | Delete character under cursor               |
| `o`         | Open new line below and enter insert mode   |
| `O`         | Open new line above and enter insert mode   |
| `A`         | Append at end of line                       |
| `ciw`       | Change inner word                           |
| `diw`       | Delete inner word                           |
| `>` / `<`   | Indent / unindent (visual mode)             |
| `gcc`       | Toggle comment on current line              |
| `gc`        | Toggle comment on selection (visual mode)   |

### Search & Replace

| Key              | Action                                      |
| ---------------- | ------------------------------------------- |
| `/pattern`       | Search forward                              |
| `?pattern`       | Search backward                             |
| `n` / `N`        | Next / previous search match                |
| `*`              | Search for word under cursor                |
| `:%s/old/new/g`  | Replace all occurrences in file             |
| `:%s/old/new/gc` | Replace all with confirmation               |

### File Tree (nvim-tree)

| Key       | Action                              |
| --------- | ----------------------------------- |
| `<CR>`    | Open file or expand/collapse folder |
| `o`       | Open file or expand/collapse folder |
| `h`       | Collapse folder                     |
| `-`       | Go up to parent directory           |
| `<C-v>`   | Open file in vertical split         |
| `<C-x>`   | Open file in horizontal split       |
| `<C-t>`   | Open file in new tab                |
| `a`       | Create file (end with `/` for dir)  |
| `d`       | Delete file                         |
| `r`       | Rename file                         |
| `c`       | Copy file                           |
| `x`       | Cut file                            |
| `p`       | Paste file                          |
| `O`       | Open with system default application |
| `R`       | Refresh tree                        |

### LSP

| Key          | Action                          |
| ------------ | ------------------------------- |
| `gd`         | Go to definition                |
| `gD`         | Go to declaration               |
| `gr`         | Go to references                |
| `gi`         | Go to implementation            |
| `K`          | Hover documentation             |
| `<C-k>`      | Signature help                  |
| `[d` / `]d`  | Previous / next diagnostic      |
| `<leader>ca` | Code action                     |
| `<leader>rn` | Rename symbol                   |
| `<leader>f`  | Format file                     |

### Splits & Tabs

| Key              | Action                    |
| ---------------- | ------------------------- |
| `:vs`            | Open vertical split       |
| `:sp`            | Open horizontal split     |
| `<C-h/j/k/l>`    | Navigate between splits   |
| `:tabnew`        | Open new tab              |
| `gt` / `gT`      | Next / previous tab       |
| `:q`             | Close split or tab        |

#### Image / PDF (image.nvim / pdfreader.nvim)

| Key / Command                              | Action                          |
| ------------------------------------------ | ------------------------------- |
| `:e image.png`                             | Render image inline in buffer   |
| `:e document.pdf`                          | Open PDF reader                 |
| `:PDFReader setViewMode dark`              | Switch PDF to dark mode         |
| `:PDFReader showToc`                       | Show PDF table of contents      |
| `:PDFReader addBookmark`                   | Bookmark current PDF page       |
| `h` / `l`                                  | Previous / next PDF page        |

Note: Image rendering works in Ghostty (Kitty graphics protocol).
PDF reader requires `imagemagick`, `poppler-utils`, and `ghostscript`
on your system.

## System Dependencies

The following packages must be installed on your system:

| Package         | Needed by         | Purpose                         |
| --------------- | ----------------- | ------------------------------- |
| `imagemagick`   | image.nvim        | Image format conversion         |
| `magick` (lua)  | image.nvim        | Lua FFI bindings to ImageMagick |
| `poppler-utils` | pdfreader.nvim    | PDF rasterization (pdftoppm)    |
| `ghostscript`   | pdfreader.nvim    | PDF processing for ImageMagick  |
| `mpv`           | media handlers    | Video playback                  |

On **NixOS** (via home-manager), add to your config:

```nix
programs.neovim = {
  enable = true;
  extraLuaPackages = ps: [ ps.magick ];
  extraPackages = [ pkgs.poppler_utils pkgs.ghostscript ];
};

home.packages = with pkgs; [ imagemagick mpv ];
```

## Useful Commands

| Command        | Action                                      |
| -------------- | ------------------------------------------- |
| `:Lazy`        | Open plugin manager                         |
| `:Mason`       | Open LSP/formatter installer                |
| `:checkhealth` | Diagnose common issues                      |
| `:noh`         | Clear search highlighting                   |
| `:w`           | Save file                                   |
| `:q`           | Quit                                        |
| `:wq`          | Save and quit                               |
| `:q!`          | Quit without saving                         |

## Tips

- Run `:Lazy` to browse plugins, check for updates, or debug load issues
- Run `:Mason` to manage LSP servers / linters / formatters
- Run `:CheckHealth` to diagnose common issues
- Config changes are live (no rebuild needed) thanks to the out-of-store symlink
