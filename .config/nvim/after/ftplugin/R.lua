-- indentation and format
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- assignment operator insertion
vim.api.nvim_set_keymap("i", "<C-j>", " <- ", { noremap = true })
-- pipe operator insertion
vim.api.nvim_set_keymap("i", "<C-k>", " |>", { noremap = true })
-- membership operator insertion
vim.api.nvim_set_keymap("i", "<C-l>", "%in%", { noremap = true })

-- R dev functions and keymaps

-- Function to run testthat::test_file() on current file in terminal split
local function run_r_testthat()
	-- Construct the R command
	local r_command = 'R -q -e "devtools::test()"'

	-- Open a terminal split at the bottom
	vim.cmd("botright split")
	vim.cmd("resize 15") -- Adjust the height of the terminal split
	vim.cmd("terminal " .. r_command)

	-- Enter Terminal mode
	vim.cmd("startinsert")
end

-- Create a Neovim command to call the function
vim.api.nvim_create_user_command("RunRTestAll", run_r_testthat, {})
