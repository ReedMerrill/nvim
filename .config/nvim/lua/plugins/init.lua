return {
	"Shatur/neovim-session-manager",
	{ dir = "/Users/reed/code/reactive_splits.nvim" },
	-- add lua docs to the vim help pages
	{ "nanotee/luv-vimdocs" },
	-- winbar with path and symbols
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			show_modified = true,
			show_navic = false,
			theme = {
				normal = { bg = "#1f1f28", fg = "#DCD7BA" },
				basename = { bold = false },
			},
		},
	},
	{
		"miversen33/sunglasses.nvim",
		opts = {
			filter_type = "SHADE",
			filter_percent = 0.2,
			enabled = true,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
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
	-- job runner
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup({
				templates = { "user.RShiny" },
			})
		end,
	},
	-- telescope (for LSP related pickers)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Debugger
	{ "mfussenegger/nvim-dap" },
	-- DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap" } },
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
		config = function()
			local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
			require("lualine").setup({
				options = {
					icons_enabled = true,
					globalstatus = true,
					theme = kanagawa_paper,
					component_separators = "",
					section_separators = "",
				},
				sections = {
					lualine_a = {},
					lualine_c = {},
					lualine_x = {
						{
							function()
								local util = require("util")
								if util.is_tmux then
									local sess = util.tmux_session()
									local win = util.tmux_window()
									return (" %s: %s"):format(sess or "-", win or "-")
								end
								return ""
							end,
						},
					},
					lualine_y = { "encoding", "fileformat" },
					lualine_z = { "location" },
				},
			})
		end,
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
				"<leader>at",
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
