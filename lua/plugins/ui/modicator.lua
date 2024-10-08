return {
	"mawkler/modicator.nvim",
	init = function()
		-- These are required for Modicator to work
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	opts = {

		-- Warn if any required option is missing. May emit false positives if some
		-- other plugin modifies them, which in that case you can just ignore
		show_warnings = false,
		highlights = {
			-- Default options for bold/italic
			defaults = {
				bold = false,
				italic = false,
			},
		},
		integration = {
			lualine = {
				enabled = true,
				-- Letter of lualine section to use (if `nil`, gets detected automatically)
				mode_section = nil,
				-- Whether to use lualine's mode highlight's foreground or background
				highlight = "bg",
			},
		},
	},
}
