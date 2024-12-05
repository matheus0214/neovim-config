require("options")
require("autocmd")
require("config.lazy")
require("mappings")

local signs = {
  Error = "✗",  -- Red dot or cross for errors
  Warn = "!",   -- Exclamation mark for warnings
  Hint = "➤",   -- Arrow for hints
  Info = "ℹ",   -- Info icon for informational messages
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false, -- Disable inline text
  signs = false,        -- Keep signs (gutter icons)
  underline = true,     -- Underline errors in the code
  update_in_insert = false, -- Don't show diagnostics while typing
  severity_sort = true, -- Show diagnostics in order of severity
})
