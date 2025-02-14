-- set snacks.terminal toggle keymap here, because it doesn't override the default tag stack command when set in the snacks init
vim.keymap.set("n", "<leader>t", "<CMD>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle Terminal" })
