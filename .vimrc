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

" ファイル別インデント
augroup fileTypeIndent
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2
augroup END

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

" NeoBundle がインストールされていない時、もしくはプラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
	"
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()

	" 読み込むプラグインの指定
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'rgarver/Kwbd.vim'
	NeoBundle 'vim-scripts/minibufexplorerpp'

	" Unite.vim
	NeoBundle 'Shougo/unite.vim'

	" neocomplcache設定
	NeoBundle 'Shougo/neocomplcache'

	NeoBundle 'scrooloose/nerdcommenter'

	NeoBundle 'davidhalter/jedi-vim'
    NeoBundle 'derekwyatt/vim-scala'

    NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}

    NeoBundle "majutsushi/tagbar"
    NeoBundle "szw/vim-tags"

    " for nodejs
    NeoBundle 'moll/vim-node'
    NeoBundle 'myhere/vim-nodejs-complete'
    :setl omnifunc=jscomplete#CompleteJS
    if !exists('g:neocomplcache_omni_functions')
      let g:neocomplcache_omni_functions = {}
    endif
    let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
    let g:node_usejscomplete = 1

    " rails
    NeoBundle 'tpope/vim-rails'
    NeoBundle 'tpope/vim-endwise'

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

    " golang
    if $GOROOT != ''
        filetype off
        set runtimepath+=$GOROOT/misc/vim
    endif

	filetype indent plugin on
	syntax on
endfunction

call s:InitNeoBundle()


" color scheme
colorscheme desert

" nerdtree設定
map <C-o> :NERDTreeToggle<CR>
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
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" nerdtree
let NERDSpaceDelims = 1

" taglist.vim設定
"noremap <C-t><C-g> :Tlist<CR>

" ctags short cut
"nnoremap <S-t> :tjump<CR>

" snippet
"let g:neocomplete#enable_at_startup = 1

noremap ; :

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" gist-vim
let g:gist_use_password_in_gitconfig = 1

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

"map <silent> [Tag]c :tablast <bar> tabnew<CR> " tc 新しいタブを一番右に作る
"map <silent> [Tag]x :tabclose<CR> " tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR> " tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR> " tp 前のタブ

nmap <C-t><C-t> :TagbarToggle<CR>

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
