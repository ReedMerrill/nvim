-- set vault paths
local cmb = "/Users/reed/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB"
local main = "/Users/reed/Dropbox (Personal)/obsidian-vaults/main"

return {
	-- to do plugin with metadata, archiving, group check-offs
	{
		"bngarren/checkmate.nvim",
		ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
		opts = {
			files = { "todo.md", "*.todo.md" },
			keys = {
				["<leader>tt"] = "toggle",
				["<leader>tc"] = "check",
				["<leader>tu"] = "uncheck",
				["<leader>tn"] = "create",
				["<leader>tr"] = "remove_all_metadata",
				["<leader>ta"] = "archive",
			},
			default_list_marker = "-",
			enter_insert_after_new = false,
			todo_markers = {
				unchecked = "[ ]", -- WARN: multi-character markers are not supported, but they work ATM
				checked = "✔",
			},
			metadata = {
				done = {
					aliases = { "completed", "finished" },
					style = { fg = "#96de7a" },
					get_value = function()
						return tostring(os.date("%m/%d/%y %H:%M"))
					end,
					key = "<leader>td",
					on_add = function(todo_item)
						require("checkmate").set_todo_item(todo_item, "checked")
					end,
					on_remove = function(todo_item)
						require("checkmate").set_todo_item(todo_item, "unchecked")
					end,
					sort_order = 10,
				},
				priority = {
					-- Dynamic styling based on the tag's current value
					style = function(value)
						local value = value:lower()
						if value == "high" then
							return { fg = "#ff5555", bold = true }
						elseif value == "medium" then
							return { fg = "#ffb86c" }
						elseif value == "low" then
							return { fg = "#8be9fd" }
						else -- fallback
							return { fg = "#8be9fd" }
						end
					end,
					get_value = function()
						return "medium"
					end, -- Default value
					key = "<leader>tp",
					sort_order = 10,
					jump_to_on_insert = "value",
					select_on_insert = true,
				},
			},
		},
		archive = {
			heading = {
				title = "Archive",
				level = 1, -- e.g. ##
			},
			parent_spacing = 0, -- no extra lines between archived todos
		},
	},
	-- obsidian
	-- this config is meant to load different autocmds and workspaces depending on if its on my work computer (MacOS) or personal (Linux)
	{
		-- "epwalsh/obsidian.nvim",
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		ui = {
			enable = true,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
			},
		},
		lazy = true,
		-- for activating on all markdown files
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "CMB",
					path = cmb,
				},
				{
					name = "main",
					path = main,
				},
			},
			-- customize how note IDs are generated given an optional title.
			---@param title string|?
			---@return string
			note_id_func = function(title)
				if title ~= nil then
					-- Transform title into a valid file name.
					title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, return an error.
					error("No file name argument provided.")
				end
				return title
			end,
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				-- ["<leader>d"] = {
				-- 	action = function()
				-- 		require("obsidian").util.toggle_checkbox()
				-- 		vim.cmd("normal j")
				-- 	end,
				-- 	opts = { buffer = true },
				-- },
			},
		},
	},
}
