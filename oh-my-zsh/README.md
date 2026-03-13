# Oh My ZSH Setup

## Table of Contents

- [Installation](#installation)
- [Theme](#theme)
- [Plugins](#plugins)
- [zaw](#zaw)

## Installation

See the official installation guide: [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

## Theme

Theme list: [ohmyzsh/themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

Recommended themes: `ys`, `alanpeabody`

Edit `~/.zshrc`:

```bash
ZSH_THEME="[Theme]"
```

```bash
source ~/.zshrc
```

## Plugins

| Plugin | Description |
|--------|-------------|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions#installation) | Fish-like autosuggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting#install) | Syntax highlighting for commands |

Edit `~/.zshrc`:

```bash
plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
)
```

```bash
source ~/.zshrc
```

## zaw

Zsh widget for quick selection from various sources like history, files, and git branches.

- [zsh-users/zaw](https://github.com/zsh-users/zaw)

| Shortcut | Action |
|----------|--------|
| `^X;` | Trigger zaw |
| `Tab` | Switch actions |
| `^R` | Search history |
| `^N` | Select item (down) |
| `^P` | Select item (up) |
| `^G` | Exit zaw |
