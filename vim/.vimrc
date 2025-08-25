set nocompatible
filetype plugin on
syntax on
set background=dark
set tabstop=4
set shiftwidth=4
set showcmd

" include local config
set exrc

nmap < :tabprevious<CR>
nmap > :tabnext<CR>
nmap t :tabnew<CR>

" swap files
set directory=~/.vim/swap/

" Python
autocmd FileType python set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 autoindent

" PLUGINS
call plug#begin()
Plug 'laktak/tome'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
call plug#end()

" vimwiki
let g:vimwiki_list = [{'path': '~/WORK/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
