-- install lazy.nvim if it isn't already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- load plugins
require("lazy").setup("plugins")

-- load sets and remaps
require("custom.keymaps")
require("custom.opts")

-- set color column to be blank whenever wrap is set
vim.api.nvim_create_autocmd("BufEnter", {
	-- call on every file type
	pattern = "*",
	callback = function()
		local wrapped_fts = { "markdown", "quarto", "txt" }
		local ft = vim.api.nvim_get_option_value("filetype", {})
		for _, value in pairs(wrapped_fts) do
			-- check if ft is in wrapped_fts
			if value == ft then
				-- set colorcolumn to be blank
				vim.opt.colorcolumn = ""
			end
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "TSBufEnable highlight",
})

vim.cmd([[
  autocmd TermOpen * setlocal nospell
]])

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- enter insert mode when focusing a terminal
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "Set terminal to insert mode",
	group = termgroup,
	pattern = "term://*",
	callback = function()
		vim.schedule(function()
			vim.cmd(":startinsert")
		end)
	end,
})

-- for dev --------------------

-- print the contents of a lua table
P = function(v)
	print(vim.inspect(v))
	return v
end

-- source current file
vim.keymap.set("n", "<leader>lxx", function()
	vim.cmd("w")
	vim.cmd("source %")
	print("current lua file sourced")
end)
