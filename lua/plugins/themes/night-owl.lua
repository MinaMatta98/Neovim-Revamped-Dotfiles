return {
	"oxfist/night-owl.nvim",
	event = "VeryLazy",
	-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- priority = 1000, -- make sure to load this before all the other start plugins
	optional = false,
	opts = {
		-- These are the default settings
		bold = true,
		italics = true,
		underline = true,
		undercurl = true,
		transparent_background = false,
	},
	config = function()
		-- load the colorscheme here
		-- vim.cmd.colorscheme("night-owl")
	end,
}
