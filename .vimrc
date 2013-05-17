filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

syntax on
set bg=dark

set mouse=a

set showmatch
set hlsearch
set title
set number
set wildmode=list:longest
set backspace=2 " indent,eol,start
set ruler

syn sync fromstart
let perl_fold=1
"let perl_fold_blocks=1
set foldmethod=syntax
set foldlevel=999
set visualbell

set scrolloff=3

set directory=$HOME/.vimswap/

let g:netrw_liststyle = 3

let mapleader=","

" http://vim.wikia.com/wiki/Automatically_set_screen_title
if &term =~ "^screen"
    set ttymouse=xterm2
    set t_ts=k
    set t_fs=\
endif

if $TMUX != ""
    set ttymouse=xterm
    set t_ts=]2;
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
map <leader>l :set list!<CR>:set list?<CR>

" line numbers
map <leader>n :set number!<CR>:set number?<CR>

map <leader>p :set paste!<CR>:set paste?<CR>

"- Toggle mouse --------------------------------------------

map <leader>m :call MouseOff()<CR>

function! MouseOn()
    set mouse=a
    map <leader>m :call MouseOff()<CR>
    set mouse?
endfunction

function! MouseOff()
    set mouse=
    map <leader>m :call MouseOn()<CR>
    set mouse?
endfunction

"- Other ---------------------------------------------------

" hash (un)comment a range
map <leader>c :s/^/#/<CR>:let @/=''<CR>
map <leader>C :s/^#//<CR>:let @/=''<CR>

" clear current search pattern
map <leader>s :let @/=''<CR>

map <silent> <leader>ft :NERDTreeToggle<CR>
map <silent> <leader>ff :NERDTreeFind<CR>
map <silent> <leader>fm :NERDTreeMirror<CR>

map <silent> <leader>t :TlistToggle<CR>

" cd to directory of current file
map <leader>fd :chdir %:p:h<CR>

"- Plugin settings -----------------------------------------
" taglist
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_Menu=1

"minibuxexplorer

let g:miniBufExplMapCTabSwitchBufs = 1 " FIXME: this doesn't work in console vim
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavArrows = 1

"- GUI only settings ---------------------------------------
if has ("gui_running")

    set mousehide " Hide the mouse when typing text

    colorscheme solarized
    set guifont=Ubuntu\ Mono\ 10

    set lines=55
    set columns=140

    set clipboard=unnamed
    set guioptions-=T " no toolbar
    set guioptions-=t " no tearable menus

    "map <C-Right> :tabnext<CR>
    "map <C-Left>  :tabprevious<CR>

    amenu My\ Stuff.Tabbed\ Tabbing :call TabbedTabbing()<CR>
    amenu My\ Stuff.Spaced\ Tabbing :call SpacedTabbing()<CR>
    amenu My\ Stuff.Set\ Brace\ Folding :call SetBraceFolding()<CR>
    amenu My\ Stuff.Toggle\ list :set list!<CR>

"- CLI only settings ---------------------------------------
else

    if &term =~ "^xterm" || &term =~ "^screen" || &term =~ "256"
        set t_Co=256
    endif
    if &t_Co == 256
        colorscheme molokai
    endif

    set ttyfast

    "map [1;5C :tabnext<CR>
    "map [1;5D :tabprevious<CR>

endif

hi Folded cterm=Bold gui=Bold ctermbg=NONE guibg=NONE
hi link MBENormal LineNr
