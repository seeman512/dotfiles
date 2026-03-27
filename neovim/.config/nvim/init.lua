-- OPTIONS
local opt = vim.opt

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- vertical selection
opt.virtualedit = "block"

-- replace results in split
opt.inccommand = "split"

--
opt.termguicolors = true
opt.splitright = true

-- include local config .nvimrc
vim.o.exrc = true

-- listchars
local space = "·"
opt.listchars:append {
  tab = "│─",
  multispace = space,
  lead = space,
  trail = space,
  nbsp = space
}

-- disable mouse
vim.opt.mouse = ""

-- disable search highlight
vim.o.hlsearch = false

-- KEYMAPS
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
map("n", "<", ":tabprevious<CR>", {noremap = true, silent = true })
map("n", ">", ":tabnext<CR>", {noremap = true, silent = true })
map("n", "t", ":tabnew<CR>", {noremap = true, silent = true })
map("n", "T", ":split | term<CR>i", { noremap = true, silent = true })

map("n", "<leader>1", ":tabnext1<CR>", {noremap = true, silent = true })
map("n", "<leader>2", ":tabnext2<CR>", {noremap = true, silent = true })
map("n", "<leader>3", ":tabnext3<CR>", {noremap = true, silent = true })
map("n", "<leader>4", ":tabnext4<CR>", {noremap = true, silent = true })
map("n", "<leader>5", ":tabnext5<CR>", {noremap = true, silent = true })
map("n", "<leader>6", ":tabnext6<CR>", {noremap = true, silent = true })
map("n", "<leader>7", ":tabnext7<CR>", {noremap = true, silent = true })
map("n", "<leader>8", ":tabnext8<CR>", {noremap = true, silent = true })

-- Lazy
require("config.lazy")
