return {
	"ray-x/go.nvim",
	lazy = true,
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	opts = {
		lsp_inlay_hints = {
			enable = true,
			-- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
			-- inlay only available for 0.10.x
			style = "eol",
			-- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
			-- Only show inlay hints for the current line
			only_current_line = false,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",
			-- whether to show variable name before type hints with the inlay hints or not
			-- default: false
			show_variable_name = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "󰊕 ",
			show_parameter_hints = true,
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 6,
			-- The color of the hints
			highlight = "Comment",
		},
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
