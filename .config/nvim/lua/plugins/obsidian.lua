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
	-- ft = "markdown",
	-- to only activate while inside a specified obsidian vault.
	-- Function to return different autocmds depending on if its my personal or work laptop
	event = function()
		if vim.loop.os_uname().sysname == "Linux" then
			return {
				"BufReadPre " .. vim.fn.expand("~") .. "/Dropbox/obsidian-vaults/main/*.md",
				"BufNewFile " .. vim.fn.expand("~") .. "/Dropbox/obsidian-vaults/main/*.md",
			}
		else
			return {
				"BufReadPre "
					.. vim.fn.expand("~")
					.. "/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB/*.md",
				"BufNewFile "
					.. vim.fn.expand("~")
					.. "/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB/*.md",
			}
		end
	end,
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = function()
		if vim.loop.os_uname().sysname == "Linux" then
			return {
				workspaces = {
					{
						name = "main",
						path = "/home/reed/Dropbox/obsidian-vaults/main",
					},
				},
			}
		else
			return {
				workspaces = {
					{
						name = "CMB",
						path = "/Users/reed/Can. Mun. Barometer Dropbox/Reed Merrill/3-resources/obsidian/CMB",
					},
				},
			}
		end
	end,
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
	},
}
