# My NvChad Configuration
Neovim configuration for development in Rust, Python, Go, C, Javascript, PHP, lua, and more.

## Screenshot
![dashboard](https://i.ibb.co/MPSrkjC/image.png)
![lua_lsp](https://i.ibb.co/cQCdvZ4/image.png)
![rust_lsp](https://i.imgur.com/poZKw5N.png)
![go_lsp](https://i.imgur.com/3nmnXln.png)
![python_lsp](https://i.imgur.com/XJ8g9Ts.png)

## Installation
- Make sure you have `cargo`, `composer`, `go`, `npm`, and `pip` installed so that Mason can download LSP, Linter, and other stuff.
### Arch Based Installation
```bash
sudo pacman -S uv rustup composer go npm python-pip cmake

rustup install nightly
cargo install cargo-binstall

uv tool install vectorcode
```
- Obviously, a neovim.
- If you have configured Neovim before, you might want to backup your configuration first.
```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
- After that, you can clone my repository to the `~/.config/nvim` directory and launch Neovim to automatically install packages using Lazy.
```bash
git clone https://github.com/404GH0ST/my-nvchad-configuration.git ~/.config/nvim && nvim
```
- After Lazy finishes installing plugins, press `U` to update the plugins, and make sure to run `:MasonInstallAll` to install LSP and other stuff.

### PowerShell LSP
To fully configure the PowerShell LSP, we need to download and extract PowerShellEditorServices.zip from the [releases](https://github.com/PowerShell/PowerShellEditorServices/releases) to `~/LSP/PowerShellEditorServices`.
### AI Code Completion
It currently uses `supermaven` for AI code completion. You can switch to `windsurf` if you want; just uncomment the `windsurf` plugin section and comment the `supermaven` plugin. For usage, refer to [windsurf.vim](https://github.com/Exafunction/windsurf.vim) and [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim).

### Agentic AI
It currently uses `codecompaion` and `mcphub` for agentic use cases. For usage, refer to [codecompaion](https://github.com/olimorris/codecompanion.nvim) and [mcphub](https://github.com/ravitemer/mcphub.nvim). The current configuration uses Google Gemini model, you need to setup your `API_KEY` according to this discussion [GnuPG gpg](https://github.com/olimorris/codecompanion.nvim/discussions/601)
