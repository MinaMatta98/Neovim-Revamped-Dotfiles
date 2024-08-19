return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mxsdev/nvim-dap-vscode-js",
			"nicholasmata/nvim-dap-cs",
			{ "mason-nvim-dap", dependencies = { "mason" } },
		},
		lazy = true,
		recommended = true,
		desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				-- require('dap').defaults.fallback.exception_breakpoints = {'raised'}
				dap.set_exception_breakpoints({ "all" })
				dapui.open({ reset = true })
			end

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "ﳁ", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)

			-- local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
			-- local namespace = vim.api.nvim_create_namespace("dap-hlng")
			vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
			vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
			vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
			vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

			-- cs setup
			local _ = require("plugins.ide.dap.dap-config.cs")(dap)

			-- js setup
			local _ = require("plugins.ide.dap.dap-config.js")(dap)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		opts = {
			icons = { expanded = "", collapsed = "", current_frame = "" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Use this to override mappings for specific elements
			element_mappings = {
				-- Example:
				-- stacks = {
				--   open = "<CR>",
				--   expand = "o",
				-- }
			},
			-- Expand lines larger than the window
			-- Requires >= 0.7
			expand_lines = vim.fn.has("nvim-0.7") == 1,
			-- Layouts define sections of the screen to place windows.
			-- The position can be "left", "right", "top" or "bottom".
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						{ id = "scopes", size = 0.3 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40, -- 40 columns
					position = "right",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25, -- 25% of total lines
					position = "bottom",
				},
			},
			controls = {
				-- Requires Neovim nightly (or 0.8 when released)
				enabled = true,
				-- Display controls in this elementinit
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "rounded", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			-- windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = nil, -- Can be integer or nil.
			},
		},
	},
	-- virtual text for the debugger
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
		lazy = true,
		opts = {
			{
				enabled = true, -- enable this plugin (the default)
				-- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				enabled_commands = true,
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
				-- experimental features:
				virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			},
		},
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		config = true,
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
