local autopairs = require("nvim-autopairs")
local treesitter = require("nvim-treesitter.configs")
local telescope = require("telescope")
local conform = require("conform")
local mason_ensure_installed = require("mason-tool-installer")
local lint = require("lint")
local telescope_actions = require("telescope.actions")

lint.linters_by_ft = {
	python = { "ruff" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
}

mason_ensure_installed.setup({
	ensure_installed = {
		"black",
		"biome",
		"stylua",
		"pylint",
		"ruff",
	},
})

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
	},
})

telescope.load_extension("ui-select")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["s"] = telescope_actions.select_vertical,
				["t"] = telescope_actions.select_tab,
			},
		},
		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
			width = 0.9,
			height = 0.8,
			preview_cutoff = 120,
		},
		sorting_strategy = "ascending",
		initial_mode = "normal",
	},
	pickers = {
		diagnostics = {
			reviewer = true,
			fname_width = 0,
			layout_config = {
				width = 0.8,
			},
			layout_strategy = "vertical",
			sorting_strategy = "ascending",
			results_title = false,
			preview_title = false,
			prompt_title = false,
		},
		buffers = {
			previewer = false,
			theme = "dropdown",
			mappings = {
				n = {
					["<C-e>"] = "delete_buffer",
					["l"] = "select_default",
				},
			},
			initial_mode = "normal",
		},
		symbols = {
			theme = "dropdown",
		},
	},
})


vim.cmd("colorscheme americano")

autopairs.setup({})

treesitter.setup({
	auto_install = true,
	ensure_installed = { "lua", "python", "javascript", "c", "typescript" },
	highlight = { enable = true },
	indent = { enable = true },
	sync_install = false,
	ignore_install = {},
	modules = { "lua", "javascript", "c", "typescript" },
})
