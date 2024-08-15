local M = function(builtin)
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
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
		border = "rounded",
	})
end

return M
