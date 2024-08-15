local M = function(dap, dap_ui, bufopts, wk)
	-- dap keymap setup

	wk.add({ { "<leader>d", group = "debug", mode = { "n", "v" } } })

	vim.keymap.set("n", "<leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "Breakpoint Condition" })

	vim.keymap.set("n", "<leader>db", function()
		dap.toggle_breakpoint()
	end, { desc = "DAP Toggle Breakpoint" })

	vim.keymap.set("n", "<leader>dc", function()
		dap.continue()
	end, { desc = "DAP Continue" })

	vim.keymap.set("n", "<leader>di", function()
		dap.step_into()
	end, { desc = "Step Into" })

	vim.keymap.set("n", "<leader>dj", function()
		dap.down()
	end, { desc = "Down" })

	vim.keymap.set("n", "<leader>dk", function()
		dap.up()
	end, { desc = "Up" })

	vim.keymap.set("n", "<leader>do", function()
		dap.step_out()
	end, { desc = "Step Out" })

	vim.keymap.set("n", "<leader>dO", function()
		dap.step_over()
	end, { desc = "Step Over" })

	vim.keymap.set("n", "<leader>dp", function()
		dap.pause()
	end, { desc = "Pause" })

	vim.keymap.set("n", "<leader>dr", function()
		dap.repl.toggle()
	end, { desc = "Toggle REPL" })

	vim.keymap.set("n", "<leader>ds", function()
		dap.session()
	end, { desc = "Session" })

	vim.keymap.set("n", "<leader>dw", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Widgets" })

	-- dap-ui keymap setup

	vim.keymap.set("n", "<leader>de", function()
		dap_ui.eval()
	end, bufopts)

	vim.keymap.set("n", "<space>dl", function()
		dap_ui.open()
	end, bufopts)

	vim.keymap.set("n", "<space>du", function()
		dap_ui.close()
	end, bufopts)
end

return M
