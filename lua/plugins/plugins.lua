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
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "stevearc/conform.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "mfussenegger/nvim-lint" },
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
	},
	{ "windwp/nvim-autopairs" },
	{ "nvim-lualine/lualine.nvim" },
	{ "catppuccin/nvim" },
}
