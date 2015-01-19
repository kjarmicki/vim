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
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
set gfn=Droid_Sans_Mono:h10:cANSI

" autocompletion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview

" filetypes
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.hjs set filetype=html

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

" single keystroke split change
map <c-w> <c-w>w

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

" syntastic
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_always_populate_loc_list = 1
map <C-e> :ll<CR>

" zencoding
let g:user_zen_expandabbr_key = '<c-t>'

" coffeescript
autocmd BufWritePost *.coffee silent make!
let coffee_compile_vert = 1
let coffee_watch_vert = 1
let coffee_run_vert = 1

" NERDTree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['line', 'dir']

" custom extensions (machine-dependent stuff)
if filereadable($VIM."/_extensions")
	source $VIM/_extensions
endif
