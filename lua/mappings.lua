local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Quit commands
map("n", "<space>q", "<cmd>quit<cr>", opts)
map("n", "<space>w", ":w!<CR>", opts)

-- Buffer
map("n", "<space>c", ":bd<CR>", opts)

-- Tabs
map("n", "tt", ":tabnew<CR>", opts)
map("n", "tn", "<cmd>tabnext<CR>", opts)
map("n", "tp", "<cmd>tabprevious<CR>", opts)

-- Split
map("n", "vs", ":vsplit<CR>", opts)

-- Code action
map({"n", "v"}, "<space>m", "<cmd>lua require('conform').format()<cr>")

-- Telescope
map("n", "<space>f",  "<cmd>Telescope find_files<cr>", opts)
map("n", "<space>g",  "<cmd>Telescope live_grep<cr>", opts)
map("n", "<space>b",  "<cmd>Telescope buffers<cr>", opts)
map("n", "<space>gs",  "<cmd>Telescope git_status<cr>", opts)

-- Explore files tree
map("n", "<space>e", "<cmd>:Neotree reveal_force_cwd<CR>", opts)

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

