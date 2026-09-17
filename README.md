# code-2026 tmux

A tmux theme for the [code-2026](https://github.com/code-2026-theme) color scheme family, ported from VS Code's **Dark Modern 2026** and **Light 2026** themes.

## Installation

### Manual

```bash
mkdir -p ~/.config/tmux/plugins/code-2026
git clone https://github.com/code-2026-theme/tmux.git ~/.config/tmux/plugins/code-2026/tmux
```

Then add to your `~/.tmux.conf`:

```tmux
# Set options BEFORE sourcing the theme
set -g @code-2026-flavor "dark"

# Source the theme
source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026_options.conf
source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026_main.conf
```

Reload tmux:

```bash
tmux source-file ~/.tmux.conf
```

### With TPM

```tmux
set -g @plugin 'code-2026-theme/tmux'
```

Press `prefix + I` to install.

## Options

Set these **before** sourcing the theme:

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `@code-2026-flavor` | `dark`, `light`, `auto`, `sync` | `dark` | Color variant. `auto` detects macOS dark mode at startup. `sync` listens for OS changes live (tmux 3.2+). |
| `@code-2026-status-left` | comma-separated modules | `session,directory` | Left status modules |
| `@code-2026-status-right` | comma-separated modules | `application,cpu,ram,date_time` | Right status modules |
| `@code-2026-status-left-separator` | string | ` ` | Separator between left modules |
| `@code-2026-status-right-separator` | string | ` ` | Separator between right modules |
| `@code-2026-status-interval` | number | `5` | Status refresh interval (seconds) |
| `@code-2026-clock-mode-colour` | color | accent | Clock color |
| `@code-2026-clock-mode-style` | `12`, `24` | `24` | Clock format |

### Status Modules

Available modules for `@code-2026-status-left` and `@code-2026-status-right`:

| Module | Description | Requires |
|--------|-------------|----------|
| `session` | Session name | - |
| `directory` | Current window name | - |
| `date_time` | Date and time | - |
| `user` | Username (`whoami`) | - |
| `host` | Hostname | - |
| `application` | Current pane command | - |
| `cpu` | CPU percentage | [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) |
| `ram` | RAM percentage | [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) |

### Example Configuration

```tmux
# Dark mode
set -g @code-2026-flavor "dark"

# Custom modules
set -g @code-2026-status-left "session,directory"
set -g @code-2026-status-right "application,date_time"

# Auto-detect OS theme (once at startup)
set -g @code-2026-flavor "auto"

# Live-sync with OS dark/light mode (tmux 3.2+)
# Requires terminal support for color scheme notifications
# (Ghostty, kitty, WezTerm, iTerm2)
set -g @code-2026-flavor "sync"

# Source the theme
source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026_options.conf
source-file ~/.config/tmux/plugins/code-2026/tmux/code-2026_main.conf
```

## Color Palette

### Dark (VS Code Dark Modern 2026)

| Element | Color |
|---------|-------|
| Background | `#121314` |
| Foreground | `#bbbebf` |
| Accent | `#3994bc` |
| Keywords | `#ff7b72` |
| Functions | `#d2a8ff` |
| Types | `#4ec9b0` |
| Strings | `#a5d6ff` |

### Light (VS Code Light 2026)

| Element | Color |
|---------|-------|
| Background | `#ffffff` |
| Foreground | `#202020` |
| Accent | `#0069cc` |
| Keywords | `#cf222e` |
| Functions | `#8250df` |
| Types | `#116329` |
| Strings | `#0a3069` |

## Requirements

- tmux 3.2+ (for `sync` flavor)
- Terminal with color scheme notification support (for `sync`):
  - Ghostty
  - kitty
  - WezTerm
  - iTerm2
  - Windows Terminal

## Family

Part of the **code-2026** multi-target theme family:

- [Neovim](https://github.com/code-2026-theme/nvim)
- [tmux](https://github.com/code-2026-theme/tmux)
- [Ghostty](https://github.com/code-2026-theme/ghostty)
- [kitty](https://github.com/code-2026-theme/kitty)

## License

MIT
