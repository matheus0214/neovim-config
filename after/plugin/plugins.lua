local telescope = require("telescope")
local conform = require("conform")
local cmp = require("cmp")

cmp.setup({
  sources = { { name = "path" } },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

vim.cmd("colorscheme onedark_dark")
