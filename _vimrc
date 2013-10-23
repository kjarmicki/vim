syntax on
filetype on

set nocp
set bs=2
set fileencodings=utf-8
set encoding=utf8
set cindent
set incsearch
set ruler
set hlsearch
set number
set cursorline
set ts=4
set tabstop=4
set shiftwidth=4
set autochdir

call pathogen#infect()

highlight CursorLine guibg=#dddddd

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview

au BufNewFile,BufRead *.json set filetype=javascript

" tab/space switch
let s:indentMode = "tabs"

function! SpaceIndent()
	let s:indentMode = "spaces"
	set et|retab
endfunction

function! TabIndent()
	let s:indentMode = "tabs"
	set noet|retab!
endfunction

function GetIndentMode()
	echo s:indentMode
endfunction


" neocomplete
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_enable_smart_case = 1

" zencoding
let g:user_zen_expandabbr_key       = '<c-t>'

set clipboard=unnamed

" sytastic next error
map <C-e> :ll<CR>

" jumping to first character in line
map <Home> ^
imap <Home> <esc>^i

set guioptions-=T  "remove toolbar
set guioptions-=l  "remove left-hand scroll bar
set gfn=Droid_Sans_Mono:h10:cANSI


source $VIMRUNTIME/NERD_tree.vim 

let g:NERDTreeShowBookmarks = 1
