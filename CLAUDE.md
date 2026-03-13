# CLAUDE.md

## Repository Overview

This is a personal dotfiles repo containing configuration for iTerm2, Oh My ZSH, and Neovim. There is no build system, test suite, or application code — it is purely configuration and documentation.

## Syncing Config from Local Machine

When a user asks to sync config from the local machine, follow these steps for each directory:

- **`claude/.claude/mcp.json`** — Read the MCP server config from `~/.claude.json` (under the `mcpServers` key), redact sensitive values per the Sensitive Data rules, and write it to `claude/.claude/mcp.json`.
- **`claude/.claude/` (other files)** — For each file that already exists in `claude/.claude/` in this repo (excluding `mcp.json`), copy the corresponding file from `~/.claude/` on the local machine. Do not add files that don't already exist in this repo.
- **`nvim/`** — Copy files from `~/.config/nvim/`, matching only paths that already exist in `nvim/` in this repo. Do not add files that don't already exist in this repo.

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
