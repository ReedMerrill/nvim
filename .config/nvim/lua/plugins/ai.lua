return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
		dependencies = {
			"j-hui/fidget.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/codecompanion-history.nvim", -- Save and load conversation history
			{
				"zbirenbaum/copilot.lua",
				opts = { panel = { enabled = false } },
			},
			{
				"Davidyz/VectorCode", -- Index and search code in your repositories
				version = "*",
				build = "uv tool install vectorcode",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "codecompanion" },
			},
		},
		opts = {
			picker = "snacks",
		},
		keys = {
			{
				"<leader>cc",
				function()
					vim.cmd("CodeCompanionChat toggle")
				end,
				desc = "Toggle AI Chat",
			},
		},
	},
}
