return {
	"echasnovski/mini.move",
	version = "*",
	opts = {
		-- No need to copy this inside `setup()`. Will be used automatically.
		{
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-h>",
				right = "<M-l>",
				down = "<M-j>",
				up = "<M-k>",

				-- Move current line in Normal mode
				line_left = "<M-h>",
				line_right = "<M-l>",
				line_down = "<M-j>",
				line_up = "<M-k>",
			},

			-- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		},
	},
	config = true,
}
-- return {
-- 	"fedepujol/move.nvim",
-- 	opts = {
-- 		line = {
-- 			enable = true, -- Enables line movement
-- 			indent = true, -- Toggles indentation
-- 		},
-- 		block = {
-- 			enable = true, -- Enables block movement
-- 			indent = true, -- Toggles indentation
-- 		},
-- 		word = {
-- 			enable = true, -- Enables word movement
-- 		},
-- 		char = {
-- 			enable = false, -- Enables char movement
-- 		},
-- 	},
-- 	keys = {
-- 		{ mode = "v", "<a-j>", ":MoveBlock(1)<CR>", desc = "Move Horizontal Block Down" },
-- 		{ mode = "v", "<a-k>", ":MoveBlock(-1)<CR>", desc = "Move Horizontal Block Up" },
-- 		{ mode = "v", "<a-h>", ":MoveHBlock(-1)<CR>", desc = "Move Horizontal Block Left" },
-- 		{ mode = "v", "<a-l>", ":MoveHBlock(1)<CR>", desc = "Move Horizontal Block Right" },
-- 	},
-- }
