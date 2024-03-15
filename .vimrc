set nocompatible

if has('nvim')
    let plug_file = '~/.local/share/nvim/site/autoload/plug.vim'
else
    let plug_file = '~/.vim/autoload/plug.vim'
endif

if empty(glob(plug_file))
    silent execute '!curl -fLo '.plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/NERDCommenter'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'stephpy/vim-yaml'
call plug#end()

set bg=dark

set showmatch
set hlsearch
set title
set number
set wildmode=list:longest
set backspace=2 " indent,eol,start
set ruler
set laststatus=2

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

syn sync fromstart
let perl_fold=1
let perl_fold_anonymous_subs=1
"let perl_fold_blocks=1
set foldmethod=syntax
set foldlevel=999
set visualbell

set scrolloff=3

set splitbelow
set splitright

if has("win32")
    let backup_dir=$HOME . "/_vimswap//"
else
    let backup_dir=$HOME . "/.vimswap//"
endif
if !isdirectory(backup_dir)
    call mkdir(backup_dir, "p")
endif
let &directory=backup_dir

let g:netrw_liststyle = 3

let mapleader=","

" http://vim.wikia.com/wiki/Automatically_set_screen_title
if &term =~ "^screen"
    set t_ts=k
    set t_fs=\
endif

if $TMUX != ""
    set t_ts=]2;
    set t_fs=\
endif

"- Toggles ------------------------------------------------

" tabs and trailing spaces
set listchars=tab:>\ ,trail:.
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

"- Font sizing ---------------------------------------------

if has("gui_running")

    function! LargerFont()
        let font_parts = split(&guifont)
        let font_parts[-1] = font_parts[-1] + 1
        let &guifont = join(font_parts, ' ')
    endfunction

    function! SmallerFont()
        let font_parts = split(&guifont)
        let font_parts[-1] = font_parts[-1] - 1
        let &guifont = join(font_parts, ' ')
    endfunction

endif

"- Other ---------------------------------------------------

" clear current search pattern
map <leader>s :let @/=''<CR>

" cd to directory of current file
map <leader>fd :chdir %:p:h<CR>

function! LessObtrusiveFolds()
    hi Folded cterm=Bold gui=Bold ctermbg=NONE guibg=NONE
endfunction

"- Plugin settings -----------------------------------------

"minibuxexplorer
let g:miniBufExplBRSplit = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavArrows = 1
hi link MBEVisibleActiveNormal Identifier

"ctrlp
let g:ctrlp_cmd = "CtrlPMixed"
let g:ctrlp_max_files = 0
let g:ctrlp_regexp = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_follow_symlinks = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "" 
let g:airline_right_sep = ""
let g:airline_section_b = "%n"
"let g:airline_theme = "jellybeans"

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

let g:jellybeans_overrides = {
\    'Search': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\}

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"- GUI only settings ---------------------------------------
if has("gui_running")

    set mousehide " Hide the mouse when typing text

    colorscheme jellybeans
    if has("win32")
        set guifont=Consolas:h10
    elseif has("macunix")
        set guifont=SF\ Mono:12
    else
        set guifont=Ubuntu\ Mono\ 10
    endif

    set lines=55
    set columns=140

    set clipboard=unnamed
    set guioptions-=T " no toolbar
    set guioptions-=t " no tearable menus

    "map <C-Right> :tabnext<CR>
    "map <C-Left>  :tabprevious<CR>

    amenu My\ Stuff.Set\ Brace\ Folding :call SetBraceFolding()<CR>
    amenu My\ Stuff.Less\ Obtrusive\ Folds :call LessObtrusiveFolds()<CR>
    amenu My\ Stuff.-sep1- :
    amenu My\ Stuff.Larger\ Font :call LargerFont()<CR>
    amenu My\ Stuff.Smaller\ Font :call SmallerFont()<CR>

"- CLI only settings ---------------------------------------
else

    if &term =~ "^xterm" || &term =~ "^screen" || &term =~ "256"
        set t_Co=256
        set t_ut=
    endif
    if &t_Co == 256
        colorscheme jellybeans
    endif

    set ttyfast

    "map [1;5C :tabnext<CR>
    "map [1;5D :tabprevious<CR>

    set mouse=a
    if has("mouse_sgr")
        set ttymouse=sgr
    elseif !has("nvim")
        set ttymouse=xterm2
    endif

endif

call LessObtrusiveFolds()
