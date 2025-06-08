vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
--the below is not working need to fix
vim.keymap.set("n", "<End>", "$")
vim.keymap.set("i", "<End>", "<C-o>$")
vim.keymap.set("v", "<End>", "$")
vim.g.mapleader=" "
vim.cmd("set number")

require("config.lazy")

-- Normal mode: Move current line down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- Visual mode: Move selected lines down
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Normal mode: Move current line up
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Visual mode: Move selected lines up
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader-Down>", "yyp", { noremap = true, silent = true })
vim.keymap.set("v", "<leader-Down>", "y'>p", { noremap = true, silent = true })

vim.keymap.set("n", "<leader-Up>", "yyP", { noremap = true, silent = true })
vim.keymap.set("v", "<leader-Up>", "y'<P", { noremap = true, silent = true })

