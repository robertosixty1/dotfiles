call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

set noshowmode

" show line numbers
set relativenumber
set number

" change tab size
set tabstop=4
set shiftwidth=4

" setup lightline theme
let g:lightline = {
        \ 'colorscheme': 'onedark',
	\ }
