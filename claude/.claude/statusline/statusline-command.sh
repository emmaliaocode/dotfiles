#!/bin/bash

input=$(cat)

# Parse fields from JSON input
cwd=$(echo "$input" | jq -r '.cwd // .workspace.current_dir // ""')
model_id=$(echo "$input" | jq -r '.model.id // ""')
model_name=$(echo "$input" | jq -r '.model.display_name // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Git branch (skip optional locks)
git_branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree --no-optional-locks 2>/dev/null | grep -q true; then
  git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

# Context progress bar (10 chars wide)
bar=""
if [ -n "$used_pct" ]; then
  filled=$(echo "$used_pct" | awk '{printf "%d", ($1 / 10 + 0.5)}')
  empty=$((10 - filled))
  for i in $(seq 1 $filled); do bar="${bar}#"; done
  for i in $(seq 1 $empty); do bar="${bar}-"; done
  bar="[${bar}] ${used_pct}%"
else
  bar="[----------] n/a"
fi

# Estimate total session cost (approximate pricing per million tokens)
# claude-3-5-sonnet / claude-3-7-sonnet: $3 input, $15 output per 1M tokens
# claude-opus: $15 input, $75 output per 1M tokens
# Default to a generic rate if unknown
input_cost_per_m=15
output_cost_per_m=75
cost=$(echo "$total_input $total_output $input_cost_per_m $output_cost_per_m" | awk '{printf "%.4f", ($1 * $3 + $2 * $4) / 1000000}')

# Build output line
parts=""

# CWD
if [ -n "$cwd" ]; then
  parts="${cwd}"
fi

# Git branch
if [ -n "$git_branch" ]; then
  parts="${parts} | git:${git_branch}"
fi

# Model
if [ -n "$model_name" ]; then
  parts="${parts} | ${model_name}"
elif [ -n "$model_id" ]; then
  parts="${parts} | ${model_id}"
fi

# Context bar
parts="${parts} | ctx:${bar}"

# Cost
parts="${parts} | cost:\$${cost}"

printf "%s" "$parts"
