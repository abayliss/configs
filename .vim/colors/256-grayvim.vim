" Vim color file
" Maintainer:	Piotr Husiatyński <phusiatynski@gmail.com>
" GUI version by: Andrew Bayliss <abayliss@gmail.com>

set background=dark
let g:colors_name="256-grayvim"

let python_highlight_all = 1
let c_gnu = 1

if has("gui_running")
    hi Normal	    guifg=#dadada     guibg=#262626    gui=None
    hi Cursor       guifg=bg          guibg=fg         gui=None
    hi SpecialKey	guifg=#5fffff     guibg=NONE       gui=Bold
    hi Directory	guifg=#5fd700     guibg=NONE       gui=None
    hi ErrorMsg     guifg=#af0000     guibg=White      gui=None
    hi PreProc	    guifg=#939393     guibg=NONE       gui=Bold
    hi Search	    guifg=#d60000     guibg=#080808    gui=Bold,Underline
    hi Type		    guifg=#5faefe     guibg=NONE       gui=Bold
    hi Statement	guifg=#5faefe     guibg=NONE       gui=None
    hi Comment	    guifg=#808080     guibg=NONE       gui=Italic
    hi Identifier	guifg=#86aefe     guibg=NONE       gui=Bold
    hi DiffText	    guifg=#870000     guibg=#bcbcbc    gui=None
    hi Constant	    guifg=#fe8600     guibg=NONE       gui=None
    hi Todo         guifg=#121212     guibg=#87ff00    gui=Bold
    hi Error	    guifg=#121212     guibg=#ae0000    gui=Bold
    hi Special	    guifg=#d70000     guibg=NONE       gui=Bold
    hi Ignore       guifg=#ffd700     guibg=NONE       gui=Bold
    hi Underline    guifg=#808080     guibg=NONE       gui=None

    hi FoldColumn	guifg=#9d9d9d     guibg=NONE       gui=Bold
    hi StatusLineNC guifg=#9d9d9d     guibg=#1c1c1c    gui=None
    hi StatusLine   guifg=#9d9d9d     guibg=#121212    gui=Bold
    hi VertSplit    guifg=#9d9d9d     guibg=#1c1c1c    gui=Bold

    hi LineNr	    guifg=#444444     guibg=#808080    gui=Bold
    hi LineNr	    guifg=#9d9d9d     guibg=#262626    gui=Bold
    hi NonText	    guifg=#5fffff     guibg=NONE       gui=Bold

    hi Pmenu        guifg=White       guibg=DarkGray   gui=None
    hi PmenuSel     guifg=NONE        guibg=Gray       gui=Bold
    hi PmenuSbar    guifg=DarkGray    guibg=DarkGray   gui=None
    hi PmenuThumb   guifg=Gray        guibg=Gray       gui=None
else
    set t_Co=256

    hi Normal	    ctermfg=253         ctermbg=235        cterm=None
    hi Cursor       ctermfg=Red         ctermbg=None       cterm=None
    hi SpecialKey	ctermfg=87          ctermbg=None       cterm=Bold
    hi Directory	ctermfg=76          ctermbg=None       cterm=None
    hi ErrorMsg     ctermfg=124         ctermbg=White      cterm=None
    hi PreProc	    ctermfg=246         ctermbg=None       cterm=Bold
    hi Search	    ctermfg=160         ctermbg=232        cterm=Bold,Underline
    hi Type		    ctermfg=75          ctermbg=None       cterm=Bold
    hi Statement	ctermfg=75          ctermbg=None       cterm=None
    hi Comment	    ctermfg=244         ctermbg=None       cterm=None
    hi Identifier	ctermfg=111         ctermbg=None       cterm=Bold
    hi DiffText	    ctermfg=88          ctermbg=250        cterm=None
    hi Constant	    ctermfg=208         ctermbg=None       cterm=None
    hi Todo         ctermfg=233         ctermbg=118        cterm=Bold
    hi Error	    ctermfg=233         ctermbg=124        cterm=Bold
    hi Special	    ctermfg=160         ctermbg=None       cterm=Bold
    hi Ignore       ctermfg=220         ctermbg=None       cterm=Bold
    hi Underline    ctermfg=244         ctermbg=None       cterm=None

    hi FoldColumn	ctermfg=247         ctermbg=None       cterm=Bold
    hi StatusLineNC ctermfg=247         ctermbg=234        cterm=None
    hi StatusLine   ctermfg=247         ctermbg=233        cterm=Bold
    hi VertSplit    ctermfg=247         ctermbg=234        cterm=Bold

    hi LineNr	    ctermfg=238         ctermbg=244        cterm=Bold
    hi LineNr	    ctermfg=247         ctermbg=235        cterm=Bold
    hi NonText	    ctermfg=87          ctermbg=None       cterm=Bold

    hi Pmenu        ctermfg=White       ctermbg=DarkGray   cterm=None
    hi PmenuSel     ctermfg=None        ctermbg=Gray       cterm=Bold
    hi PmenuSbar    ctermfg=DarkGray    ctermbg=DarkGray   cterm=None
    hi PmenuThumb   ctermfg=Gray        ctermbg=Gray       cterm=None
endif

"vim: sw=4
