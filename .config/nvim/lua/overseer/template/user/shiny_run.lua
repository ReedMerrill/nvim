local overseer = require("overseer")
return {
	name = "Run Shiny app",
	builder = function()
		return {
			cmd = "Rscript -e 'shiny::runApp(launch.browser = TRUE)'",
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
