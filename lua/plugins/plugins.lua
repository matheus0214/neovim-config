return {
	{ "gelguy/wilder.nvim" },
	{ "tpope/vim-commentary" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "stevearc/conform.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "windwp/nvim-autopairs" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
    {
      "shawilly/ponokai"
    }
}
