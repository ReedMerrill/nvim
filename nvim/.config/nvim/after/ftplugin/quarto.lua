vim.opt.linebreak = true
vim.opt.wrap = true

-- pipe operator insertion
vim.api.nvim_set_keymap("i", "<C-->", " <- ", { noremap = true })
-- assignment operator insertion
vim.api.nvim_set_keymap("i", "<C-;>", " |>", { noremap = true })
