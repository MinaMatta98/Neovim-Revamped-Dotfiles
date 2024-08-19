-- This is the only setting that must be set before loading lazy
vim.g.mapleader = " "
vim.o.number = true
vim.keymap.set("n", "<leader>V", ":edit $MYVIMRC<CR>", { silent = true, desc = "Vimrc file" })
require("config.lazy")
require("config.setup")
