Neovim Configuration
This repository contains my personal configuration for Neovim. It is optimized for Python development, with plugins for syntax highlighting, code linting, formatting, and more.

Features
Python Development:

Syntax highlighting with nvim-treesitter.
Code linting and fixing using ALE (configured with flake8, pylint, and black).
Language Server Protocol (LSP) integration using nvim-lspconfig with pyright.
Autocompletion powered by nvim-cmp.
File Management:

NERDTree for file exploration.
Powerful search and navigation with Telescope.
Theme:

Gruvbox theme for a pleasing and consistent look.
Efficiency:

Auto-save functionality with the vim-auto-save plugin.
Hotkey for running Python scripts directly from Neovim.
Smart indentation and clipboard integration.
Installation
Prerequisites
Install Neovim.
Install vim-plug, the plugin manager.
Setup
Clone this repository into your Neovim configuration folder:

bash
Копировать код
git clone git@github.com:04Slava04/nvimcfg.git ~/.config/nvim
Open Neovim and install plugins:

bash
Копировать код
nvim
:PlugInstall
Ensure you have Python 3 and necessary packages:

bash
Копировать код
pip install flake8 pylint black
(Optional) Install pyright globally for LSP:

bash
Копировать код
npm install -g pyright
Usage
File Management:

Open NERDTree: <Ctrl-n>
Search for files: <Ctrl-p>
Live grep: <Ctrl-f>
Run Python Script:

Press <leader>r to execute the current file in Python.
Auto-save:

The file is saved automatically after a change (enabled by default).
Customization
Feel free to modify the init.vim file to add more plugins or tweak the configuration to suit your workflow.

Hotkeys
Hotkey	Action
<Ctrl-n>	Toggle NERDTree
<Ctrl-p>	Search for files with Telescope
<Ctrl-f>	Live grep with Telescope
<leader>r	Run the current Python script
