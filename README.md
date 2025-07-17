# My NvChad Configuration

A feature-rich Neovim configuration built on NvChad, tailored for modern development workflows across multiple programming languages.

## ✨ Features

* **Multi-Language Support:** Optimized for Rust, Python, Go, C, C#, JavaScript, PHP, Lua, Zig, and PowerShell, with dedicated LSP and linting configurations.
* **Intelligent Code Completion:** Leverages `supermaven` for advanced AI-powered code completion. Easily switch to `windsurf` if preferred.
* **Agentic AI Capabilities:** Integrated with `codecompanion` and `mcphub` for enhanced agentic AI use cases, powered by Google Gemini (requires API key setup).
* **Comprehensive Tooling:** Seamless integration with `Mason` for automatic installation and management of Language Servers (LSPs), linters, and formatters.
* **Intuitive Keybindings:** Custom keymaps for efficient navigation, code editing, and plugin interactions.
* **Visual Feedback:** Clear screenshots showcasing the dashboard, LSP features for various languages (Lua, Rust, Go, Python).

## 🚀 Installation

This configuration assumes you have Neovim installed. If you have an existing Neovim configuration, it's highly recommended to back it up first.

### Prerequisites

Ensure the following tools are installed on your system for optimal functionality, as Mason relies on them for LSP, Linter, and other installations:

* `cargo` (Rust package manager)
* `composer` (PHP dependency manager)
* `go` (Go programming language)
* `npm` (Node.js package manager)
* `pip` (Python package installer)
* `cmake` (Cross-platform build system)
* `uv` (Python package installer and resolver)

### Arch-Based Systems

```bash
sudo pacman -S uv rustup dotnet-sdk composer go npm python-pip cmake

rustup install nightly
cargo install cargo-binstall

uv tool install vectorcode
```

### Backup Existing Neovim Configuration (Recommended)

```bash
# Required
mv ~/.config/nvim{,.bak}

# Optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Clone and Initialize

Clone this repository to your Neovim configuration directory and launch Neovim. Lazy will automatically install all necessary plugins.

```bash
git clone https://github.com/404GH0ST/my-nvchad-configuration.git ~/.config/nvim && nvim
```

### Post-Installation Steps

1. **Update Plugins:** After Lazy finishes installing plugins, press `U` inside Neovim to update them.
2. **Install LSPs and Tools:** Run `:MasonInstallAll` to install all recommended Language Servers, linters, and formatters via Mason.

### Additional Configurations

#### PowerShell LSP

For full PowerShell LSP support, download and extract `PowerShellEditorServices.zip` from the [official releases](https://github.com/PowerShell/PowerShellEditorServices/releases) to `~/LSP/PowerShellEditorServices`.

#### AI Code Completion

This configuration uses `supermaven` by default. To switch to `windsurf`, simply uncomment the `windsurf` plugin section and comment out the `supermaven` section in your configuration files. Refer to the official documentation for usage:

* [`windsurf.vim`](https://github.com/Exafunction/windsurf.vim)
* [`supermaven-nvim`](https://github.com/supermaven-inc/supermaven-nvim)

#### Agentic AI Setup

The agentic AI features (`codecompanion` and `mcphub`) are configured to use the Google Gemini model. You will need to set up your `API_KEY` as per the instructions in this discussion: [GnuPG gpg](https://github.com/olimorris/codecompanion.nvim/discussions/601).

## 📸 Screenshots

![dashboard](https://i.ibb.co/MPSrkjC/image.png)
![lua_lsp](https://i.ibb.co/cQCdvZ4/image.png)
![rust_lsp](https://i.imgur.com/poZKw5N.png)
![go_lsp](https://i.imgur.com/3nmnXln.png)
![python_lsp](https://i.imgur.com/XJ8g9Ts.png)
