# Claude Code Setup

## Table of Contents

- [Installation](#installation)
- [Configuration Structure](#configuration-structure)
- [Settings](#settings)
- [MCP Servers](#mcp-servers)
- [Status Line](#status-line)

## Installation

See the [official Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code/overview) for installation instructions.

## Configuration Structure

```
~/.claude/
├── settings.json                    # Global settings and environment variables
├── mcp-servers.json                 # MCP server configuration
└── statusline/
    └── statusline-command.sh        # Custom status line script
```

## Settings

Configured in `settings.json`.

### Plugins

| Plugin | Description |
|--------|-------------|
| `skill-creator@claude-plugins-official` | Create and manage Claude Code skills |

## MCP Servers

[Model Context Protocol](https://modelcontextprotocol.io/) servers extend Claude Code with external tool access.

Configured in `mcp-servers.json`.

| Server | Type | Description |
|--------|------|-------------|
| `notion` | HTTP | Notion workspace access |
| `grafana` | stdio (uvx) | Grafana dashboards, alerts, and observability |
| `confluence` | SSE | Atlassian Confluence and Jira |
| `puppeteer` | stdio (npx) | Browser automation and screenshots |

## Status Line

A custom bash script (`statusline/statusline-command.sh`) renders a status bar showing:

| Field | Example | Description |
|-------|---------|-------------|
| CWD | `/path/to/project` | Current working directory |
| Git branch | `git:main` | Active branch or short SHA |
| Model | `Claude Opus 4.6` | Active model display name |
| Context | `ctx:[####------] 40%` | Context window usage bar |
| Cost | `cost:$0.1234` | Estimated session cost (Opus pricing) |
