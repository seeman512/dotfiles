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

-- Lazy
require("config.lazy")
