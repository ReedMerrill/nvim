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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- plenary
	"nvim-lua/plenary.nvim",
	-- harpoon
	"ThePrimeagen/harpoon",
	-- undo tree
	"mbbill/undotree",
	-- word highlighting and cycling
	"RRethy/vim-illuminate",
	-- neovim (lua) dev stuff
	"folke/neodev.nvim",
	-- list of warnings, errors, and telescope outputs
	"folke/trouble.nvim",
	-- icons
	"nvim-tree/nvim-web-devicons",
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- better text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{ "echasnovski/mini.ai", opts = {}, version = false },
	{ "meznaric/key-analyzer.nvim", opts = {} },
	-- show keybindings for a given mode and prefix. Mode defaults to "n"
	--  usage:
	-- :KeyAnalyzer <prefix> [mode]
	-- :KeyAnalyzer <leader>
	-- :KeyAnalyzer <leader>b
	-- :KeyAnalyzer <C-
}
