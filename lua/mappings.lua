local map = vim.keymap.set

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.g.mapleader = " "

-- Quit commands
map("n", "<F5>", "<cmd>quitall<cr>", { noremap = true, silent = true })
map("n", "<space>q", "<cmd>quit<cr>", { noremap = true, silent = true })

-- Diagnostic
map("n", "<space>df",  vim.diagnostic.open_float, { noremap = true, silent = true })
map("n", "<space>dp",  vim.diagnostic.goto_prev, { noremap = true, silent = true })
map("n", "<space>dn",  vim.diagnostic.goto_next, { noremap = true, silent = true })

-- Buffer
map("n", "<space>c", ":bd<CR>", { noremap = true, silent = true })
map("n", "<space>w", "<cmd>w!<cr>", { noremap = true, silent = true })
map("n", "<S-k>", vim.lsp.buf.hover, { noremap = true, silent = true })
map("n", "<space>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
map("n", "ti", vim.lsp.buf.implementation, { noremap = true, silent = true })
map("n", "td", vim.lsp.buf.type_definition, { noremap = true, silent = true })
map("n", "tr", vim.lsp.buf.references, { noremap = true, silent = true })
map("n", "ts", vim.lsp.buf.signature_help, { noremap = true, silent = true })
map({"n", "v"}, "<space>fm", "<cmd>lua require('conform').format()<cr>")
map("n", "<space>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
map("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Telescope
map("n", "<space>ff",  "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<space>fg",  "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "<space>fk",  "<cmd>Telescope keymaps<cr>", { noremap = true, silent = true })
map("n", "<space>fh",  "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
map("n", "<space>fc",  "<cmd>Telescope commands<cr>", { noremap = true, silent = true })
map("n", "<space>fb",  "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
map("n", "<space>fs",  "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true, silent = true })

-- Git
map("n", "<space>gb", "<cmd>Gitsigns blame<cr>", { noremap = true, silent = true })
map("n", "<space>ga", "<cmd>Gitsigns toggle_current_line_blame<cr>", { noremap = true, silent = true })
map("n", "<space>gl", "<cmd>Gitsigns blame_line<cr>", { noremap = true, silent = true })
map("n", "<space>gr",  "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true })
map("n", "<space>gt",  "<cmd>Telescope git_stash<cr>", { noremap = true, silent = true })
map("n", "<space>gs",  "<cmd>Telescope git_status<cr>", { noremap = true, silent = true })
map("n", "<space>gc",  "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true })

-- Explore files tree
map("n", "<space>ee", "<cmd>:Lexplore<CR>", { noremap = true, silent = true })
map("n", "<space>ed", "<cmd>:Lexplore %:p:h<CR>", { noremap = true, silent = true })

-- Terminal
map("n", "<space>tf", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
map("n", "<space>tv", "<cmd>ToggleTerm direction=horizontal<cr>", { noremap = true, silent = true })
map("n", "<space>gg", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })

-- Tabs
map("n", "tn", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "tp", ":tabprev<CR>", { noremap = true, silent = true })

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


map("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
map("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

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

map("n", "<leader>rr", ReloadConfig, { noremap = true, silent = true })
