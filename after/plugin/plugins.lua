local autopairs = require('nvim-autopairs')
local autotag = require('nvim-ts-autotag')
local terminal = require('toggleterm')
local fold = require('ufo')
local treesitter = require('nvim-treesitter.configs')
local gitsigns = require('gitsigns')
local null_ls = require("null-ls")
local telescope = require("telescope")

telescope.load_extension("ui-select")

gitsigns.setup({})

telescope.setup ({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
})


null_ls.setup({
  sourcers = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.clang_format,
    require("none-ls.diagnostics.eslint_d"),
    null_ls.builtins.diagnostics.cppcheck
  }
})
require('rose-pine').setup({
    disable_background = true
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
    return { 'treesitter', 'indent' }
  end
})

treesitter.setup({
  auto_install = true,
  ensure_installed = { 'lua', 'python', 'javascript', 'c', 'typescript' },
  highlight = { enable = true },
  indent = { enable = true },
  sync_install = false,
  ignore_install = {},
  modules = {  'lua', 'javascript', 'c', 'typescript' }
})
