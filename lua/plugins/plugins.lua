return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
    "stevearc/oil.nvim",
    dependencies = { 
      { "echasnovski/mini.icons", opts = {} } 
    },
  },
  {"stevearc/conform.nvim"},
  {
    "hrsh7th/nvim-cmp", 
    dependencies = {
      "hrsh7th/cmp-path"
    }
  }
}
