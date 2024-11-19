vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*.*",
  command = "update"
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
            lint.try_lint()
        end
    end,
})
