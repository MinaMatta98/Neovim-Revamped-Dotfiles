return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<C-f>", "<cmd>NvimTreeToggle<cr>", mode = "n", silent = true, desc = "Toggle NeoVim Tree File Explorer" },
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 40,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			enable = false,
			-- dotfiles = false,
		},
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
			update_cwd = true,
		},
	},
	config = function(_, opts)
		vim.g.nvim_tree_respect_buf_cwd = 1
		require("nvim-tree").setup(opts)
	end,
}
