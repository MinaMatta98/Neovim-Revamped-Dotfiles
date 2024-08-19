return {
	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
		"danymat/neogen",
		"aznhe21/actions-preview.nvim",
		"antosha417/nvim-lsp-file-operations",
		{ "mason-nvim-dap", dependencies = { "mason" } },
		"ray-x/lsp_signature.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/neotest",
		"hoffs/omnisharp-extended-lsp.nvim",
		"antosha417/nvim-lsp-file-operations", -- auto setup
		"artemave/workspace-diagnostics.nvim",
		"nanotee/sqls.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local neogen = require("neogen")

		local dap = require("dap")

		local dap_ui = require("dapui")

		local neotest = require("neotest")

		local navic = require("nvim-navic")

		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			local builtin = require("telescope.builtin")

			local wk = require("which-key")

			-- WARNING: The cost of this needs evaluation
			local diagnostics = require("workspace-diagnostics")

			local _ = require("plugins.ide.lsp.setup.handlers")(builtin)

			local _ = require("plugins.ide.lsp.setup.neotest-bindings")(neotest, bufopts, wk)

			local _ = require("plugins.ide.lsp.setup.dap-bindings")(dap, dap_ui, bufopts, wk)

			local _ = require("plugins.ide.lsp.setup.lsp-bindings")(bufopts, neogen)

			local _ = require("plugins.ide.lsp.setup.diagnostics")(client, builtin, bufopts, bufnr, diagnostics)

			require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)

			if client.name == "rust-analyzer" then
				vim.keymap.set("n", "<leader>O", function()
					vim.cmd.RustLsp("openCargo")
				end, { buffer = bufnr })

				vim.keymap.set("n", "<leader>R", function()
					vim.cmd("RustRun")
				end, { buffer = bufnr })

				vim.keymap.set("n", "<leader>A", function()
					vim.cmd.RustLsp("codeAction")
				end, { buffer = bufnr, desc = "LSP Code Actions" })
			else
				local actions = require("actions-preview")
				vim.keymap.set({ "v", "n" }, "<leader>A", actions.code_actions, { desc = "Code Actions" })
			end

			if client.name == "gopls" then
				wk.add({ { "<leader>G", group = "Go Commands", { buffer = bufnr } } })

				vim.keymap.set("n", "<leader>GR", function()
					vim.cmd.GoRun("%")
				end, { desc = "Go Run Module" })

				vim.keymap.set("n", "<leader>Gr", function()
					local comm = vim.fn.input("GoRun Args: ") -- Prompt the user for input
					local file = vim.fn.expand("%")
					local handle = vim.fn.system("go run " .. file .. " " .. comm)
					print(handle)
				end, { desc = "Go Run Module with Args" })

				vim.keymap.set("n", "<leader>Gmt", function()
					require("go.gopls").tidy()
				end, { desc = "Go Mod Tidy" })

				vim.keymap.set("n", "<leader>Gat", function()
					require("go.tags").add(unpack({ buffer = bufnr }))
				end, { desc = "Go Add Tags" })

				vim.keymap.set("n", "<leader>Grt", function()
					require("go.tags").rm(unpack({ buffer = bufnr }))
				end, { desc = "Go Add Tags" })
			end

			if client.server_capabilities.documentSymbolProvider and navic.is_available() then
				navic.attach(client, bufnr)
			end

			if client.server_capabilities.inlayHintProvider and client.name ~= "gopls" then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				vim.api.nvim_set_hl(0, "LspInlayHint", { fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground })
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
			"marksman",
			"unocss",
		}

		local capabilities = cmp_nvim_lsp.default_capabilities()

		for _, server_name in ipairs(list) do
			require("lspconfig")[server_name].setup({
				flags = flags,
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		local omnisharp_extended = require("omnisharp_extended")

		local _ = require("plugins.ide.lsp.setup.typst")(lspconfig)

		local _ = require("plugins.ide.lsp.setup.sql")(lspconfig)

		local _ =
			require("plugins.ide.lsp.setup.omnisharp")(lspconfig, on_attach, capabilities, omnisharp_extended, flags)

		local _ = require("plugins.ide.lsp.setup.go")(lspconfig, flags, capabilities, on_attach)

		local _ = require("plugins.ide.lsp.setup.lua")(lspconfig, flags, capabilities, on_attach)

		return on_attach
	end,
}
