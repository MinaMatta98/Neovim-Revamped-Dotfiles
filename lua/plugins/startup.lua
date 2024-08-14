return {
	"startup-nvim/startup.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		local theme = {
			-- -	- every line should be same width without escaped \
			header = {
				type = "text",
				align = "center",
				fold_section = false,
				title = "Header",
				margin = 5,
				content = require("startup.headers").hydra_header,
				highlight = "Statement",
				default_color = "",
				oldfiles_amount = 0,
			},
			header_2 = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Quote",
				margin = 5,
				content = require("startup.functions").quote(),
				highlight = "Constant",
				default_color = "",
				oldfiles_amount = 0,
			},
			-- name which will be displayed and command
			body = {
				type = "mapping",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Basic Commands",
				margin = 5,
				content = {
					{ " Find File", "Telescope find_files", "<leader>ff" },
					{ "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
					{ " Recent Files", "Telescope oldfiles", "<leader>of" },
					{ " File Browser", "Telescope file_browser", "<leader>fb" },
					{ " Colorschemes", "Telescope colorscheme", "<leader>cs" },
					{ " New File", "lua require'startup'.new_file()", "<leader>nf" },
				},
				highlight = "String",
				default_color = "",
				oldfiles_amount = 0,
			},
			footer = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Footer",
				margin = 5,
				content = { "startup.nvim" },
				highlight = "Number",
				default_color = "",
				oldfiles_amount = 0,
			},
			-- lazy = function()
			--     local stats = require("lazy").stats()
			--     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			--     return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
			--   end,
			options = {
				mapping_keys = true,
				cursor_column = 0.5,
				empty_lines_between_mappings = true,
				disable_statuslines = true,
				paddings = { 1, 3, 3, 0 },
			},
			mappings = {
				execute_command = "<CR>",
				open_file = "o",
				open_file_split = "<c-o>",
				open_section = "<TAB>",
				open_help = "?",
			},
			colors = {
				background = "#1f2227",
				folded_section = "#56b6c2",
			},
			parts = {
				"header",
				"header_2",
				"body",
				"footer",
				-- "lazy"
			},
		}
		require("startup").setup(theme)
	end,
}
