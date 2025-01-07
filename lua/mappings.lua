local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Quit commands
map("n", "<F5>", "<cmd>quitall<cr>", opts)
map("n", "<space>q", "<cmd>quit<cr>", opts)
map("n", "<space>w", ":w!<CR>", opts)
-- Diagnostic
map("n", "<space>d",  "<cmd>Telescope diagnostics<cr>", opts)
map("n", "<space>df",  vim.diagnostic.open_float, opts)

-- Buffer
map("n", "<space>c", ":bd<CR>", opts)
map("n", "<space>r", vim.lsp.buf.rename, opts)

map("i", "<C-k>", vim.lsp.buf.signature_help, opts)

map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gt", ":tab split | lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gs", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)

-- Code action
map("n", "<space>a", vim.lsp.buf.code_action, opts)
map({"n", "v"}, "<space>m", "<cmd>lua require('conform').format()<cr>")

-- Telescope
map("n", "<space>f",  "<cmd>Telescope find_files<cr>", opts)
map("n", "<space>g",  "<cmd>Telescope live_grep<cr>", opts)
map("n", "<space>b",  "<cmd>Telescope buffers<cr>", opts)
map("n", "<space>s",  "<cmd>Telescope lsp_document_symbols<cr>", opts)

-- Explore files tree
map("n", "<space>e", "<cmd>:Oil<CR>", opts)

-- Tabs
map("n", "tn", ":tabnext<CR>", opts)
map("n", "tp", ":tabprev<CR>", opts)

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })


map("x", "J", ":move '>+1<CR>gv=gv", opts)
map("x", "K", ":move '<-2<CR>gv=gv", opts)

function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match("^user_config") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)

  local config_path = vim.fn.stdpath('config') .. '/after/plugin'
    for _, file in ipairs(vim.fn.glob(config_path .. '/*.lua', true, true)) do
        dofile(file)
    end
  print("Configuration reloaded!")
end

map("n", "<leader>rr", ReloadConfig, opts)
