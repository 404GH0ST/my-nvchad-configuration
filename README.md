# My NvChad Configuration
Neovim configuration for development in Rust, Python, Go, C, Javascript, PHP, lua, and more.

## Screenshot
![dashboard](https://i.ibb.co/MPSrkjC/image.png)
![lua_lsp](https://i.ibb.co/cQCdvZ4/image.png)
![rust_lsp](https://i.ibb.co/JcdM632/image.png)
![go_lsp](https://i.imgur.com/3nmnXln.png)

## Installation
- Make sure you have `composer`, `go`, `npm`, and `pip` installed so that Mason can download LSP, Linter, and other stuff.
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
