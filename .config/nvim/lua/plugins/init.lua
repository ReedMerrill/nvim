return {
	-- TODO: might conflict with nvim-surround
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
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
	-- better text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{ "echasnovski/mini.ai", opts = {}, version = false },
	-- show keybindings for a given mode and prefix. Mode defaults to "n"
	--  usage:
	-- :KeyAnalyzer <prefix> [mode]
	-- :KeyAnalyzer <leader>
	-- :KeyAnalyzer <leader>b
	-- :KeyAnalyzer <C-
	{ "meznaric/key-analyzer.nvim", opts = {} },
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStart" },
		config = true,
		keys = { { "<leader>L", "<cmd>LiveServerToggle<cr>" } },
	},
}
-- TODO:
-- [ ] add blink.cmp
