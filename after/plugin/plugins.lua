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
	python = {"ruff" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
}
local function get_pylint_path()
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
        return venv .. '/bin/pylint' -- Adjust for Windows: venv .. '\\Scripts\\pylint'
    else
        return 'pylint' -- Fallback to system pylint
    end
end

-- lint.linters.pylint.cmd = get_pylint_path()

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

vim.cmd("colorscheme lunaperche")

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
