local treesitter = require("nvim-treesitter.configs")
local telescope = require("telescope")
local conform = require("conform")
local mason_ensure_installed = require("mason-tool-installer")
local lint = require("lint")
local autopairs = require("nvim-autopairs")
local oil = require("oil")
local lualine = require("lualine")

oil.setup()
autopairs.setup()
lualine.setup({})

lint.linters_by_ft = {
	python = { "ruff" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	golang = { "golangcilint" },
}

mason_ensure_installed.setup({
	ensure_installed = {
		-- "black",
		"biome",
		"stylua",
		-- "pylint",
		-- "ruff",
		"goimports",
	},
})

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
	},
})

telescope.load_extension("ui-select")

telescope.setup()

vim.cmd("colorscheme catppuccin")

treesitter.setup({
	auto_install = false,
	ensure_installed = { "lua", "python", "javascript", "c", "typescript" },
	highlight = { enable = true },
	indent = { enable = true },
	sync_install = false,
	ignore_install = {},
	modules = { "lua", "javascript", "c", "typescript" },
})
