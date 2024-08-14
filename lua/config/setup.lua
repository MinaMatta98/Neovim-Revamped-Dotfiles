vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.cmd("hi BufferLineFill guibg='#252736'")
vim.cmd("hi BufferlineIndicatorSelected guifg='#b58cd8'")
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")
