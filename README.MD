## Overview

Neovim config for development goals. Supported languages:

- Python
- TS/JS/CSS/HTML
- C
- Lua

## Requirements

- This configuration is developed and tested on _Neovim 0.11.4_. Other versions may work but are not officially supported.

```sh
npm install -g \
  eslint_d \
  prettier \
  pyright \
  stylelint-lsp \
  typescript-language-server \
  typescript \
  vscode-langservers-extracted
```

```sh
sudo pacman -S ripgrep
```

Configs structure

```
~/.config/nvim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── colorschemes
│   ├── lsp
│   ├── plugins
│   └── user
└── README.MD
```
