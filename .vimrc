" スワップファイル作らない
set noswapfile

" 大文字小文字判別しない
set ignorecase

" インクリメンタルサーチ
set incsearch

" 行表示
set number

" 改行時に前後の行とインデントを合わせるかどうか
set autoindent

" Tabキー押下時にスペースが入るようにする
"set expandtab 

" 改行時インデントそろえる
set smartindent

" 一つのtabが何文字で表示されるか
"set tabstop=4 

" インデント幅を決める
"set shiftwidth=4 

" 行線表示
set cursorline
" 色つけれる
"highlight CursorLine ctermfg=Blue

"set cursorcolumn

" tabを可視化
"set list
"set listchars=tab:>_

" auto reload
set autoread

" no beep
set visualbell t_vb=
set noerrorbells


" NeoBundle がインストールされていない時、もしくはプラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
	"
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()

	" 読み込むプラグインの指定
	NeoBundle 'scrooloose/nerdtree'
	"NeoBundle 'rgarver/Kwbd.vim'
	"NeoBundle 'vim-scripts/buftabs'
	NeoBundle 'vim-scripts/minibufexplorerpp'

	" Unite.vim
	"NeoBundle 'Shougo/unite.vim'
	"NeoBundle 'ujihisa/unite-colorscheme'

	" neocomplcache設定
	NeoBundle 'Shougo/neocomplcache'

	" taglist設定重いからはずす
	"NeoBundle 'vim-scripts/taglist.vim'

	" snipmate設定
	NeoBundle 'garbas/vim-snipmate'
	NeoBundle 'tomtom/tlib_vim'
	NeoBundle 'MarcWeber/vim-addon-mw-utils'
	NeoBundle 'honza/snipmate-snippets'

endfunction

" NeoBundle がインストールされているなら LoadBundles()を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function!  s:InitNeoBundle()
	if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		filetype plugin indent off
		if has('vim_starting')
			set runtimepath+=~/.vim/bundle/neobundle.vim/
			endif
		try
			call neobundle#rc(expand('~/.vim/bundle/'))
			call s:LoadBundles()
		catch
			call s:WithoutBundles()
		endtry 
	else
		call s:WithoutBundles()
	endif

	filetype indent plugin on
	syntax on
endfunction

call s:InitNeoBundle()


" color scheme
colorscheme desert

" php定義辞書
"set dictionary=~/.vim/php.dict

" nerdtree設定
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

" short cut delete buffer
"nnoremap <C-k> :Kwbd<CR>

" バッファ切替
nnoremap <S-l> :bn<CR>
nnoremap <S-h> :bp<CR>

" neocomplcache設定
let g:neocomplcache_enable_at_startup=1

" taglist.vim設定
"noremap <C-t><C-g> :Tlist<CR>

" ctags short cut
nnoremap <S-t> :tjump<CR>

nnoremap ; :
