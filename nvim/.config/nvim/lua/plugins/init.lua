return {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
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
	{
		"huggingface/llm.nvim",
		opts = {
			api_token = nil, -- cf Install paragraph
			model = "bigcode/starcoder2-15b", -- the model ID, behavior depends on backend
			backend = "huggingface", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
			url = nil, -- the http url of the backend
			tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
			-- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
			request_body = {
				parameters = {
					max_new_tokens = 60,
					temperature = 0.2,
					top_p = 0.95,
				},
			},
			-- set this if the model supports fill in the middle
			-- fim = {
			-- 	enabled = true,
			-- 	prefix = "<fim_prefix>",
			-- 	middle = "<fim_middle>",
			-- 	suffix = "<fim_suffix>",
			-- },
			debounce_ms = 150,
			accept_keymap = "<Tab>",
			dismiss_keymap = "<S-Tab>",
			tls_skip_verify_insecure = false,
			-- llm-ls configuration, cf llm-ls section
			lsp = {
				bin_path = nil,
				host = nil,
				port = nil,
				cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
				version = "0.5.3",
			},
			tokenizer = nil, -- cf Tokenizer paragraph
			context_window = 1024, -- max number of tokens for the context window
			enable_suggestions_on_startup = true,
			enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
			disable_url_path_completion = false, -- cf Backend
		},
		keys = {
			{ mode = "n", "<leader>l", "<cmd>LLMToggleAutoSuggest<cr>", desc = "toggle LMM auto suggestions" },
			-- BUG:: might not be doing anything
			{ mode = "n", "<M-s>", "<cmd>LLMSuggestion<cr>", desc = "Request LLM Suggestion" },
		},
	},
}
-- TODO:
-- [ ] add blink.cmp
