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

-- Diagnostic
vim.o.signcolumn = "yes"

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

-- AUTOCOMLETE
vim.o.autocomplete = true
vim.o.pumborder = 'rounded'
vim.o.pummaxwidth = 60
vim.o.completeopt = 'menu,menuone,noinsert,fuzzy,popup'

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method("textDocument/completion") then

      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true,   -- auto-show menu as you type (recommended)
        -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
      })

      -- keys
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
      end
      map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
      map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      map('gt', vim.lsp.buf.type_definition, '[G]oto [T]Type Definition')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    end
  end,
})

-- LSP

-- gopls
vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod' },
  root_markers = { '.git', 'go.mod' },
  settings = {
    gopls = {
      staticcheck = true,
      -- gofumpt = true,
      completeUnimported = true,
    },
  },
}
vim.lsp.enable('gopls')
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- tsgo
vim.lsp.config['tsgo'] = {
  cmd = { 'tsgo', '--lsp', '--stdio' },
  filetypes = { 'javascript', 'typescript' },
  root_markers = { '.git', 'package.json' },
}
vim.lsp.enable('tsgo')

-- rust
vim.lsp.config['rust-analyzer'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { '.git', 'Cargo.toml' },
}
vim.lsp.enable('rust-analyzer')

-- PLUGINS
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = 'main'
  },
  { src = "https://github.com/junegunn/fzf" },
  { src = "https://github.com/junegunn/fzf.vim" },
  { src = "https://github.com/tpope/vim-fugitive" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
})

-- COLORSCHEME
vim.cmd('colorscheme kanagawa-wave')

-- lualine
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      -- statusline = 1000,
      -- tabline = 1000,
      -- winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      { 'tabs',
        mode = 2,
        use_mode_colors = true,
        path = 0,
        symbols = { modified = '+', },
        max_length = vim.o.columns - 1,
      }
    },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- treesitter
require("nvim-treesitter.config").setup({
  build = ":TSUpdate",
  enusure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "help", "cmake", "go",},
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
