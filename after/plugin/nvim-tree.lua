local nvim_tree = require('nvim-tree')

local api = require('nvim-tree.api')

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
end

nvim_tree.setup({
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {
      'node_modules',
    }
  },
  on_attach = on_attach
})

