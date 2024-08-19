local M = function(client, builtin, bufopts, bufnr, diagnostics)
	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

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

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.keymap.set("n", "gD", function()
		diagnostics.populate_workspace_diagnostics(client, bufnr)
		builtin.diagnostics()
	end, vim.tbl_extend("force", bufopts, { desc = "LSP diagnostics" }))

	vim.keymap.set({ "n", "i" }, "<c-s-d>", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, vim.tbl_extend("force", bufopts, { desc = "LSP Line Diagnostics" }))

	vim.keymap.set("n", "<leader>tws", function()
		builtin.lsp_workspace_symbols()
	end, vim.tbl_extend("force", bufopts, { desc = "Telescope LSP Workspace Symbols" }))

	vim.keymap.set("n", "<leader>ts", function()
		builtin.lsp_document_symbols()
	end, vim.tbl_extend("force", bufopts, { desc = "Telescope LSP Symbols" }))
end
return M
