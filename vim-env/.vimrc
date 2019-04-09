:set guioptions=
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
":set guioptions-=L  "remove left-hand scroll bar

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
set completeopt=longest,menuone " ,noinsert


" PLUGINS
call plug#begin('~/.vim/bundle')

Plug 'prabirshrestha/async.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'WolfgangMehner/c-support'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>n :NERDTreeToggle<CR>

