local M = function(lspconfig, flags, capabilities, on_attach)
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		flags = flags,
		capabilities = capabilities,
		settings = {
			Lua = {
				hint = {
					enable = true, -- necessary
				},
			},
		},
	})
end

return M
