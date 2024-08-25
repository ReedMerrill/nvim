return {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			color_overrides = {
				mocha = {
					base = "#1a1b26",
					mantle = "#1a1b26",
					crust = "#1a1b26",
				},
			},
		},
	},
	-- plenary
	"nvim-lua/plenary.nvim",
	-- harpoon
	"ThePrimeagen/harpoon",
	-- undo tree
	"mbbill/undotree",
	-- smart splits
	"mrjones2014/smart-splits.nvim",
	-- word highlighting and cycling
	"RRethy/vim-illuminate",
	-- neovim (lua) dev stuff
	"folke/neodev.nvim",
	-- list of warnings, errors, and telescope outputs
	"folke/trouble.nvim",
	-- icons
	"nvim-tree/nvim-web-devicons",
	-- surround actions
	{ "echasnovski/mini.surround", version = "*" },
	{ "echasnovski/mini.ai", version = "*" },
	-- hardtime: motion efficiency tips
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			disabled_filetypes = { "lazy", "mason", "oil" },
		},
	},
}
