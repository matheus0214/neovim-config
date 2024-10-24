local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local nvim_lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason.setup()
mason_lsp.setup({
  ensure_installed = {'biome', 'lua_ls', 'ts_ls', 'clangd', 'rust_analyzer', 'pyright'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

nvim_lspconfig.ts_ls.setup({
  capabilities = capabilities,
})
nvim_lspconfig.clangd.setup({
  capabilities = capabilities,
})
nvim_lspconfig.lua_ls.setup({
  capabilities = capabilities,
})
nvim_lspconfig.rust_analyzer.setup({
  capabilities = capabilities
})
nvim_lspconfig.pyright.setup({
  capabilities = capabilities
})
nvim_lspconfig.biome.setup({
  capabilities = capabilities
})
