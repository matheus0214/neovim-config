local map = vim.keymap.set
local wk = require("which-key")
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

local mappings = {
  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                     desc = "Explorer" },
  { "F3",         "<cmd>quitall<cr>",                            desc = "Quit all" },
  { "<space>q",   "<cmd>quit<cr>",                               desc = "Quit" },

  { "<space>s",   group = "Split" },
  { "<space>sh",  "<cmd>split<cr>",                              desc = "Horizontal split" },
  { "<space>sv",  "<cmd>vsplit<cr>",                             desc = "Vertical split" },

  { "<space>w",   "<cmd>w!<cr>",                                 desc = "Save buffer" },

  { "<space>f",   group = "Telescope" },
  { "<space>ff",  "<cmd>Telescope find_files<cr>",               desc = "Find files" },
  { "<space>fg",  "<cmd>Telescope live_grep<cr>",                desc = "Live grep" },
  { "<space>fb",  "<cmd>Telescope buffers<cr>",                  desc = "Buffers" },
  { "<space>fk",  "<cmd>Telescope keymaps<cr>",                  desc = "Keymaps" },
  { "<space>fh",  "<cmd>Telescope help_tags<cr>",                desc = "Help tags" },
  { "<space>fc",  "<cmd>Telescope commands<cr>",                 desc = "Commands" },
  { "<space>fs",  "<cmd>Telescope lsp_document_symbols<cr>",     desc = "Symbols" },

  { "<space>g",   group = "Git" },
  { "<space>gbb", "<cmd>Gitsigns blame<cr>",                     desc = "Blame" },
  { "<space>gba", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame line toogle" },
  { "<space>gbl", "<cmd>Gitsigns blame_line<cr>",                desc = "Blame line" },
  { "<space>gr",  "<cmd>Telescope git_branches<cr>",             desc = "Branches" },
  { "<space>gt",  "<cmd>Telescope git_stash<cr>",                desc = "Stash list" },
  { "<space>gs",  "<cmd>Telescope git_status<cr>",               desc = "Status" },
  { "<space>gc",  "<cmd>Telescope git_commits<cr>",              desc = "Commits" },

  { "td",  ":tab split | lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "tv",  ":vsplit | lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "<S-k>", vim.lsp.buf.hover, desc = "Show hover information" },
  { "tD", vim.lsp.buf.declaration, desc = "Jumps to the declaration of the symbol" },
  { "ti", vim.lsp.buf.implementation, desc = "Lists all the implementations"},
  { "to", vim.lsp.buf.type_definition, desc = "Jumps to the definition"},
  { "tr", vim.lsp.buf.references, desc = "Lists all the references"},
  { "ts", vim.lsp.buf.signature_help, desc = "Displays signature information"},
  { "<F2>", vim.lsp.buf.rename, desc = "Rename"},
  { "<F4>", vim.lsp.buf.code_action, desc = "Code actions"},
  { "<leader>gf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", desc = "Format"},

  { "<space>d",   group = "Diagnostic" },
  { "<space>df",  vim.diagnostic.open_float,                     desc = "Diagnostic float" },
  { "<space>d[",  vim.diagnostic.goto_prev,                      desc = "Diagnostic previous" },
  { "<space>d]",  vim.diagnostic.goto_next,                      desc = "Diagnostic next" },
  { "<space>dr",  vim.lsp.buf.references,                        desc = "References" },
  { "<space>dd",  vim.lsp.buf.definition,                        desc = "Definition" },
  { "<space>dh",  vim.lsp.buf.hover,                             desc = "Definition hover" },

  { "<space>t",   group = "Terminal" },
  { "<space>tf",  "<cmd>ToggleTerm<cr>",                         desc = "Open terminal float" },

  -- { "<S-h>",      "<cmd>tabprevious<cr>",                        desc = "Previous tab" },
  -- { "<S-l>",      "<cmd>tabnext<cr>",                            desc = "Previous next" }
  { "<S-l>",      ":BufferNext<cr>",                            desc = "Next tab" },
  { "<S-h>",      ":BufferPrevious<cr>",                            desc = "Previous tab" },
  { "<leader>c",      ":BufferClose<cr>",                            desc = "Close tab" },

}

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


wk.add(mappings, {})
wk.add({
  { "<space>gg", "<cmd>lua _lazygit_toggle()<cr>",           desc = "Lazygit" },
  { "<space>rn", "<cmd>lua require('renamer').rename()<cr>", desc = "Rename" }
})