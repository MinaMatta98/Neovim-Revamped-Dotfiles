return {
	"jay-babu/mason-nvim-dap.nvim",
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"stylua",
				"jq",
				"debugpy",
				"clangd",
				"codelldb",
				"bash",
				"coreclr",
				"js",
			},
		})

	end,
}
