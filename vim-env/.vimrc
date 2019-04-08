:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

set nocompatible              " be iMproved, required
filetype off                  " required
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set nocindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set hidden
set mouse=a
set history=1000

" GUI
set lines=900 columns=1600
set background=dark
set guicursor+=a:blinkon0
colorscheme badwolf
set guifont=Hack\ 15



" PLUGINS
call plug#begin('~/.vim/bundle')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ajh17/vimcompletesme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" Force omni completion for some source files
" autocmd FileType c, cpp let b:vcm_tab_complete = "omni"

" LSP omni completion
set completeopt=longest,menuone,noinsert
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>n :NERDTreeToggle<CR>

" Auto popup completion (mucomplete)
"let g:mucomplete#enable_auto_at_startup = 1
"let g:mucomplete#no_popup_mappings = 1
