" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ocean-next theme
Plug 'mhartington/oceanic-next'

Plug 'roxma/nvim-completion-manager'
Plug 'scrooloose/nerdtree'
Plug 'alx741/vim-hindent'

" Initialize plugin system
call plug#end()

let g:mapleader = ","

" Tab specific options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround

" Show the line numbers
set number

set signcolumn=yes

" Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
filetype plugin indent on
colorscheme OceanicNext

set hidden

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Quickly save everything on 'W'
map W :wa! <CR>

" Easier split navigation (omit C-W)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

