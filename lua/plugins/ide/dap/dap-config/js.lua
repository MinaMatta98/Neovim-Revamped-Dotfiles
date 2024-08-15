local M = function(dap)
	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					-- Safety:
					-- If dap is loaded then dap.utils is also avaialable
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			},
		}
	end
end

return M
