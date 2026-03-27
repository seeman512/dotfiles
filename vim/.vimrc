set nocompatible
filetype plugin on
syntax on
set background=dark
set tabstop=4
set shiftwidth=4
set showcmd

" include local config
set exrc

" Set leader
let mapleader = " "

nmap < :tabprevious<CR>
nmap > :tabnext<CR>
nmap t :tabnew<CR>


" tabs
nmap <leader>1 :tabnext1<CR>
nmap <leader>2 :tabnext2<CR>
nmap <leader>3 :tabnext3<CR>
nmap <leader>4 :tabnext4<CR>
nmap <leader>5 :tabnext5<CR>
nmap <leader>6 :tabnext6<CR>
nmap <leader>7 :tabnext7<CR>
nmap <leader>8 :tabnext8<CR>


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
