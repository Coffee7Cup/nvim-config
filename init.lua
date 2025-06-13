vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")

vim.o.foldcolumn='1'
vim.o.foldlevel=99
vim.o.foldlevelstart=99
vim.o.foldenable=true

vim.keymap.set("n", "<F5>", "$")
vim.keymap.set("i", "<F5>", "<C-o>$")
vim.keymap.set("v", "<F5>", "$")

vim.keymap.set("n", "<F5>", "G")
vim.keymap.set("i", "<F5>", "<C-o>G")
vim.keymap.set("v", "<F5>", "G")


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

vim.keymap.set("n", "<leader><Down>", "yyp", { noremap = true, silent = true })
vim.keymap.set("v", "<leader><Down>", "y'>p", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><Up>", "yyP", { noremap = true, silent = true })
vim.keymap.set("v", "<leader><Up>", "y'<P", { noremap = true, silent = true })
-- Enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- Windows-specific clipboard setup
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = true,
}
