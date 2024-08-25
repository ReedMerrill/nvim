return {
	-- Main DAP
	"mfussenegger/nvim-dap",
	-- DAP UI
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"theHamsta/nvim-dap-virtual-text",
	{ "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap" } },
}
