local overseer = require("overseer")
return {
	name = "Run R tests",
	builder = function()
		return {
			cmd = "Rscript -e 'devtools::test()'",
			strategy = {
				"toggleterm",
				open_on_start = true,
				quit_on_exit = "never",
				direction = "vertical",
				size = 80,
			},
		}
	end,
	condition = {
		filetype = { "r" },
	},
}
