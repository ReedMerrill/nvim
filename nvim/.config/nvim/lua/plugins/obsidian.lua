-- this config is meant to load different autocmds and workspaces depending on if its on my work computer (MacOS) or personal (Linux)
return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ui = {
		enable = true, -- disable markdown render in favor of markdown.nvim
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
				path = "/Users/reed/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB",
			},
			{
				name = "main",
				path = "/Users/reed/Dropbox (Personal)/obsidian-vaults/main",
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
			["<leader>d"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},
	},
}
