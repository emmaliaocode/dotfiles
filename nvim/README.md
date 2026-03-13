# Neovim Setup

## Table of Contents

- [Installation](#installation)
- [Configuration Structure](#configuration-structure)
- [Options](#options)
- [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Colorscheme](#colorscheme)
- [Reference](#reference)

## Installation

```bash
brew install nvim
```

## Configuration Structure

```
~/.config/nvim/
├── init.lua            # Entry point, loads all modules
├── lazy-lock.json      # Plugin version lock file
└── lua/
    ├── options.lua     # Editor options
    ├── keymaps.lua     # Key mappings
    ├── plugins.lua     # Plugin manager (lazy.nvim)
    ├── colorscheme.lua # Theme configuration
    ├── lsp.lua         # LSP configuration (disabled by default)
    └── config/
        └── nvim-cmp.lua
```

Symlink this config:

```bash
ln -sf ~/path/to/dotfiles/nvim ~/.config/nvim
```

## Options

| Option | Value | Description |
|--------|-------|-------------|
| `clipboard` | `unnamedplus` | Use system clipboard |
| `mouse` | `a` | Enable mouse support |
| `tabstop` | `4` | Visual spaces per TAB |
| `shiftwidth` | `4` | Spaces per indent |
| `expandtab` | `true` | Tabs as spaces |
| `number` | `true` | Show line numbers |
| `cursorline` | `true` | Highlight current line |
| `splitbelow` | `true` | Horizontal splits open below |
| `splitright` | `true` | Vertical splits open right |
| `ignorecase` | `true` | Case-insensitive search |
| `smartcase` | `true` | Case-sensitive if uppercase entered |

## Keymaps

### Normal Mode - Window Navigation

| Shortcut | Action |
|----------|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to bottom window |
| `Ctrl+k` | Move to top window |
| `Ctrl+l` | Move to right window |

### Normal Mode - Resize Windows

| Shortcut | Action |
|----------|--------|
| `Ctrl+Up` | Resize -2 rows |
| `Ctrl+Down` | Resize +2 rows |
| `Ctrl+Left` | Resize -2 columns |
| `Ctrl+Right` | Resize +2 columns |

### Visual Mode

| Shortcut | Action |
|----------|--------|
| `<` | Indent left and reselect |
| `>` | Indent right and reselect |

## Plugins

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

| Plugin | Description |
|--------|-------------|
| `projekt0n/github-nvim-theme` | GitHub colorscheme |

## Colorscheme

Default: `github_dark_default`

## Reference

- [從零開始配置 Neovim (Nvim)](https://martinlwx.github.io/zh-cn/config-neovim-from-scratch/#%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE)
