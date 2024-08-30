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
require("custom")

-- theme
vim.cmd.colorscheme("catppuccin-mocha")

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
