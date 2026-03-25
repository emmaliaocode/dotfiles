# CLAUDE.md

## Repository Overview

This is a personal dotfiles repo containing configuration for iTerm2, Oh My ZSH, Neovim, Claude Code, Gemini CLI, and tmux. There is no build system, test suite, or application code — it is purely configuration and documentation.

## Syncing Config from Local to Project

When a user asks to sync configs from local to the project, run the corresponding commands below. After copying, redact any sensitive values per the Sensitive Data rules.

- **`tmux/`** — Copy files from `~/.config/tmux/`, matching only paths that already exist in `tmux/` in this repo.
- **`claude/`** —
  - `cp ~/.claude/settings.json claude/.claude/settings.json`
  - `cp -r ~/.claude/statusline claude/.claude/statusline`
  - For `claude/.claude/mcp.json`: read the MCP server config from `~/.claude.json` (under the `mcpServers` key), redact sensitive values per the Sensitive Data rules, and write it to `claude/.claude/mcp.json`.
- **`nvim/`** — Copy files from `~/.config/nvim/`, matching only paths that already exist in `nvim/` in this repo.
- **`gemini/`** —
  - `cp ~/.gemini/settings.json gemini/.gemini/settings.json`
  - `cp ~/.gemini/antigravity/mcp_config.json gemini/antigravity/mcp_config.json`

For all tools: only update files that already exist in the repo. Do not add new files unless explicitly asked. Remove any repo files (excluding READMEs) whose source counterpart no longer exists. After copying, review every file for sensitive values and replace them with `your_` placeholders.

## Syncing Config from Project to Local

When a user asks to sync configs from the project to local, copy repo config files to the local machine using the reverse of the local-to-project path mappings above.

For each file:
1. If the local file does not exist, copy the repo file to the local path directly.
2. If the local file already exists, diff the repo file against the local file and show the user the differences. Ask the user whether to apply each change (add new lines, remove deleted lines, or replace modified lines) before overwriting.
3. Before copying, replace any `your_`-prefixed placeholder values with the actual values already present in the local file (so real credentials are preserved locally). If a placeholder has no corresponding local value, warn the user and leave the placeholder as-is.

## README Style Guide

Follow these conventions when writing or updating README files in this repo.

- Each subdirectory README follows this order: `# [Tool Name] Setup` heading, `## Table of Contents`, `## Installation` as the first content section, then remaining sections
- Use tables (`| ... |`) for listing plugins, themes, shortcuts, and options
- Use `bash` fenced code blocks for commands and config snippets
- Precede config edits with `Edit [file]:` instead of a separate `vim [file]` code block
- Use `###` subsections to group related items under a `##` section
- Link to official GitHub repos for installation instructions instead of embedding commands that may go stale
- Add a one-line description before reference links or tables when introducing a tool/section
- Keep the root `README.md` with a structure table linking to each subdirectory

## Sensitive Data

Never commit real secrets (API keys, tokens, URLs with credentials) to config files. Use lowercase placeholder strings prefixed with `your_` for any sensitive value, e.g. `"your_anthropic_auth_token"`. This applies to all config files across the repo (settings, MCP server configs, etc.).
