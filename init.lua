-- This is the only setting that must be set before loading lazy
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>V", ":edit $MYVIMRC<CR>", { silent = true, desc = "Edit Vim Rc" })
require("config.lazy")
require("config.setup")
