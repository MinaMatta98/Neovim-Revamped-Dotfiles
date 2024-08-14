return {
	"sbdchd/neoformat",
	lazy = true,
	-- this plugin autoloads
	-- config = function()
	-- 	require("neoformat").setup()
	-- end,
	keys = {
		{ "<leader>P", "<cmd>Neoformat<cr>", mode = "n", silent = true, desc = "Format Buffer" },
	},
}
