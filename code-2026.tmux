# vim:set ft=tmux:

# Code 2026 - tmux theme entry point
#
# Usage:
#   source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026.tmux

run-shell "tmux source-file '#{d:current_file}/code-2026_options.conf'"
run-shell "tmux source-file '#{d:current_file}/code-2026_main.conf'"
