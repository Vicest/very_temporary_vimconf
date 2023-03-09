colorscheme franken

set ts=4 sw=4

set titlestring=%t
set title

set background=dark

set mouse=a
set cindent
set autoindent
syntax on

set number

set list
set listchars=trail:•,tab:›·

set comments=s:/*,m:**\ ,e:*/

"set colorcolumn=80
"highlight Search ctermbg=Green
"syntax enable
set ruler

"Mappings
"C-Comment line or selecction
nnoremap <C-_> :s/^/\/\//<CR>:noh<CR>
vnoremap <C-_> :s/^/\/\//<CR>:noh<CR>
nnoremap <Bslash> :s/^\/\///<CR>:noh<CR>
vnoremap <Bslash> :s/^\/\///<CR>:noh<CR>
"Move lines around
nnoremap <C-J> :m +1<CR>
nnoremap <C-K> :m -2<CR>
vnoremap <C-J> :m '>+1<CR>V'<
vnoremap <C-K> :m '<-2<CR>V'<
"vnoremap <C-J> //Ndown
"vnoremap <C-K> //Nup

"Dunnno if it works TODO
cnoremap sp<tab> split<space>

function! MakeHeader(filename)
	let a:up = toupper(a:filename)
	let a:low = tolower(a:filename)
	0r ~/.vim/templates/header.cpp
	%s/TEMPNAME/\=a:up/g
	%s/Tempname/\=a:filename/g
	%s/tempname/\=a:low/g
	Stdheader
endfunction
function! MakeClass(filename)
"	let a:up = toupper(a:filename)
	let a:low = tolower(a:filename)
	0r ~/.vim/templates/class.cpp
"	%s/TEMPNAME/\=a:up/g
	%s/Tempname/\=a:filename/g
	%s/tempname/\=a:low/g
	Stdheader
endfunction

"Some 80 Col error matching if found on vim.fandom.com
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

autocmd BufNewFile *.hpp call MakeHeader(expand('%:t:r'))
autocmd BufNewFile *.cpp call MakeClass(expand('%:t:r'))
