local M = function(lspconfig)
	lspconfig.typst_lsp.setup({
		settings = {
			exportPdf = "onSave", -- Choose onType, onSave or never.
			filetypes = "typst, typ",
		},
	})
end

return M
