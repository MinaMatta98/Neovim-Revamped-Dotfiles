local M = function(dap)
	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				-- type = "pwa-node",
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (Typescript)",
				cwd = "${workspaceFolder}",
				-- runtimeExetuable = "${workspaceRoot}/node_modules/.bin/webpack-dev-server",
				-- runtimeArgs = { "-d", "inline-source-map", "--config", "webpack.common.js" },
				-- program = "${file}",
				-- runtimeExecutable = "node",
				sourceMaps = true,
				stopOnEntry = true,
				-- protocol = "inspector",
				port = 9229,
				env = {
					NODE_ENV = "development",
				},
				-- outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
				skipFiles = { "<node_internals>/**", "node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/dist/**",
					"!**/node_modules/**",
				},
				console = "integratedTerminal",
			},
			{

				type = "pwa-node",
				request = "attach",
				name = "Attach",
				-- address = "localhost",
				-- processId = 144940,
				program = "${workspaceFolder}/${file}",
				port = 9229,
				-- processId = "",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				skipFiles = { "<node_internals>/**", "node_modules/**", "<anonymous>/**" },
				-- processId = require("dap.utils").pick_process,
				-- cwd = "${workspaceFolder}/index.js",
			},
			{
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome against localhost",
				url = "https://hg-bishop-daniels-website.webflow.io/", -- The URL your frontend app is served on
				-- url = "http://localhost:3000/", -- The URL your frontend app is served on
				webRoot = "${workspaceFolder}/dist",
				sourceMaps = true,
				resolveSourceMapLocations = {
					"${workspaceFolder}/dist/**",
					"!**/node_modules/**",
				},
				stopOnEntry = true,
				trace = false, -- Optional: helps with debugging source maps
			},
			{
				type = "firefox",
				request = "launch",
				name = "Launch Firefox against localhost",
				url = "https://hg-bishop-daniels-website.webflow.io/", -- The URL your frontend app is served on
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
				-- trace = true, -- Optional: helps with debugging source maps
			},
		}
	end
end

return M
