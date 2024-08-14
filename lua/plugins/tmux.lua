return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-a-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Move To The Next Window", mode = "n" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Move To The Window Below", mode = "n" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Move To The Window Above", mode = "n" },
		{ "<c-a-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Move To The Right Window", mode = "n" },
	},
}
