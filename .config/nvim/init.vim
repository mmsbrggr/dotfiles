" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'mhartington/oceanic-next'

Plug 'scrooloose/nerdtree'

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh',
    \ }
" SMT-LIB 2 syntax highlighting
Plug 'bohlender/vim-smt2' 

" Dafny syntax highlighting
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}

" Julia support
Plug 'JuliaEditorSupport/julia-vim'

" Autocomplete manager
Plug 'ncm2/ncm2'

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

" Language Server Config
let g:LanguageClient_hoverPreview = 'Never'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lfa :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lf :call LanguageClient#textDocument_rangeFormatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

nnoremap <silent> <C-g> :Denite grep<CR>
