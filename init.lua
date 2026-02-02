local opt = vim.opt
local keymap = vim.keymap

-- options
opt.number = true
opt.signcolumn = "yes"
opt.relativenumber = true
opt.winborder = "rounded"
opt.tabstop = 4
vim.bo.tabstop = 4
opt.shiftwidth = 4
vim.bo.shiftwidth = 4

--some keymaps
vim.g.mapleader = " "
keymap.set("n", "<leader>o", ":update<CR> :source<CR>")

--all the plugins can be added like these without lazy :D
vim.pack.add({
	-- themes
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	-- plugins
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	-- lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- completions
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	--copilot
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/copilotlsp-nvim/copilot-lsp"},
	{ src = "https://github.com/zbirenbaum/copilot-cmp" }
})


--copilot
require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<M-l>",      -- Alt+l to accept suggestion
			accept_word = "<M-w>", -- Alt+w to accept word
			accept_line = "<M-j>", -- Alt+j to accept line
			next = "<M-]>",        -- Alt+] next suggestion
			prev = "<M-[>",        -- Alt+[ previous suggestion
			dismiss = "<C-]>",     -- Ctrl+] dismiss
		},
	},
	panel = { enabled = false },
})

-- ui customizations
require("vague").setup({ transparent = false })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

--lsp
require("mason").setup()
vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
	"tailwindcss",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
	"zls",
})

keymap.set("n", "lf", vim.lsp.buf.format)

require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"rust_analyzer",
		"ts_ls",
		"tailwindcss",
		"emmet_language_server",
		"emmet_ls",
		"zls",
		"eslint-lsp",
		"prettier",
	},
})

-- to remove the vim error in configs
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- autocomplete
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	fuzzy = {
		implementation = "lua",
	},
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	keymap = {
		preset = "enter",
		["<C-y>"] = { "select_and_accept" },
	},
})


-- files stuff
--
-- pick
require("mini.pick").setup()
keymap.set("n", "<leader><leader>", ":Pick files<CR>")
keymap.set("n", "<leader>h", ":Pick help<CR>")
--
--oil
require("oil").setup()
keymap.set("n", "<leader>jj", ":Oil <CR>")
--

---------nvim tree------------
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optioinal
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
