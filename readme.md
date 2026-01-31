# 🚀 Personal Neovim Configuration

A modern, minimal Neovim configuration focused on productivity and aesthetics. This setup provides a clean development environment with essential plugins and intuitive keymaps.

## ✨ Features

- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin management
- **File Explorer**: Neo-tree for intuitive file navigation
- **Fuzzy Finder**: Telescope for lightning-fast file and command searching
- **Status Line**: Lualine for beautiful status information
- **Color Scheme**: Catppuccin Mocha theme for easy on the eyes coding
- **Smart Navigation**: Relative line numbers for efficient movement

## 📦 Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [catppuccin](https://github.com/catppuccin/nvim) | Color scheme |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for telescope |

## ⌨️ Key Mappings

### Leader Key
- **Leader**: `<Space>`
- **Local Leader**: `<Space>`

### File Navigation
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>jj` | `:Neotree toggle` | Toggle Neo-tree file explorer |
| `<leader><leader>` | `:Telescope find_files` | Quick file search |

### Commands & Utilities
| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>c` | `:Telescope commands` | Open command palette |
| `<leader>C` | `:Telescope colorscheme` | Browse available colorschemes |

> **Note**: There's a duplicate keymap for `<leader>c`. You may want to change one of them to avoid conflicts.

## 🎨 Visual Settings

- **Line Numbers**: Enabled with relative numbering for efficient navigation
- **Color Scheme**: Catppuccin Mocha (dark theme)
- **Status Line**: Lualine with web dev icons

## 🛠️ Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Let Lazy.nvim install plugins**:
   - Lazy.nvim will automatically install all plugins on first startup
   - Wait for the installation to complete

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock file
├── readme.md                  # This file
└── lua/
    ├── config/
    │   ├── keymaps.lua         # Key mappings
    │   ├── lazy.lua            # Lazy.nvim setup
    │   └── nvim-config.lua     # General Neovim settings
    └── plugins/
        ├── colorscheme.lua     # Catppuccin color scheme
        ├── status-line.lua     # Lualine configuration
        ├── telescope.lua       # Telescope setup
        └── vim-tree.lua        # Neo-tree configuration
```

## 🔧 Customization

### Adding New Plugins
Create a new file in `lua/plugins/` directory:
```lua
-- lua/plugins/your-plugin.lua
return {
    "author/plugin-name",
    config = function()
        -- Plugin configuration
    end
}
```

### Adding New Keymaps
Edit `lua/config/keymaps.lua`:
```lua
vim.keymap.set('n', '<your-keymap>', '<your-command>', {
    desc = "Description of your keymap"
})
```

### Changing Color Scheme
Edit `lua/config/nvim-config.lua`:
```lua
vim.cmd.colorscheme "your-preferred-theme"
```

## 🚀 Usage Tips

1. **Quick File Search**: Press `<Space><Space>` to quickly find and open files
2. **File Explorer**: Use `<Space>jj` to toggle the file tree
3. **Command Palette**: Press `<Space>c` to access all available commands
4. **Relative Line Numbers**: Use `5j` or `10k` to jump multiple lines efficiently

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have suggestions or improvements, please share them.

---

> This configuration is designed to be minimal yet powerful, perfect for daily development work across different programming languages.
