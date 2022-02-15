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
set relativenumber

set list
set listchars=trail:•,tab:›·

set comments=s:/*,m:**\ ,e:*/

set colorcolumn=80
set ruler

cnoremap sp<tab> split<space>

function! MakeHeader(filename)
	let a:up = toupper(a:filename)
	let a:low = tolower(a:filename)
	0r ~/.vim/templates/header.cpp
	%s/TEMPNAME/\=a:up/g
	%s/Tempname/\=a:filename/g
	%s/tempname/\=a:low/g
endfunction

autocmd BufNewFile *.hpp call MakeHeader(expand('%:t:r'))
