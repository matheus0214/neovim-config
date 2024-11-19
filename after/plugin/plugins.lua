local autopairs = require("nvim-autopairs")
local autotag = require("nvim-ts-autotag")
local terminal = require("toggleterm")
local fold = require("ufo")
local treesitter = require("nvim-treesitter.configs")
local gitsigns = require("gitsigns")
local telescope = require("telescope")
local conform = require("conform")
local mason_ensure_installed = require("mason-tool-installer")
local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
}

mason_ensure_installed.setup({
	ensure_installed = {
		"black",
		"biome",
		"stylua",
		"pylint",
	},
})

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
	},
})

telescope.load_extension("ui-select")

gitsigns.setup({
	current_line_blame = false,
})

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("rose-pine").setup({
	disable_background = false,
})

vim.cmd("colorscheme rose-pine")

autopairs.setup({})
autotag.setup({})

terminal.setup({
	size = 10,
	open_mapping = [[<C-\>]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

fold.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

treesitter.setup({
	auto_install = true,
	ensure_installed = { "lua", "python", "javascript", "c", "typescript" },
	highlight = { enable = true },
	indent = { enable = true },
	sync_install = false,
	ignore_install = {},
	modules = { "lua", "javascript", "c", "typescript" },
})
