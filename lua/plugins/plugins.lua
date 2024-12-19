return {
	{ "gelguy/wilder.nvim" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
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
	{ "cpwrs/americano.nvim" },
  {
    "stevearc/oil.nvim",
    dependencies = { 
      { "echasnovski/mini.icons", opts = {} } 
    },
  },
  {"stevearc/conform.nvim"}
}
