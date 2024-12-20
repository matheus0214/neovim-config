return {
	{ "gelguy/wilder.nvim" },
	{ "tpope/vim-commentary" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
  {
    "stevearc/oil.nvim",
    dependencies = { 
      { "echasnovski/mini.icons", opts = {} } 
    },
  },
  {"stevearc/conform.nvim"},
  {"hrsh7th/nvim-cmp", dependencies = {
    "hrsh7th/cmp-path"
  }}
}
