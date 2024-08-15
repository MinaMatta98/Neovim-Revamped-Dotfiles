local M = function(neotest, bufopts, wk)
	wk.add({ { "<leader>t", group = "tests", mode = { "n", "v" } } })

	vim.keymap.set("n", "<leader>tr", function()
		neotest.run.run()
	end, vim.tbl_extend("force", bufopts, { desc = "Test Run Single" }))

	vim.keymap.set("n", "<leader>tt", function()
		neotest.run.run(vim.fn.expand("%"))
	end, vim.tbl_extend("force", bufopts, { desc = "Test Run File" }))

	vim.keymap.set("n", "<leader>to", function()
		neotest.output.open()
	end, vim.tbl_extend("force", bufopts, { desc = "Test Show Output" }))

	vim.keymap.set("n", "<leader>tS", function()
		neotest.summary.toggle()
	end, vim.tbl_extend("force", bufopts, { desc = "Test Summary Toggle" }))

	vim.keymap.set("n", "<leader>tn", function()
		neotest.jump.next({ status = "failed" })
	end, vim.tbl_extend("force", bufopts, { desc = "Test Next Failed" }))

	vim.keymap.set("n", "<leader>tN", function()
		neotest.jump.prev({ status = "failed" })
	end, vim.tbl_extend("force", bufopts, { desc = "Test Previous Failed" }))

	vim.keymap.set("n", "<leader>td", function()
		neotest.run.run({ strategy = "dap" })
	end, vim.tbl_extend("force", bufopts, { desc = "Test Run with Debugger" }))
end

return M
