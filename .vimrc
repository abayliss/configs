filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

syntax on
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
set visualbell

set directory=$HOME/.vimswap/

let g:netrw_liststyle = 3

let mapleader=","

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

"- Toggles ------------------------------------------------

" tabs and trailing spaces
set listchars=tab:»\ ,trail:·
map <leader>l :set list!<CR>

" line numbers
map <leader>n :set number!<CR>

"- Toggle mouse --------------------------------------------

map <leader>m :call MouseOff()<CR>

function! MouseOn()
    set mouse=a
    map <leader>m :call MouseOff()<CR>
    set mouse
endfunction

function! MouseOff()
    set mouse=
    map <leader>m :call MouseOn()<CR>
    set mouse
endfunction

"- Other ---------------------------------------------------

" hash (un)comment a range
map <leader>c :s/^/#/<CR>:let @/=''<CR>
map <leader>C :s/^#//<CR>:let @/=''<CR>

" clear current search pattern
map <leader>s :let @/=''<CR>

map <silent> <leader>b :NERDTreeToggle<CR>
map <silent> <leader>t :TlistToggle<CR>

"- GUI only settings ---------------------------------------
if has ("gui_running")

    set mousehide " Hide the mouse when typing text

    colorscheme xoria256
    set guifont=Consolas\ 10

    set lines=55
    set columns=140

    set clipboard=unnamed

    amenu My\ Stuff.Tabbed\ Tabbing :call TabbedTabbing()<CR>
    amenu My\ Stuff.Spaced\ Tabbing :call SpacedTabbing()<CR>
    amenu My\ Stuff.Set\ Brace\ Folding :call SetBraceFolding()<CR>
    amenu My\ Stuff.Toggle\ list :set list!<CR>

"- CLI only settings ---------------------------------------
else

    if &term =~ "^xterm" || &term =~ "256"
        set t_Co=256
    endif
    if &t_Co == 256
        colorscheme xoria256
    endif

endif

hi Folded ctermbg=NONE guibg=NONE
