# init.lua

My user configuration for [AstroNvim](https://github.com/AstroNvim/AstroNvim), based
heavily upon the [user configuration template](https://github.com/AstroNvim/user_example).
(I'd recommend using the template as a starting point, but feel free to use
whatever you find interesting from here, too.

## Key changes from the template

- [Catppuccin](https://github.com/catppuccin/nvim). The greatest colorscheme ever devised. Until I switch to another one.
- Community configs. I've installed some plugin configs from the [AstroNvim Community repository](https://github.com/AstroNvim/astrocommunity). Most of the items in here are for language support.
- NVChad-like theming. The AstroNvim docs provide some examples of how to configure [Telescope](https://docs.astronvim.com/recipes/telescope_theme/) and [the statusline](https://docs.astronvim.com/recipes/status/#replicate-nvchad-statusline) to look like NVChad, which is admittedly pretty.
- Mappings. One keybind I don't see people use often is setting arrow keys for navigating between windows, rather than for buffer motion, so watch out for that.
- Some of the most impactful plugins (for me) are:
  - [nvim-surround](https://github.com/kylechui/nvim-surround) - Lua port of tpope's amazing [vim-surround](https://github.com/tpope/vim-surround)
  - [unimpaired.nvim](https://github.com/tummetott/unimpaired.nvim) - Another Lua port of a tpope plugin, this time for [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
  - [telescope-undo](https://github.com/debugloop/telescope-undo.nvim) - undo-tree visualizer using Telescope

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```
