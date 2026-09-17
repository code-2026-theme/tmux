#!/usr/bin/env bash

# Code 2026 - tmux theme
# Manual install entry script
#
# Usage:
#   source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026.tmux
#
# Or run directly:
#   bash ~/.config/tmux/plugins/code-2026/tmux/code-2026.tmux

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux source "${PLUGIN_DIR}/code-2026_options.conf"
tmux source "${PLUGIN_DIR}/code-2026_main.conf"
