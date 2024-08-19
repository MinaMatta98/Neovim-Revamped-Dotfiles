return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
	name = "mason-nvim-dap",
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
				"js@v1.76.1",
			},
		})
	end,
}
