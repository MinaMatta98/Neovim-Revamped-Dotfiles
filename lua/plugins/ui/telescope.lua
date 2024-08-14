return {
	lazy = true,
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake" } },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--hidden", "--follow" } })
			end,
			silent = true,
			mode = "n",
			desc = "Telescope Find Files",
		},

		{
			"<leader>of",
			function()
				require("telescope.builtin").oldfiles()
			end,
			mode = "n",
			desc = "Telescope Old Files",
		},
		{
			"<leader>S",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = "n",
			desc = "Telescope Grep Files",
		},
		{
			"<leader>bb",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = "n",
			desc = "Telescope Find Buffer",
		},
	},
	-- config = function()
	-- 	local telescope = require("telescope")
	-- 	local actions = require("telescope.actions")
	-- end,
}
