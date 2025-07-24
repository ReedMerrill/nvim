vim.keymap.set("n", "<leader>jr", "<cmd>OverseerQuickAction restart<cr>", { desc = "Restart the current job" })
vim.keymap.set("n", "<leader>rs", function()
	require("overseer").run_template({ name = "Run Shiny app" })
end, { desc = "Run Shiny app" })
