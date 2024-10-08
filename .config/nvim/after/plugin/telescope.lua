local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fj", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
