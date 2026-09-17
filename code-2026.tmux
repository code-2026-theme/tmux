# vim:set ft=tmux:

# Code 2026 - tmux theme entry point
#
# Usage:
#   source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026.tmux

%hidden _CODE2026_DIR "#{d:current_file}"
run-shell "tmux source '#{d:current_file}/code-2026_options.conf'"
run-shell "tmux source '#{d:current_file}/code-2026_main.conf'"
