return {
	"pauchiner/pastelnight.nvim",
	lazy = false,
	priority = 1000,
	optional = false,
	config = function()
		require("pastelnight").setup({
			style = "normal",

			--- Enable this to disable setting the background color.
			transparent = false,

			--- Configure the colors used when opening a `:terminal`.
			terminal_colors = true,

			styles = {

				--- Style to be applied to different syntax groups.
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},

				--- Background styles. Can be 'dark', 'transparent' or 'normal'.
				sidebars = "dark",
				floats = "dark",
			},
			--- Set a darker background on sidebar-like windows. ['terminal', 'packer'...].
			sidebars = {
				"qf",
				"help",
			},
			--- Enabling this option, will hide inactive statuslines and replace them
			---with a thin border instead.
			hide_inactive_statusline = false,
			--- dims inactive windows.
			dim_inactive = false,
			--- When true, section headers in the lualine theme will be bold.
			lualine_bold = true,
			--- You can override specific color groups to use other groups or a hex color,
			--- function will be called with a ColorScheme table.
			-- on_colors = function(colors) end,
			--- You can override specific highlights to use other groups or a hex color,
			--- function will be called with a Highlights and ColorScheme table.
			-- on_highlights = function(hl, c)
			--     local prompt = "#2d3149"
			--     hl.TelescopeNormal = {
			--       bg = c.bg_dark,
			--       fg = c.fg_dark,
			--     }
			--     hl.TelescopeBorder = {
			--       bg = c.bg_dark,
			--       fg = c.bg_dark,
			--     }
			--     hl.TelescopePromptNormal = {
			--       bg = prompt,
			--     }
			--     hl.TelescopePromptBorder = {
			--       bg = prompt,
			--       fg = prompt,
			--     }
			--     hl.TelescopePromptTitle = {
			--       bg = prompt,
			--       fg = prompt,
			--     }
			--     hl.TelescopePreviewTitle = {
			--       bg = c.bg_dark,
			--       fg = c.bg_dark,
			--     }
			--     hl.TelescopeResultsTitle = {
			--       bg = c.bg_dark,
			--       fg = c.bg_dark,
			--     }
			--   end,
		})
		-- vim.cmd("colorscheme pastelnight")
	end,
}
