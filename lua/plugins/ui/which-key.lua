return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			"<Control>",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			---@type false | "classic" | "modern" | "helix"
			preset = "classic",
			-- Delay before showing the popup. Can be a number or a function that returns a number.
			---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
			delay = 500,
			-- filter = function(mapping)
			-- 	-- example to exclude mappings without a description
			-- 	-- return mapping.desc and mapping.desc ~= ""
			-- 	return true
			-- end,
			--- You can add any mappings here, or use `require('which-key').add()` later
			spec = {},
			-- show a warning when issues were detected with your mappings
			notify = true,
			-- Which-key automatically sets up triggers for your mappings.
			-- But you can disable this and setup the triggers manually.
			-- Check the docs for more info.
			triggers = {
				{ "<auto>", mode = "nxsot" },
			},
			-- Start hidden and wait for a key to be pressed before showing the popup
			-- Only used by enabled xo mapping modes.
			---@param ctx { mode: string, operator: string }
			defer = function(ctx)
				return ctx.mode == "V" or ctx.mode == "<C-V>"
			end,
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			win = {
				-- don't allow the popup to overlap with the cursor
				no_overlap = true,
				-- width = 1,
				-- height = { min = 4, max = 25 },
				-- col = 0,
				-- row = math.huge,
				-- border = "none",
				padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
				title = true,
				title_pos = "center",
				zindex = 1000,
				-- Additional vim.wo and vim.bo options
				bo = {},
				wo = {
					-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				},
			},
			layout = {
				width = { min = 20 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
			},
			keys = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			--- Mappings are sorted using configured sorters and natural sort of the keys
			--- Available sorters:
			--- * local: buffer-local mappings first
			--- * order: order of the items (Used by plugins like marks / registers)
			--- * group: groups last
			--- * alphanum: alpha-numerical first
			--- * mod: special modifier keys last
			--- * manual: the order the mappings were added
			--- * case: lower-case first
			sort = { "local", "order", "group", "alphanum", "mod" },
			expand = 0, -- expand groups when <= n mappings
			-- expand = function(node)
			--   return not node.desc -- expand all nodes without a description
			-- end,
			-- Functions/Lua Patterns for formatting the labels
			---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
			replace = {
				key = {
					function(key)
						return require("which-key.view").format(key)
					end,
					-- { "<Space>", "SPC" },
				},
				desc = {
					{ "<Plug>%(?(.*)%)?", "%1" },
					{ "^%+", "" },
					{ "<[cC]md>", "" },
					{ "<[cC][rR]>", "" },
					{ "<[sS]ilent>", "" },
					{ "^lua%s+", "" },
					{ "^call%s+", "" },
					{ "^:%s*", "" },
				},
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
				ellipsis = "…",
				-- set to false to disable all mapping icons,
				-- both those explicitely added in a mapping
				-- and those from rules
				mappings = true,
				--- See `lua/which-key/icons.lua` for more details
				--- Set to `false` to disable keymap icons from rules
				rules = {},
				-- use the highlights from mini.icons
				-- When `false`, it will use `WhichKeyIcon` instead
				colors = true,
				-- used by key format
				keys = {
					Up = " ",
					Down = " ",
					Left = " ",
					Right = " ",
					C = "󰘴 ",
					M = "󰘵 ",
					D = "󰘳 ",
					S = "󰘶 ",
					CR = "󰌑 ",
					Esc = "󱊷 ",
					ScrollWheelDown = "󱕐 ",
					ScrollWheelUp = "󱕑 ",
					NL = "󰌑 ",
					BS = "󰁮",
					Space = "󱁐 ",
					Tab = "󰌒 ",
					F1 = "󱊫",
					F2 = "󱊬",
					F3 = "󱊭",
					F4 = "󱊮",
					F5 = "󱊯",
					F6 = "󱊰",
					F7 = "󱊱",
					F8 = "󱊲",
					F9 = "󱊳",
					F10 = "󱊴",
					F11 = "󱊵",
					F12 = "󱊶",
				},
			},
			show_help = true, -- show a help message in the command line for using WhichKey
			-- show_keys = true, -- show the currently pressed key and its label as a message in the command line
			-- disable WhichKey for certain buf types and file types.
			disable = {
				ft = {},
				bt = {},
			},
			debug = false, -- enable wk.log in the current directory
		})
		wk.add({
			{ "<leader>c", group = "Github Copilot" }, -- group
			{ "<leader>f", group = "file" }, -- group
			{ "<leader>b", group = "buffers" }, -- group
			{ "<leader>g", group = "git" }, -- group
			{ "<c-s-q>", "<cmd>Bwipeout<cr>", mode = "n", { silent = true }, desc = "Wipe Current Buffer" },
			{ "<c-s-h>", "<cmd>bprev<cr>", mode = "n", { silent = true }, desc = "Previous Buffer" },
			{ "<c-s-l>", "<cmd>bnext<cr>", mode = "n", { silent = true }, desc = "Next Buffer" },
			{ mode = "n", "<leader>gaf", "<cmd>Git add %<CR>", desc = "Git Add File" },
			{ mode = "n", "<leader>gap", "<cmd>Git add .<CR>", desc = "Git Add Project" },
			{ mode = "n", "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit" },
			{ mode = "n", "<leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
			{ mode = "n", "<leader>gI", "<cmd>Git init<CR>", desc = "Git Init" },
			{ mode = "n", "<leader>gs", "<cmd>Git status<CR>", desc = "Git Status" },
			{ mode = "n", "<leader>gl", "<cmd>Git log<CR>", desc = "Git Log" },
			{
				mode = "n",
				"<leader>gC",
				function()
					local current_dir = vim.fn.expand("%:p:h")
					local repo_url = vim.fn.input("Git Repository URL: ")
					local folder_name = vim.fn.input("Folder Name: ")
					if repo_url ~= "" and folder_name ~= "" then
						vim.cmd("!git clone " .. repo_url .. " " .. current_dir .. "/" .. folder_name)
					else
						print("Repository URL and Folder Name must be provided")
					end
				end,
				desc = "Git Clone Repo Into Current Directory",
			},
			{
				mode = "n",
				"<leader>gf",
				function()
					local branch = vim.api.nvim_command_output("Git rev-parse --abbrev-ref HEAD")
					local command = "Git remote get-url " .. branch
					local repo = vim.api.nvim_command_output(command)

					if repo ~= "" then
						os.execute("xdg-open " .. repo)
					else
						print("No remote repository found")
					end
				end,
				desc = "Git Open Remote Repo",
			},
			{
				mode = "n",
				"<leader>gr",
				function()
					local branch = vim.fn.input("Git Remote Branch: ")

					local address = vim.fn.input("Git Remote Repo Name (Name/Repo): ")

					if branch ~= "" and address ~= "" then
						local result =
							vim.cmd("Git remote add '" .. branch .. "' 'https://github.com/" .. address .. "'")
						if result ~= "" then
							print(result)
						else
							print("Executed Command")
						end
					else
						print("Branch and Address must be provided")
					end
				end,
				desc = "Git Remote Add",
			},
			{
				mode = "n",
				"<leader>gR",
				function()
					local repo = vim.fn.input("Git New Repo Name")

					if repo ~= "" then
						print(repo)
						os.execute("gh repo create '" .. repo .. "' --public | xclip")
						print("Repository Created and Copied to Clipboard")
					else
						print("New Repository Must Be Provided")
					end
				end,
				desc = "Git Repo Create",
			},
		})
	end,
}
