return {
	"aznhe21/actions-preview.nvim",
	lazy = true, --important, this should only load on_buff attach
	-- events = -- The event will be the lsp on_attach fn()
	opts = {

		diff = {
			ctxlen = 3,
		},

		backend = { "nvim-cmp", "telescope", "nui" },

		-- options related to telescope.nvim
		telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {
			make_value = nil,
			make_make_display = nil,
		}),

		-- options for nui.nvim components
		nui = {
			-- component direction. "col" or "row"
			dir = "col",
			-- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
			keymap = nil,
			-- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
			layout = {
				position = "50%",
				size = {
					width = "60%",
					height = "90%",
				},
				min_width = 40,
				min_height = 10,
				relative = "editor",
			},
			-- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
			preview = {
				size = "60%",
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
			},
			-- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
			select = {
				size = "40%",
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
			},
		},
	},
}
