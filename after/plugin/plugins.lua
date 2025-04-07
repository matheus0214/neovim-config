local telescope = require("telescope")
local conform = require("conform")
local mason_ensure_installed = require("mason-tool-installer")
local lint = require("lint")
local autopairs = require("nvim-autopairs")

autopairs.setup()

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

telescope.setup()

vim.cmd("colorscheme ponokai")
