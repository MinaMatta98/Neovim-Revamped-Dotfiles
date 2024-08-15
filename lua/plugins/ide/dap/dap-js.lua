return {
	"mxsdev/nvim-dap-vscode-js",
	lazy = true,
	dependencies = {
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
		"jay-babu/mason-nvim-dap.nvim",
		"williamboman/mason.nvim",
	},
	opts = {
		-- debugger_path = require("mason-registry").get_package("js"):get_install_path() .. "/js-debug-adapter",
		debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
		-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	},
}
