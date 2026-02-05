# Neovim Configuration for Data Science & Analytics

A modern Neovim configuration tailored for data science, analytics, and scientific computing.

---

## 📦 Key Plugins & Modules

### 🧬 Data Science & Interactive Tools

- **[molten-nvim](https://github.com/benlubas/molten-nvim)**: Manages Jupyter kernels and handles interactive cell execution directly within the buffer.
- **[image.nvim](https://github.com/3rd/image.nvim)**: The core graphics engine that renders plots and images. It is configured to automatically switch between inline and popup rendering based on the terminal environment.
- **[R.lua](https://github.com/R-nvim/R.nvim)**: Comprehensive integration for the R language and Quarto documents, essential for statistical analysis.
- **[vim-slime](https://github.com/jpalardy/vim-slime)**: Sends code from your buffer to a REPL or terminal pane.

### 🧠 Code Intelligence

- **LSP (Language Server Protocol)**: Provides "IDE-like" features such as autocompletion, go-to-definition, and real-time error checking for Python and R.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting that understands code structure for more readable data scripts.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: A fast and extensible completion engine for snippets and code suggestions.

### 🛠️ Productivity & Workflow

- **[auto-session](https://github.com/rmagatti/auto-session)**: Automatically saves and restores your workspace, including all open files and layout.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A powerful fuzzy finder for quickly locating files, code symbols, and git commits.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A fast file explorer for managing your project directory.

---

## 📂 Project Structure

```text
.
├── init.lua                # Main entry point
├── lazy-lock.json          # Plugin lockfile (version tracking)
├── README.md               # Project documentation
└── lua/
    └── shreyit/            # Personal namespace
        ├── core/           # Fundamental settings
        │   ├── keymaps.lua # Global shortcuts
        │   ├── options.lua # Vim options (indentation, swapfiles)
        │   └── ui.lua      # Interface tweaks
        └── plugins/        # Plugin specifications
            ├── molten.lua  # Jupyter/Interactive kernel
            ├── image.lua   # Terminal image rendering
            ├── R.lua       # R and Quarto integration
            ├── lsp.lua     # Language servers (Python/R)
            └── ...         # UI and utility plugins

```

---

## ⚡ Quick Start

### 1. Prerequisites

- **Neovim v0.10+** (v0.12-dev recommended).
- **ImageMagick**: Required for terminal image rendering.
- **Python Dependencies**:

```bash
pip install pynvim jupyter_client cairosvg pillow

```

### 2. Installation

```bash
git clone https://github.com/Shreyit/my-neovim-ds-config.git ~/.config/nvim

```

### 3. Initialization

Open Neovim and run the following commands to install plugins and register remote providers:

```vim
:Lazy sync
:UpdateRemotePlugins

```

---
