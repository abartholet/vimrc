"------------------------------------------------"
" Interface
"------------------------------------------------"
" Windows dimensions
set lines=47
set columns=110

" Disable toolbar
set guioptions-=T

" Enable mouse
set mouse=a

" Hide mouse cursor when typing
set mousehide

" Right mouse button pops up menu
set mousemodel=popup

"------------------------------------------------"
" Colours and Fonts
"------------------------------------------------"
" I just spent 7 hours playing with fonts? Holy shit!
if has('win32') || has('win64')
    set guifont=Droid_Sans_Mono_Slashed_for_Powerline:h12,Droid_Sans_Mono_Slashed:h12,Inconsolata_Bold:h12,Andale_Mono:h16,Menlo:h15,Consolas:h16,Courier_New:h18
else
    set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 12,Droid\ Sans\ Mono\ Slashed\ 12,Inconsolata\ Medium\ 12,Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
endif
