require("dapui").setup()
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({ enabled = true, virt_text_pos = "inline" })
require("dap-python").setup()
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "✋", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

-- Debugger
vim.api.nvim_set_keymap(
	"n",
	"<leader>dt",
	"<Cmd>lua require('dapui').toggle()<CR>",
	{ noremap = true, desc = "Toggle DAP UI" }
)
vim.api.nvim_set_keymap("n", "<leader>bp", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dq", ":DapTerminate<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", ":DapStepInto<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", ":DapStepOver<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", ":DapStepOut<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", ":DapRestartFrame<CR>", { noremap = true })
-- reset dapui in case I closed some windows I want back, or zoomed in, etc...
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
