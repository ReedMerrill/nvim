vim.keymap.set(
	"n",
	"<leader>ss",
	":SessionManager save_current_session<cr>",
	{ noremap = true, desc = "Save current session" }
)
vim.keymap.set("n", "<leader>so", ":SessionManager load_session<cr>", { noremap = true, desc = "Load session" })
