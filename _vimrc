syntax on
filetype on
filetype plugin on
filetype indent on


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
set paste
set clipboard=unnamed

" GUI
highlight CursorLine guibg=#dddddd
set guioptions-=T  "remove toolbar
set guioptions-=l  "remove left-hand scroll bar
set gfn=Droid_Sans_Mono:h10:cANSI

" autocompletion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview

" filetypes
au BufNewFile,BufRead *.json set filetype=javascript

"make star stay at current word
:nnoremap * *N

"annoying mistakes
:command WQ wq
:command Wq wq
:command W w
:command Q q

" tab/space switch
let s:indentMode = "tabs"

function! Si()
	let s:indentMode = "spaces"
	set et|retab
endfunction

function! Ti()
	let s:indentMode = "tabs"
	set noet|retab!
endfunction

function Im()
	echo s:indentMode
endfunction

" jumping to first character in line
map <Home> ^
imap <Home> <esc>^i

" delete without yank
map r "_d
vmap r "_d

" single keystroke indentation
map > >l
map < <l
map = =l

"" plugins
call pathogen#infect()

" neocomplete
let g:neocomplcache_enable_at_startup = 0
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1 
let g:neocomplcache_enable_underbar_completion = 1 

autocmd FileType javascript NeoComplCacheEnable
autocmd FileType tmpl NeoComplCacheEnable
autocmd FileType css NeoComplCacheEnable
autocmd FileType php NeoComplCacheEnable
autocmd FileType jsp NeoComplCacheEnable
autocmd FileType java NeoComplCacheEnable

" zencoding
let g:user_zen_expandabbr_key = '<c-t>'

" coffeescript
autocmd BufWritePost *.coffee silent make!

" sytastic next error
map <C-e> :ll<CR>

" NERDTree
source $VIMRUNTIME/NERD_tree.vim 
let g:NERDTreeShowBookmarks = 1

" custom extensions (machine-dependent stuff)
if filereadable($VIM."/_extensions")
	source $VIM/_extensions
endif
