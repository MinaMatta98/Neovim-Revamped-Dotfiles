local M = function(lspconfig)
	lspconfig.tinymist.setup({
		settings = {
			exportPdf = "onSave", -- Choose onType, onSave or never.
			filetypes = "typst, typ",
			outputPath = "$root/target/$dir/$name",
		},
	})
end

return M
