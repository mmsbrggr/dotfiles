" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Theme
Plug 'mhartington/oceanic-next'

Plug 'scrooloose/nerdtree'
Plug 'neovimhaskell/haskell-vim'

" Denite for quick navigation of files
Plug 'Shougo/denite.nvim'

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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

" Deoplete config
let g:deoplete#enable_at_startup = 1

" Language Server Config
let g:LanguageClient_serverCommands = { }
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

" Denite config
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <C-j> :<C-u>Denite buffer
\ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
"nnoremap <silent> <C-j> :Denite buffer file<CR>

call denite#custom#map(
	  \ 'insert',
	  \ '<C-j>',
	  \ '<denite:enter_mode:normal>',
	  \ 'noremap'
	  \)

nnoremap <silent> <C-g> :Denite grep<CR>

