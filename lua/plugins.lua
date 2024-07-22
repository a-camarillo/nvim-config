return {
	{
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	config = function()
	-- load the colorscheme here
	vim.cmd([[colorscheme kanagawa-wave]])
	end
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = { theme = 'kanagawa' },
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
			},
			setup = {},
		},
		config = function(_, opts)
			require('mason').setup(opts)
			require('mason-lspconfig')
			require 'configs.lspconfig'
		end
	},
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		build = ':MasonUpdate',
		dependencies = {
			{
				'williamboman/mason-lspconfig.nvim',
				ensure_installed = {
					'lua_ls',
					'gopls',
					'pyright',
					'arduino_language_server',
				},
			},
		},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		init = function()
			vim.o.timeout=true
			vim.o.timeoutlen=300
		end,
		opts = {},
	},
	{
		'nvim-treesitter/nvim-treesitter',
	},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			require 'configs.completion'
		end
	},

	-- Completion
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },

	-- Terminal
	{
		'voldikss/vim-floaterm',
		version = '*',
	},
	{
		'stevearc/oil.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          require 'configs.oil'
        end
	},
}
