# dotfiles

Personal development environment configuration.

## Structure

| Directory | Description |
|-----------|-------------|
| [iterm2](./iterm2) | iTerm2 terminal emulator |
| [oh-my-zsh](./oh-my-zsh) | Oh My ZSH shell framework |
| [nvim](./nvim) | Neovim editor |
| [claude](./claude) | Claude Code CLI |

## Syncing

Copy live configs from this machine into the repo:

```bash
./sync.sh
```

This copies files from their standard locations (`~/.config/nvim`, `~/.claude`) into the repo directories. It also redacts secrets in `claude/.claude/mcp-servers.json`. After running, review and commit the changes yourself.
