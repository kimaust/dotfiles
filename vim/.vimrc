" Turn on incremental search, i.e. search preview
set is

" Show cursor position all the time
set ruler

" Show incomplete commands in the status bar.
set showcmd

" Show a menu in the status bar when using tab completion.
set wildmenu

" Keep these lines on top of the screen after re-centering.
set scrolloff=9

" Turn on highlight search, keep searched term highlighted.
set hls

" Turn on line numbering
set number

" Expand tab to space, and indentation to 4 spaces.
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Keep large history
set history=1000

" Ignore case when searching
set ignorecase
" Override the ignore case option if the pattern contains uppercase letters.
set smartcase

" Create backup, will create another file with ~suffix default.
"set backup
" Set backup extension.
"set bex=extension

" Wrap around break instead of mid-word
set lbr

" Copies indentation from current line when starting a new line
set autoindent
" Smart auto-indenting when starting a new line
set smartindent

" Adjust colour groups for dark background 
set bg=dark

" Set color scheme (~/.vim/colors)
"color name

"map KEY KEYSTROEKS

" Using leader key (default \), leader key must be above mapping.
"let mapleader=","
"map <leader><key> <command>

" Make buffers hidden instead of unloading
set hidden
