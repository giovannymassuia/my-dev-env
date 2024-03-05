let mapleader = " "

inoremap jk <Esc>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin()

Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

call plug#end()
