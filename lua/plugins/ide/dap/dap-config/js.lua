local M = function(dap)
	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (Typescript)",
				cwd = "${workspaceFolder}",
				runtimeArgs = { "--loader=ts-node/esm", "--trace-warnings" },
				program = "${file}",
				runtimeExecutable = "node",
				sourceMaps = true,
				protocol = "inspector",
				outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
				skipFiles = { "<node_internals>/**", "node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
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
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
				trace = true, -- Optional: helps with debugging source maps
			},
			{
				type = "firefox",
				request = "launch",
				name = "Launch Firefox against localhost",
				url = "https://hg-bishop-daniels-website.webflow.io/", -- The URL your frontend app is served on
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
				trace = true, -- Optional: helps with debugging source maps
			},
		}
	end
end

return M
