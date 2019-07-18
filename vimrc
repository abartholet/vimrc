"------------------------------------------------"
" Environment
"------------------------------------------------"
" Must be first line
set nocompatible

"------------------------------------------------"
" Plugins
"------------------------------------------------"
" Load the plugins from a separate file.
source ~/.vimrc.plugins

"------------------------------------------------"
" Commands and Functions
"------------------------------------------------"
" Use the :Wrap command to soft wrap text
command! -nargs=* Wrap set wrap linebreak nolist

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l=line(".")
  let c=col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Goto definition of tag under the cursor ignoring case
function! MatchCaseTag()
  let ic=&ic
  set noic
  try
    exe 'tjump ' . expand('<cword>')
  finally
     let &ic=ic
  endtry
endfunction

" Create a directory if it doesn't exist
function! CreateDir(dir)
  if !isdirectory(a:dir)
    call mkdir(a:dir,'p')
  endif
endfunction

"------------------------------------------------"
" General
"------------------------------------------------"
" Number of lines to remember
set history=1000

" Enable filetype plugins
filetype plugin indent on

"------------------------------------------------"
" Interface
"------------------------------------------------"
" No noise!
set noerrorbells
set novisualbell
set t_vb=

" Disable mouse
set mouse=

" Don't backspace over eol
set backspace=start,indent

" Show row and column position
set ruler

" Show line numbers
set number

" Highlight current line
set cursorline

" Show current mode
set showmode

" Don't wrap lines
set nowrap

" Minimum window height
set winminheight=0

" Hide buffer when it is abandoned
set hidden

" Ignore case when searching
set ignorecase

" Override ignore case when upper case is used
set smartcase

" Match search results while typing
set incsearch

" Highlight search results
set hlsearch

" Show matching brackets
set showmatch

" Extra margin when folding
set foldcolumn=1

" Avoids 'hit enter' prompts
set shortmess+=filmnrxoOtT

" Enable wild menu
set wildmenu

" Complete till longest common string and list all matches
set wildmode=longest,list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"------------------------------------------------"
" Colours and Fonts
"------------------------------------------------"
"Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" If we're in a real console use desert
if &term == 'linux'
  color desert
else
  " Try using yowish or fallback to desert
  try
      color yowish
  catch /^Vim\%((\a\+)\)\=:E185/
      color desert
  endtry
endif

" Use and dark background
set background=dark

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"------------------------------------------------"
" Swaps and Backups and Undos, Oh my!
"------------------------------------------------"
" Persistent undo
set undofile

" Store swap, backup and undo in a fixed location
if has('win32') || has('win64')
  call CreateDir($HOME . "/vimfiles/swap")
  call CreateDir($HOME . "/vimfiles/backup")
  call CreateDir($HOME . "/vimfiles/undo")
  set directory=$HOME\vimfiles\swap\\,$TEMP\\
  set backupdir=$HOME\vimfiles\backup\\,$TEMP\\
  set undodir=$HOME\vimfiles\undo\\,$TEMP\\
else
  call CreateDir($HOME . "/.vim/swap")
  call CreateDir($HOME . "/.vim/backup")
  call CreateDir($HOME . "/.vim/undo")
  set directory=$HOME/.vim/swap//,/tmp//
  set backupdir=~/.vim/backup//,/tmp//
  set undodir=~/.vim/undo//,/tmp//
endif

"------------------------------------------------"
" Tabs and Indenting
"------------------------------------------------"
" Use spaces instead of tabs
set expandtab

" Tab is 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Copy indent from current line to next line
set autoindent

" Highlight problematic whitespace
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:.

"------------------------------------------------"
" Key (re)Mappings
"------------------------------------------------"
let mapleader=','

"Pressing ,sc will toggle and untoggle spell checking
nmap <leader>sc :setlocal spell!<cr>
" Move to the next misspelled word
nmap <leader>sn ]s
" Move to the previous misspelled word
nmap <leader>sp [s
" Add word as good word
nmap <leader>sa zg
" Add word as bad word
nmap <leader>sd zw
" Suggest correct spelling
nmap <leader>ss z=

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Match case insensitive tags
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>

" Remove Trailing whitespace
nmap <leader>w :call StripTrailingWhitespace()<CR>

"------------------------------------------------"
"File Types
"------------------------------------------------"
" Detect the filetype before saving
autocmd BufWritePre <buffer> filetype detect

" Remove trailing whitespace
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,vim autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Column markings
autocmd FileType python let &colorcolumn=join(range(81,999),",")
autocmd FileType python let &colorcolumn="80,".join(range(101,999),",")

" Treat AstroScript files as VB files.
autocmd BufNewFile,BufRead *.AstroScript setlocal filetype=vb

" Text
autocmd FileType text,plaintex,bib setlocal wrap linebreak nolist

autocmd FileType html,yaml,xml,sshconfig,vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

