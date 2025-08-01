-- set vault paths
local cmb = "/Users/reed/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB"
local main = "/Users/reed/Dropbox (Personal)/obsidian-vaults/main"

return {
	-- to do plugin with metadata, archiving, group check-offs
	{
		"bngarren/checkmate.nvim",
		ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
		opts = {
			files = { "*.md", "todo.md", "*.todo.md" },
			keys = {
				["<leader>tt"] = {
					rhs = "<cmd>Checkmate toggle<CR>",
					desc = "Toggle todo item",
					modes = { "n", "v" },
				},
				["<leader>tc"] = {
					rhs = "<cmd>Checkmate check<CR>",
					desc = "Set todo item as checked (done)",
					modes = { "n", "v" },
				},
				["<leader>tu"] = {
					rhs = "<cmd>Checkmate uncheck<CR>",
					desc = "Set todo item as unchecked (not done)",
					modes = { "n", "v" },
				},
				["<leader>tc="] = {
					rhs = "<cmd>Checkmate cycle_next<CR>",
					desc = "Cycle todo item(s) to the next state",
					modes = { "n", "v" },
				},
				["<leader>tn"] = {
					rhs = "<cmd>Checkmate create<CR>",
					desc = "Create todo item",
					modes = { "n", "v" },
				},
				["<leader>tr"] = {
					rhs = "<cmd>Checkmate remove_all_metadata<CR>",
					desc = "Remove all metadata from a todo item",
					modes = { "n", "v" },
				},
				["<leader>ta"] = {
					rhs = "<cmd>Checkmate archive<CR>",
					desc = "Archive checked/completed todo items (move to bottom section)",
					modes = { "n" },
				},
				["<leader>tv"] = {
					rhs = "<cmd>Checkmate metadata select_value<CR>",
					desc = "Update the value of a metadata tag under the cursor",
					modes = { "n" },
				},
				["<leader>t]"] = {
					rhs = "<cmd>Checkmate metadata jump_next<CR>",
					desc = "Move cursor to next metadata tag",
					modes = { "n" },
				},
				["<leader>t["] = {
					rhs = "<cmd>Checkmate metadata jump_previous<CR>",
					desc = "Move cursor to previous metadata tag",
					modes = { "n" },
				},
			},
			default_list_marker = "-",
			enter_insert_after_new = false,
			todo_states = {
				-- we don't need to set the `markdown` field for `unchecked` and `checked` as these can't be overriden
				---@diagnostic disable-next-line: missing-fields
				unchecked = {
					marker = "□",
					order = 1,
				},
				---@diagnostic disable-next-line: missing-fields
				checked = {
					marker = "✔",
					order = 2,
				},
				in_progress = {
					marker = "◐",
					markdown = ".",
					type = "incomplete",
					order = 50,
				},
				cancelled = {
					marker = "✗",
					markdown = "c",
					type = "complete",
					order = 2,
				},
				on_hold = {
					marker = "⏸",
					markdown = "/",
					type = "inactive",
					order = 100,
				},
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
					style = function(context)
						local value = context.value:lower()
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
						return "medium" -- Default priority
					end,
					choices = function()
						return { "low", "medium", "high" }
					end,
					key = "<leader>Tp",
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
		ui = {
			enable = false,
		},
		lazy = true,
		ft = "markdown",
		dependencies = {
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
				create_new = true,
				nvim_cmp = true,
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
			},
		},
	},
}
