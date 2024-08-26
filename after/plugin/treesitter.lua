local config = require('nvim-treesitter')

config.setup({
  auto_install = true,
  ensure_installed = {'lua', 'javacript', 'c', 'typescript'},
  highlight = {enable = true},
  indent = {enable = true}
})
