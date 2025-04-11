local telescope = require("telescope")
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
	},
})

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

vim.cmd("colorscheme onedark_dark")
