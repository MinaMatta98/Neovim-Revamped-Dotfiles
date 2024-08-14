return {
	"mikavilpas/yazi.nvim",
	-- dependencies = {{"MagicDuck/grug-far.nvim", config=true}},
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		-- {
		--   "<leader>-",
		--   "<cmd>Yazi<cr>",
		--   desc = "Open yazi at the current file",
		-- },
		-- {
		--   -- Open in the current working directory
		--   "<leader>cw",
		--   "<cmd>Yazi cwd<cr>",
		--   desc = "Open the file manager in nvim's working directory" ,
		-- },
		{
			-- NOTE: this requires a version of yazi that includes
			-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			"<C-y>",
			"<cmd>Yazi<cr>",
			desc = "Resume the last yazi session",
			mode = "n",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		use_ya_for_events_reading = true,
		use_yazi_client_id_flag = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
