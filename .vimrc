"----------------------------------
" Vundle
"----------------------------------
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
Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fatih/vim-go'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
"To ignore plugin indent changes, instead use:
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


"----------------------------------
" Settings
"----------------------------------
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

set autoread

" no beep
set visualbell t_vb=
set noerrorbells

" 補完行数
set pumheight=10

" 文字コード自動判別
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

syntax on
colorscheme molokai
highlight Normal ctermbg=none

noremap ; :

set wildmenu

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" change buffer
map bn :bn<CR>
map bp :bp<CR>

" change tab
map tn :tabnext<CR>
map tp :tabprevious<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" ignore indent when past from clipboard
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"----------------------------------
" Nerdtree settings
"----------------------------------
let NERDTreeShowHidden=1
"map <C-o> :NERDTreeToggle<CR>
map <C-o> :NERDTreeTabsToggle<CR>

" open nerdtree when no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"----------------------------------
" lightline
"----------------------------------
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:') !=# '' ? expand('%:') : '[No Name]'
endfunction

" vim-go
"----------------------------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
