-- utils

-- save and quit with leader
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true })
vim.keymap.set("n", "<leader>wa", ":wall<CR>", { noremap = true })

-- reload the buffer from last save
vim.keymap.set("n", "<leader>e", ":e!", { desc = "Reload buffer" })

-- code navigation

-- keep cursor in the same spot for "J"
vim.keymap.set("n", "J", "mzJ`z")

-- keep the cursor in the middle of the page when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- close the buffer, not the window (container)
vim.keymap.set("n", "<leader>c", "<cmd>bp<bar>bd#<cr>", { desc = "Close Current Buffer" })

-- editing

-- (JavaScript) console.log the variable under the cursor, on the next line
-- Function to insert a console.log statement
local function insert_console_log()
	-- Get the word under the cursor
	local word = vim.fn.expand("<cword>")
	if word and word ~= "" then
		-- Insert the console.log statement
		vim.api.nvim_put({ string.format("console.log('%s:', %s);", word, word) }, "l", true, true)
	else
		print("No word under the cursor.")
	end
end
vim.api.nvim_set_keymap("n", "<leader>cl", "", {
	noremap = true,
	silent = true,
	desc = "Log the current word",
	callback = insert_console_log,
})

-- paste over a highlighted word w/o saving it to the register in visual mode
vim.keymap.set("x", "<leader>dp", [["_dP]])

-- yank to the system register in visual and normal modes
vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { noremap = true, desc = "Yank to the system clipboard" })

-- yank the entire buffer to the system register
vim.keymap.set(
	{ "n", "v", "x" },
	"<C-y>",
	":%y+<CR>",
	{ noremap = true, silent = true, desc = "Yank entire file to the system clipboard" }
)

-- clear the buffer
-- (good for using nvim as a scratchpad and doing quick text manipulation for forms)
vim.api.nvim_set_keymap(
	"n",
	"<leader>da",
	":%delete+<CR>",
	{ noremap = true, silent = true, desc = "Delete everything" }
)

-- make the file in buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- yank the path to the current file to the system clipboard
function CopyPath()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", '"' .. filepath .. '"')
	local function notifyAndClear(path) -- notify success and then clear the console
		print(string.format("%s copied", path))
		vim.defer_fn(function()
			vim.cmd("echo ''")
		end, 1000)
	end
	notifyAndClear(filepath)
end

vim.keymap.set("n", "<leader>yp", CopyPath, { noremap = true, silent = true })

-- move visual mode text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- splits/navigation

-- make a new split
vim.keymap.set({ "n" }, "<leader>\\", ":vsplit<CR>", {})
vim.keymap.set({ "n" }, "<leader>\\a", ":split<CR>", {})

-- Terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal Navigation" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal Navigation" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal Navigation" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal Navigation" })

-- go to previous buffer
vim.keymap.set("n", "<leader>b", "<cmd>b#<cr>", { noremap = true })
-- cycle through open buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { noremap = true })
