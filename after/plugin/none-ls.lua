local null_ls = require("null-ls")

null_ls.setup({
  sourcers = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.clang_format,
    require("none-ls.diagnostics.eslint_d"),
    null_ls.builtins.diagnostics.cppcheck
  }
})
