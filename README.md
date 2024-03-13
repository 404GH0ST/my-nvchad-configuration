# My NvChad Configuration
Neovim configuration for development in Rust, Python, Go, C, Javascript, PHP, lua, and more.

## Screenshot
![dashboard](https://i.ibb.co/MPSrkjC/image.png)
![lua_lsp](https://i.ibb.co/cQCdvZ4/image.png)
![rust_lsp](https://i.ibb.co/JcdM632/image.png)

## Installation
- Install the Neovim nightly build because the stable build doesn't support Inlay Hint.
- I suggest using [bob](https://github.com/MordechaiHadad/bob) so that you can switch between stable and nightly builds.
```bash
bob install nightly
bob use nightly
```
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
- After Lazy finishes installing plugins, make sure to run `:MasonInstallAll` to install LSP stuff.

### PowerShell LSP
To fully configure the PowerShell LSP, we need to download and extract PowerShellEditorServices.zip from the [releases](https://github.com/PowerShell/PowerShellEditorServices/releases) to `~/LSP/PowerShellEditorServices`.
