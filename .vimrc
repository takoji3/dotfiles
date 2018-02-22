set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" add plugins
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set noswapfile
set nobackup

" 大文字小文字判別しない
set ignorecase

" インクリメンタルサーチ
set incsearch

" 行表示
set number

" 改行時インデントそろえる
set smartindent

set expandtab
set autoindent
set tabstop=4
set shiftwidth=4

" 行線表示
set cursorline
set hlsearch

" auto reload
set autoread

" no beep
set visualbell t_vb=
set noerrorbells

" 補完
set pumheight=10

" 文字コード自動判別
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

syntax on
colorscheme desert

noremap ; :

" change buffer
map bn :bn<CR>
map bp :bp<CR>


" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
" open nerdtree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
