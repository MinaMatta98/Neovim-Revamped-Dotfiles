return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
		"danymat/neogen",
		"aznhe21/actions-preview.nvim",
		"antosha417/nvim-lsp-file-operations",
		"jay-babu/mason-nvim-dap.nvim",
		"ray-x/lsp_signature.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/neotest",
		"SmiteshP/nvim-navic",
		"hoffs/omnisharp-extended-lsp.nvim",
		-- "antosha417/nvim-lsp-file-operations",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local neogen = require("neogen")

		local dap = require("dap")

		local dap_ui = require("dapui")

		-- local _ = require("neotest-local").config()

		-- local _ = require("nvim-dap").config()

		local neotest = require("neotest")

		-- local _ = require("navic").config();

		local navic = require("nvim-navic")

		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			-- telescope setup
			local builtin = require("telescope.builtin")

			vim.lsp.handlers["textDocument/definition"] = builtin.lsp_definitions
			vim.lsp.handlers["textDocument/declaration"] = builtin.lsp_declarations
			vim.lsp.handlers["textDocument/typeDefinition"] = builtin.lsp_type_definitions
			vim.lsp.handlers["textDocument/references"] = builtin.lsp_references
			vim.lsp.handlers["textDocument/documentSymbol"] = builtin.lsp_document_symbols
			vim.lsp.handlers["workspace/symbol"] = builtin.lsp_workspace_symbols
			vim.lsp.handlers["callHierarchy/incomingCalls"] = builtin.lsp_incoming_calls
			vim.lsp.handlers["callHierarchy/outgoingCalls"] = builtin.lsp_outgoing_calls
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
				border = "rounded",
				close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
			})
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					update_in_insert = true,
					border = "rounded",
				})
			vim.diagnostic.config({
				virtual_text = {
					-- source = "always",  -- Or "if_many"
					prefix = "▎", -- Could be '■', '▎', 'x'
				},
				severity_sort = true,
				float = {
					source = "always", -- Or "if_many"
					border = "rounded",
				},
			})

			vim.keymap.set({ "n", "i" }, "<c-s-d>", function()
				vim.diagnostic.open_float({ scope = "line" })
			end, bufopts)

			vim.keymap.set("n", "gD", function()
				builtin.diagnostics()
			end, bufopts)

			vim.keymap.set("n", "<leader>tws", function()
				builtin.lsp_workspace_symbols()
			end, bufopts)

			vim.keymap.set("n", "<leader>ts", function()
				builtin.lsp_document_symbols()
			end, bufopts)

			vim.keymap.set("n", "<c-d>", function()
				neogen.generate()
			end, bufopts)

			-- lsp keymap setup
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, bufopts)

			vim.keymap.set("n", "gt", function()
				vim.lsp.buf.type_definition()
			end, bufopts)

			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, bufopts)

			vim.keymap.set({ "i", "n" }, "<c-s>", function()
				vim.lsp.buf.signature_help()
			end, bufopts)

			-- vim.keymap.set("n", "<c-s>", function() vim.lsp.buf.signature_help()end, bufopts)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

			vim.keymap.set("n", "<leader>r", function()
				vim.lsp.buf.rename()
			end, bufopts)

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, bufopts)

			-- dap keymap setup
			local wk = require("which-key")

			wk.add({ { "<leader>d", group = "debug", mode = { "n", "v" } } })

			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Breakpoint Condition" })

			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, { desc = "Continue" })

			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end, { desc = "Step Into" })

			vim.keymap.set("n", "<leader>dj", function()
				dap.down()
			end, { desc = "Down" })

			vim.keymap.set("n", "<leader>dk", function()
				dap.up()
			end, { desc = "Up" })

			vim.keymap.set("n", "<leader>do", function()
				dap.step_out()
			end, { desc = "Step Out" })

			vim.keymap.set("n", "<leader>dO", function()
				dap.step_over()
			end, { desc = "Step Over" })

			vim.keymap.set("n", "<leader>dp", function()
				dap.pause()
			end, { desc = "Pause" })

			vim.keymap.set("n", "<leader>dr", function()
				dap.repl.toggle()
			end, { desc = "Toggle REPL" })

			vim.keymap.set("n", "<leader>ds", function()
				dap.session()
			end, { desc = "Session" })

			vim.keymap.set("n", "<leader>dw", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Widgets" })

			-- dap-ui keymap setup

			vim.keymap.set("n", "<leader>de", function()
				dap_ui.eval()
			end, bufopts)
			vim.keymap.set("n", "<space>dl", function()
				dap_ui.open()
			end, bufopts)

			vim.keymap.set("n", "<space>du", function()
				dap_ui.close()
			end, bufopts)

			-- -- neotest keymap setup
			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run()
			end, bufopts)

			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run(vim.fn.expand("%"))
			end, bufopts)

			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open()
			end, bufopts)

			vim.keymap.set("n", "<leader>tS", function()
				neotest.summary.toggle()
			end, bufopts)

			vim.keymap.set("n", "<leader>tn", function()
				neotest.jump.next({ status = "failed" })
			end, bufopts)

			vim.keymap.set("n", "<leader>tN", function()
				neotest.jump.prev({ status = "failed" })
			end, bufopts)

			vim.keymap.set("n", "<leader>td", function()
				neotest.run.run({ strategy = "dap" })
			end, bufopts)

			require("lsp_signature").on_attach({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded",
				},
			}, bufnr)

			--
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			if client.name == "rust-analyzer" then
				vim.keymap.set("n", "<leader>O", function()
					vim.cmd.RustLsp("openCargo")
				end, { buffer = bufnr })

				vim.keymap.set("n", "<leader>R", function()
					vim.cmd("RustRun")
				end, { buffer = bufnr })

				vim.keymap.set("n", "<leader>A", function()
					vim.cmd.RustLsp("codeAction")
				end, { buffer = bufnr })
			end

			if client.name ~= "rust-analyzer" then
				vim.keymap.set({ "v", "n" }, "<leader>A", require("actions-preview").code_actions)
				local actions = require("actions-preview")
				vim.keymap.set({ "v", "n" }, "<leader>A", actions.code_actions, bufopts)
			end

			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
		end

		local flags = {
			allow_incremental_sync = true,
			debounce_text_changes = 200,
		}

		local list = {
			"vimls",
			"yamlls",
			"bashls",
			"texlab",
			"lua_ls",
			"cssmodules_ls",
			"emmet_ls",
			"lemminx",
			"jedi_language_server",
			"taplo",
			"jsonls",
			"cssls",
			"clangd",
			"html",
		}

		local capabilities = cmp_nvim_lsp.default_capabilities()

		for _, server_name in ipairs(list) do
			require("lspconfig")[server_name].setup({
				flags = flags,
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		capabilities.offsetEncoding = { "utf-16" }

		local omnisharp_extended = require("omnisharp_extended")

		lspconfig.omnisharp.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = {
				["textDocument/definition"] = omnisharp_extended.definition_handler,
				["textDocument/typeDefinition"] = omnisharp_extended.type_definition_handler,
				["textDocument/references"] = omnisharp_extended.references_handler,
				["textDocument/implementation"] = omnisharp_extended.implementation_handler,
			},
			enable_editorconfig_support = true,
			roslyn_extensions_options = {
				document_analysis_timeout_ms = 30000,
				enable_decompilation_support = true,
				enable_import_completion = true,
				enable_analyzers_support = true,
				diagnostic_workers_thread_count = 32,
				location_paths = {
					"//path_to/code_actions.dll",
				},
			},
			enable_ms_build_load_projects_on_demand = true,
			organize_imports_on_format = true,
			enable_import_completion = true,
			sdk_include_prereleases = true,
			analyze_open_documents_only = false,
		})

		lspconfig.typst_lsp.setup({
			settings = {
				exportPdf = "onSave", -- Choose onType, onSave or never.
				filetypes = "typst, typ",
			},
		})

		return on_attach
	end,
}
