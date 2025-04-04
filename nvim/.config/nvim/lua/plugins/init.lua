return {
	{
		"geg2102/nvim-python-repl",
		dependencies = "nvim-treesitter",
		ft = { "python" },
		config = function()
			require("nvim-python-repl").setup({
				execute_on_send = true,
				vsplit = false,
			})
		end,
	},
	-- telescope (for LSP actions, not the picker)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- theme
	{ "EdenEast/nightfox.nvim", opts = {} },
	-- color code highlights
	{ "brenoprata10/nvim-highlight-colors", opts = {} },
	-- Debugger
	{ "mfussenegger/nvim-dap" },
	-- DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap" } },
	-- keymap hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
		end,
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({ disable_when_zoomed = true })
		end,
	},
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "nightfox",
				component_separators = "|",
				section_separators = "",
			},
			sections = { lualine_a = { { "buffers" } } },
		},
	},
	{
		"stevearc/aerial.nvim",
		-- optional
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	-- formatting
	{ "stevearc/conform.nvim", opts = {} },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<leader>nh",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Show Notification History",
			},
		},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			gitbrowse = { enable = true },
			indent = { animate = { enabled = false } },
			input = { enabled = true },
			lazygit = { enabled = true },
			notifier = { height = { min = 1, max = 0.6 }, width = { min = 1, max = 0.8 } },
			quickfile = { enabled = true },
			rename = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			terminal = { enabled = true },
			words = { enabled = true },
			zen = { ---@class snacks.zen.Config
				-- You can add any `Snacks.toggle` id here.
				-- Toggle state is restored when the window is closed.
				-- Toggle config options are NOT merged.
				---@type table<string, boolean>
				toggles = {
					dim = false,
					git_signs = true,
					mini_diff_signs = true,
					-- diagnostics = false,
					-- inlay_hints = false,
				},
				show = {
					statusline = false, -- can only be shown when using the global statusline
					tabline = false,
				},
				---@type snacks.win.Config
				win = { style = "zen" },
				--- Callback when the window is opened.
				---@param win snacks.win
				on_open = function(win) end,
				--- Callback when the window is closed.
				---@param win snacks.win
				on_close = function(win) end,
				--- Options for the `Snacks.zen.zoom()`
				---@type snacks.zen.Config
				zoom = {
					toggles = {},
					show = { statusline = true, tabline = true },
					win = {
						backdrop = false,
						width = 120,
					},
				},
			},
		},
		keys = {
			-- lazygit
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Toggle lazygit",
			},
			-- scratch buffer
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle scratch buffer",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle zen mode",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
		},
	},
	-- Tree-sitter auto HTML tags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	-- plenary
	"nvim-lua/plenary.nvim",
	-- harpoon
	"ThePrimeagen/harpoon",
	-- neovim dev stuff for lua
	"folke/neodev.nvim",
	-- list of warnings, errors, and telescope outputs
	-- icons
	"nvim-tree/nvim-web-devicons",
	-- better text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	-- more "around" and "inside" actions
	{ "echasnovski/mini.ai", opts = {}, version = false },
	-- Launch a live server
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStart" },
		config = true,
		keys = { { "<leader>L", "<cmd>LiveServerToggle<cr>" } },
	},
	-- AI code suggestions
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
	{
		"hat0uma/csvview.nvim",
		---@module "csvview"
		---@type CsvView.Options
		opts = {
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {},
	},
}
-- TODO:
-- [ ] add blink.cmp
