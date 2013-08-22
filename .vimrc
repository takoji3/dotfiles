" スワップファイル作らない
set noswapfile

" 大文字小文字判別しない
set ignorecase

" インクリメンタルサーチ
set incsearch

" 行表示
set number

" 改行時インデントそろえる
set smartindent

" 一つのtabが何文字で表示されるか
"set tabstop=4 

" tabキーをスペース4つ
set tabstop=4 
set expandtab 
set autoindent
set shiftwidth=4 

" 行線表示
set cursorline

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
	"NeoBundle 'vim-scripts/minibufexplorerpp'

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

" nerdtree設定
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" minibufexpl
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1

" short cut delete buffer
"nnoremap <C-k> :Kwbd<CR>

" バッファ切替
"nnoremap <S-l> :bn<CR>
"nnoremap <S-h> :bp<CR>

" neocomplcache設定
let g:neocomplcache_enable_at_startup=1

" taglist.vim設定
"noremap <C-t><C-g> :Tlist<CR>

" ctags short cut
"nnoremap <S-t> :tjump<CR>

nnoremap ; :


" Anywhere SID.
function! s:SID_PREFIX()
	return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" page tab
" Set tabline.
function! s:my_tabline()
	let s = ''
	for i in range(1, tabpagenr('$'))
		let bufnrs = tabpagebuflist(i)
		let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
		let no = i  " display 0-origin tabpagenr.
		let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
		let title = fnamemodify(bufname(bufnr), ':t')
		let title = '[' . title . ']'
		let s .= '%'.i.'T'
		let s .= '%#' . (i == tabpagenr() ?  'TabLineSel' : 'TabLine') . '#'
		let s .= no . ':' . title
		let s .= mod
		let s .= '%#TabLineFill# '
	endfor
	let s .= '%#TabLineFill#%T%=%#TabLine#'
	return s
endfunction

let &tabline = '%!'.  s:SID_PREFIX() .  'my_tabline()'
set showtabline=1 " タブライン表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]

" Tab jump
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR> " tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR> " tx タブを閉じる
map <silent> [Tag]n :tabnext<CR> " tn 次のタブ
map <silent> [Tag]p :tabprevious<CR> " tp 前のタブ


" gtags
" q close window
" g grep
" l function list
" j jump defined
nmap <C-g>q <C-w><C-w><C-w>q
"nmap <C-g>g :Gtags -g<CR>
nmap <C-g>l :Gtags -f %<CR>
nmap <C-g>j :GtagsCursor<CR>
"nmap <C-g>n :cn<CR>
"nmap <C-g>p :cp<CR>

