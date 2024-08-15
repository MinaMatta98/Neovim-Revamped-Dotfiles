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
		"jay-babu/mason-nvim-dap.nvim",
		"ray-x/lsp_signature.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/neotest",
		"SmiteshP/nvim-navic",
		"hoffs/omnisharp-extended-lsp.nvim",
		"antosha417/nvim-lsp-file-operations", -- auto setup
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

			local _ = require("plugins.ide.lsp.setup.handlers")(builtin)

			local _ = require("plugins.ide.lsp.setup.neotest-bindings")(neotest, bufopts, wk)

			local _ = require("plugins.ide.lsp.setup.dap-bindings")(dap, dap_ui, bufopts, wk)

			local _ = require("plugins.ide.lsp.setup.lsp-bindings")(bufopts, neogen)

			local _ = require("plugins.ide.lsp.setup.diagnostics")(builtin, bufopts, bufnr)

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
			else
				local actions = require("actions-preview")
				vim.keymap.set({ "v", "n" }, "<leader>A", actions.code_actions, { desc = "Code Actions" })
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

		local omnisharp_extended = require("omnisharp_extended")

		local _ = require("plugins.ide.lsp.setup.typst")(lspconfig)

		local _ =
			require("plugins.ide.lsp.setup.omnisharp")(lspconfig, on_attach, capabilities, omnisharp_extended, flags)

		return on_attach
	end,
}
