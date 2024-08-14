return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	opts = {
		popup = {
			autofocus = true,
			border = "rounded",
		},
	},
	config = function()
		local crates = require("crates")
		vim.keymap.set("n", "<leader>ct", crates.toggle)
		vim.keymap.set("n", "<leader>cr", crates.reload)
		-- vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>cc", crates.show_popup, { desc = "Show Crate Popup" })
		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "Show Crate Version" })
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show Features Popup" })
		vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "Show Dependencies Popup" })
		vim.keymap.set("n", "<leader>cu", crates.update_crate, { desc = "Update Crate" })
		vim.keymap.set("v", "<leader>cu", crates.update_crates, { desc = "Update Crates" })
		-- vim.keymap.set("n", "<leader>ca", crates.update_all_crates({ desc = "Update all Crates" }))
		-- vim.keymap.set("n", "<leader>cU", crates.upgrade_crate)
		-- vim.keymap.set("v", "<leader>cU", crates.upgrade_crates)
		-- vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates)

		vim.keymap.set("n", "<leader>cH", crates.open_homepage)
		vim.keymap.set("n", "<leader>cR", crates.open_repository, { desc = "Follow Repository" })
		vim.keymap.set("n", "<leader>cD", crates.open_documentation, { desc = "Open Docs" })
		vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { desc = "Follow to crates.io" })
		crates.setup()
	end,
}
