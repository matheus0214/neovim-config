return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "gelguy/wilder.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
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
	{ "tpope/vim-commentary" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},
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
	{ "EdenEast/nightfox.nvim", name = "nightfox" },
	{ "folke/zen-mode.nvim" },
	{ "stevearc/conform.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "nvim-lualine/lualine.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
  {"catppuccin/nvim"},
}
