local M = function(bufopts, neogen)
	-- lsp keymap setup
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP Signature Definition" }))

	vim.keymap.set("n", "gt", function()
		vim.lsp.buf.type_definition()
	end, vim.tbl_extend("force", bufopts, { desc = "Goto Type Definition" }))

	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, vim.tbl_extend("force", bufopts, { desc = "Goto Implementation" }))

	vim.keymap.set({ "i", "n" }, "<c-s>", function()
		vim.lsp.buf.signature_help()
	end, vim.tbl_extend("force", bufopts, { desc = "Signature Help" }))

	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", bufopts, { desc = "LSP Signature Hover" }))

	vim.keymap.set("n", "<leader>r", function()
		vim.lsp.buf.rename()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP Rename Binding" }))

	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP Goto References" }))

	vim.keymap.set("n", "<c-d>", function()
		neogen.generate()
	end, vim.tbl_extend("force", bufopts, { desc = "Neogen Generate Docs" }))
end

return M
