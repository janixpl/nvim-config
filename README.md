# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Overwrite for my configuration:

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/janixpl/nvim-config.git ~/.config/nvim

nvim
```
or

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone git@github.com:janixpl/nvim-config.git ~/.config/nvim

nvim
```
## 📂 File Structure

The files under config will be automatically loaded at the appropriate time,
so you don't need to require those files manually.
**LazyVim** comes with a set of default config files that will be loaded
**_before_** your own. See [here](https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/config)

You can add your custom plugin specs under `lua/plugins/`. All files there
will be automatically loaded by [lazy.nvim](https://github.com/folke/lazy.nvim)

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>
