local M = function(lspconfig, flags, capabilities, on_attach)
	local lsp_cfg = {
		flags = flags,
		capabilities = capabilities,
		on_attach = on_attach,
	}

	lsp_cfg.settings = {
		gopls = {
			hints = {
				rangeVariableNames = true,
				parameterNames = true,
				constantValues = true,
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
		},
	}

	lspconfig.gopls.setup(lsp_cfg)

	local _ = require("go").setup({
		lsp_cfg = {
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
		},
		goimports = "gopls",
		gofmt = "gopls",
		lsp_on_attach = on_attach,
		dap_debug = true,
	})
end

return M
