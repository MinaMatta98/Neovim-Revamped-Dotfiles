return {
	"andymass/vim-matchup",
	dependencies = "nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		vim.g.loaded_matchit = 1
		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
				-- [options]
			},
		})
	end,
}
