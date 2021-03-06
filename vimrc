  " Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle
Plugin 'gmarik/vundle'

  " languages
Plugin 'https://github.com/jelera/vim-javascript-syntax'
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'raichoo/haskell-vim'
Plugin 'fatih/vim-go'
"Plugin 'nvie/vim-flake8'
"Plugin 'tell-k/vim-autopep8'
Plugin 'vim-syntastic/syntastic'

  " autocomplete
Plugin 'Valloric/YouCompleteMe'

  " style
Plugin 'vim-scripts/trailing-whitespace'

  " navigation
Plugin 'christoomey/vim-tmux-navigator'

  " Status bar mods
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'

  " end of Vundle
call vundle#end()

  " turn syntax highlighting on
syntax enable

  " only do this if autocommands is enabled
if has("autocmd")
  " enable filetype detection
  filetype plugin indent on
endif

  " line numbers
set number

  " highlight the current line
set cursorline

  " auto indentation
set autoindent

  " setting tabs and shift widths - convert tabs to spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

  " set tabs and shift widths for python, fix paren length
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
let g:pyindent_open_paren = '&sw'

  " set different spacing for tsvs
autocmd BufRead,BufNewFile *.tsv setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

  " spell check and wrap at 80 characters in text and markdown files
autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :set spell tw=80

  " remove error bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

  " enable automatic folding
set foldmethod=syntax
set foldlevelstart=30

let javaScript_fold=1
let php_folding=1

  " make delete work as expected
set backspace=indent,eol,start

  " make central swap folder
set directory=~/.vim/vimswaps//

  " make vim backups in central folder
set backup
set backupdir=~/.vim/vimbackups

  " enable mouse support
set mouse=a

  " enable clipboard support
set clipboard=unnamed

  " make tabs easier to navigate
"map <C-l> :tabn<CR>
"map <C-h> :tabp<CR>
"map <C-n> :tabnew<CR>

  " highlight search
set hlsearch

  " case insensitive search when all lowercase
set ignorecase
set smartcase

  " clear search highlight with esc
nnoremap <return> :noh<return><return>

  " highlight column number 80
set colorcolumn=80
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi ColorColumn cterm=underline ctermbg=none

  " autopep8 config
let g:autopep8_disable_show_diff=1

  " enable goimports
let g:go_fmt_command = "goimports"

  " autorun on python files
"autocmd BufWritePost *.py call Autopep8()
"autocmd BufWritePost *.py call Flake8()

  " Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ["eslint"]

let g:syntastic_python_checkers = ['python']

  " Airline
set laststatus=2
