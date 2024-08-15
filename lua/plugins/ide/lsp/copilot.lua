return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = false, auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<a-l>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			-- filetypes = {
			-- 	yaml = false,
			-- 	js = true,
			-- 	markdown = false,
			-- 	help = false,
			-- 	gitcommit = false,
			-- 	gitrebase = false,
			-- 	hgcommit = false,
			-- 	svn = false,
			-- 	cvs = false,
			-- 	["."] = false,
			-- },
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			"hrsh7th/nvim-cmp",
		},
		opts = {
			-- debug = true, -- Enable debugging
			window = {
				-- layout = "float",
				relative = "cursor",
				width = 0.35,
				height = 1,
				row = 1,
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("CopilotChat.integrations.cmp").setup()
			require("CopilotChat").setup(opts)
		end,
		keys = function()
			local chat = require("CopilotChat")
			return {
				{
					"<leader>ccq",
					function()
						local input = vim.fn.input("Quick Chat: ")
						if input ~= "" then
							chat.ask(input, { selection = require("CopilotChat.select").buffer })
						end
					end,
					desc = "CopilotChat - Quick chat",
					mode = { "n", "v" },
				},
				{
					"<leader>cch",
					function()
						local actions = require("CopilotChat.actions")
						require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
					end,
					desc = "CopilotChat - Prompt actions",
					mode = { "n", "v" },
				},
				{
					"<leader>cco",
					function()
						chat.open()
					end,
					desc = "CopilotChat - Open Chat Window",
				},
				{
					"<leader>ccc",
					function()
						chat.close()
					end,
					desc = "CopilotChat - Close Chat Window",
				},
			}
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"zbirenbaum/copilot-cmp",
		opts = {},
		config = function(_, opts)
			require("copilot_cmp").setup(opts)
		end,
	},
}
