"------------------------------------------------"
" Interface
"------------------------------------------------"
" No noise!
set visualbell
set t_vb=

" Minimum window height.
set winminheight=0

" Windows dimensions.
set lines=47
set columns=110

" Disable toolbar.
set guioptions-=T

" Enable mouse.
set mouse=a

" Hide mouse cursor when typing.
set mousehide

" Right mouse button pops up menu.
set mousemodel=popup

"------------------------------------------------"
" Colours and Fonts
"------------------------------------------------"
" I just spent 7 hours playing with fonts? Holy shit!
if has('win32') || has('win64')
    set guifont=Fira_Code_Regular:h12
else
    set guifont=Fira\ Code\ Regular\ 12
endif
