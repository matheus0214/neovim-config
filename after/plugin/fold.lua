local config = require('ufo')

config.setup({
  provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
  end
})
