vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*.*",
  command = "update"
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})
