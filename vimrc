  " Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle
Plugin 'gmarik/vundle'

  " My Bundles:
  "
  " github
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'pangloss/vim-javascript'
Plugin 'https://github.com/jelera/vim-javascript-syntax'
  " colorschemes
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'endel/vim-github-colorscheme'
"Plugin 'github-theme'
"Plugin 'google/vim-colorscheme-primary'

Plugin 'digitaltoad/vim-jade'
Plugin 'lukerandall/haskellmode-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/SimpylFold'
Plugin 'gkz/vim-ls'
Plugin 'vim-scripts/trailing-whitespace'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'raichoo/haskell-vim'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
 " clojure
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'
" powerline
  " vim-scripts
  " non github

  " end of Vundle
call vundle#end()

  " turn syntax highlighting on
syntax enable

" only do this if autocommands is enabled
if has("autocmd")
  " enable filetype detection
  filetype plugin indent on

  " don't expand tabs
"  autocmd Filetype make setlocal ts=4 sts=4 sw=4 noet
endif

  " rainbow paretheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

  " line numbers
set number

  " highlight the current line
set cursorline

  " auto indentation
set autoindent

  " making brackets indent
"set smartindent

  " setting tabs and shift widths - convert tabs to spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

  " set tabs and shift widths for python, fix paren length
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
let g:pyindent_open_paren = '&sw'

  " easier fold toggling
nnoremap <space> za

  " make two semi-colons escape
"inoremap ;; <esc>

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

  " setup browser for haskell_doc.vim
"let g:haddock_browser = "open"

  " enable mouse support
set mouse=a

  " enable clipboard support
set clipboard=unnamed

  " setup NERDTree hotkey
map <F2> :NERDTreeTabsToggle<CR>
  " and have NERDTree open by default
"let g:nerdtree_tabs_open_on_console_startup=1

  " make tabs easier to navigate
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

  " set colorscheme (for solarized)
"set background=dark
"colorscheme solarized

  " set colorscheme
"colorscheme github
"set t_Co=256
"set background=dark
"colorscheme primary

  " highlight search
set hlsearch

  " clear search highlight with esc
nnoremap <return> :noh<return><return>

  " highlight column number 80
set colorcolumn=80
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi ColorColumn cterm=underline ctermbg=none
