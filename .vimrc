syntax on
"hi Comment  ctermfg=4
"hi Constant cterm=bold
set bg=dark

" makes mouse work under screen!
set ttymouse=xterm2
set mouse=a

set showmatch
set hlsearch
set title
set number
set wildmode=list:longest

syn sync fromstart
let perl_fold=1
"let perl_fold_blocks=1
set foldmethod=syntax
set foldlevel=999
hi Folded guifg=white
set visualbell

set directory=$HOME/.vimswap/

let g:netrw_liststyle = 3

" http://vim.wikia.com/wiki/Automatically_set_screen_title
if &term == "screen"
    set t_ts=k
    set t_fs=\
endif

"- Tabbing settings ----------------------------------------

function! TabbedTabbing()
	set noexpandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0
endfunction

function! SpacedTabbing()
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
endfunction

call SpacedTabbing()

"- Toggle showing tabls and trailing spaces ----------------

map ,t :call ShowTabs()<CR>

function! ShowTabs()
	set list listchars=tab:»\ ,trail:·
    map ,t :call DontShowTabs()<CR>
endfunction

function! DontShowTabs()
	set nolist
    map ,t :call ShowTabs()<CR>
endfunction

"- Toggle mouse --------------------------------------------

map mo :call MouseOff()<CR>

function! MouseOn()
	set mouse=a
	map mo :call MouseOff()<CR>
	set mouse
endfunction

function! MouseOff()
	set mouse=
	map mo :call MouseOn()<CR>
	set mouse
endfunction

"- Toggle line numbers -------------------------------------

map ,n :call DontShowNumbers()<CR>

function! ShowNumbers()
    set number
    map ,n :call DontShowNumbers()<CR>
endfunction

function! DontShowNumbers()
    set nonumber
    map ,n :call ShowNumbers()<CR>
endfunction

"- Other ---------------------------------------------------

" hash (un)comment a range
map ,c :s/^/#/<CR>:let @/=''<CR>
map ,C :s/^#//<CR>:let @/=''<CR>

" clear current search pattern
map ,s :let @/=''<CR>

"- GUI settings --------------------------------------------
if v:progname =~? "gvim"

    set mousehide " Hide the mouse when typing text

    colorscheme darkblue
    hi Normal guifg=white
    hi Folded guibg=bg guifg=white
    hi PmenuSel guifg=white

    set guifont=ProFontWindows\ 9

    set lines=65
    set columns=160

    set clipboard=unnamed

    amenu My\ Stuff.Tabbed\ Tabbing :call TabbedTabbing()<CR>
    amenu My\ Stuff.Spaced\ Tabbing :call SpacedTabbing()<CR>
    amenu My\ Stuff.Set\ Brace\ Folding :call SetBraceFolding()<CR>
    amenu My\ Stuff.Show\ tabs\ and\ trailing\ whitespace :set list listchars=tab:»\ ,trail:·<CR>
    amenu My\ Stuff.Don't\ show\ tabs\ and\ trailing\ whitespace :set nolist<CR>

endif
