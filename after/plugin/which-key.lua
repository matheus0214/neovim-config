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

-- Quit commands
map("n", "<F5>", "<cmd>quitall<cr>")
map("n", "<space>q", "<cmd>quit<cr>")

-- Diagnostic
map("n", "<space>df",  vim.diagnostic.open_float)
map("n", "<space>d[",  vim.diagnostic.goto_prev)
map("n", "<space>d]",  vim.diagnostic.goto_next)
map("n", "<space>dr",  vim.lsp.buf.references)
map("n", "<space>dd",  vim.lsp.buf.definition)

-- Buffer
map("n", "<space>c", ":bd<CR>")
map("n", "<space>w", "<cmd>w!<cr>")
map("n", "<S-k>", vim.lsp.buf.hover)
map("n", "rn", vim.lsp.buf.rename)
map("n", "ti", vim.lsp.buf.implementation)
map("n", "td", vim.lsp.buf.type_definition)
map("n", "tr", vim.lsp.buf.references)
map("n", "ts", vim.lsp.buf.signature_help)
map("n", "gf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>")
map("n", "<space>ca", vim.lsp.buf.code_action)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>")
map("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>")

-- Telescope
map("n", "<space>ff",  "<cmd>Telescope find_files<cr>")
map("n", "<space>fg",  "<cmd>Telescope live_grep<cr>")
map("n", "<space>fb",  "<cmd>Telescope buffers<cr>")
map("n", "<space>fk",  "<cmd>Telescope keymaps<cr>")
map("n", "<space>fh",  "<cmd>Telescope help_tags<cr>")
map("n", "<space>fc",  "<cmd>Telescope commands<cr>")
map("n", "<space>fb",  "<cmd>Telescope buffers<cr>")
map("n", "<space>fs",  "<cmd>Telescope lsp_document<cr>")

-- Git
map("n", "<space>gbb", "<cmd>Gitsigns blame<cr>")
map("n", "<space>gba", "<cmd>Gitsigns toggle_current_line_blame<cr>")
map("n", "<space>gbl", "<cmd>Gitsigns blame_line<cr>")
map("n", "<space>gr",  "<cmd>Telescope git_branches<cr>")
map("n", "<space>gt",  "<cmd>Telescope git_stash<cr>")
map("n", "<space>gs",  "<cmd>Telescope git_status<cr>")
map("n", "<space>gc",  "<cmd>Telescope git_commits<cr>")

-- Explore files tree
map("n", "<space>ee", "<cmd>:Lexplore<CR>")
map("n", "<space>ed", "<cmd>:Lexplore %:p:h<CR>")

-- Terminal
map("n", "<space>tf", "<cmd>ToggleTerm<cr>")
map("n", "<space>tv", "<cmd>ToggleTerm direction=horizontal<cr>")
map("n", "<space>gg", "<cmd>lua _lazygit_toggle()<cr>")

-- Tabs
map("n", "tn", ":tabnext<CR>")
map("n", "tp", ":tabprev<CR>")

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

