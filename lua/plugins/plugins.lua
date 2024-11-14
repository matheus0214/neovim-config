return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    }
  },
  { "lewis6991/gitsigns.nvim" },
  { "gelguy/wilder.nvim" },
  { "windwp/nvim-ts-autotag" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
      }
    }
  },
  { "tpope/vim-commentary" },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { "rose-pine/neovim",                 name = "rose-pine" }
}
