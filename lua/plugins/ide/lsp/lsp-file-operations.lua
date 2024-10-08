return {
	"antosha417/nvim-lsp-file-operations",
	lazy = true,
	-- event = -- The event is the lsp on_attach fn()
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-tree.lua",
	},
	opts = {
		-- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
		debug = false,
		operations = {
			willRenameFiles = true,
			didRenameFiles = true,
			willCreateFiles = true,
			didCreateFiles = true,
			willDeleteFiles = true,
			didDeleteFiles = true,
		},

		-- how long to wait (in milliseconds) for file rename information before cancelling
		timeout_ms = 10000,
	},
}
