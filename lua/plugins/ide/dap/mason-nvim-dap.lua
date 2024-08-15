return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
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
