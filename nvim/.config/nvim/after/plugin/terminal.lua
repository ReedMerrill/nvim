-- set snacks.terminal toggle keymap here, because it doesn't override the default tag stack command when set in the snacks init
vim.keymap.set("n", "<leader>t", "<CMD>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle Terminal" })

local Terminal = require("toggleterm.terminal").Terminal

-- Function to create a terminal with a custom command
local function create_custom_terminal(cmd, keymap)
	local term = Terminal:new({
		cmd = cmd,
		hidden = false,
		direction = "horizontal",
		size = 15,
		close_on_exit = false,
	})

	-- Map keybinding to toggle the terminal
	vim.keymap.set("n", keymap, function()
		term:toggle()
	end, { noremap = true, silent = true })
end

local command = 'Rscript -e "shiny::runApp(port = 3000, launch.browser = TRUE)"'

-- Example keybindings for different commands
create_custom_terminal(command, "<leader>rr")
