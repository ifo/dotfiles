if &compatible
  set nocompatible " Be iMproved
endif

  " Specify plugin directory
call plug#begin('~/.local/share/nvim/plugged')

  " search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }

  " autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete-go (for gocode completion support)
" https://github.com/zchee/deoplete-go
Plug 'zchee/deoplete-go', { 'do': 'make'}

  " navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'

  " Initialize plugin system
call plug#end()

  " line numbers
set number

  " highlight the current line
set cursorline

  " auto indentation
set autoindent

  " setting tabs and shift widths - convert tabs to spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

  " spell check and wrap at 80 characters in text and markdown files
autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :set spell tw=80

  " make central swap folder
set directory=~/.config/nvim/nvimswaps//

  " make vim backups in central folder
set backup
set backupdir=~/.config/nvim/nvimbackups//

  " enable clipboard support
set clipboard=unnamed

  " enable goimports
let g:go_fmt_command = "goimports"

  " highlight search
set hlsearch

  " case insensitive search when all lowercase
set ignorecase
set smartcase

  " colorscheme
  " base16
"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-default-dark
  " molokai
let g:rehash256 = 1
"let g:molokai_original = 1
colorscheme molokai
  " gruvbox
"set background=dark
"set termguicolors
"colorscheme gruvbox
  " github
"set background=dark
"colorscheme github

  " clear search highlight with esc
nnoremap <return> :noh<return><return>

  " highlight column number 80
set colorcolumn=80
hi ColorColumn cterm=underline ctermbg=none

  " NERDTree
map <C-n> :NERDTreeToggle<CR>
  " Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
  " Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
  " Auto close when NERDTree is the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Use deoplete.
let g:deoplete#enable_at_startup = 1
  " Use smartcase.
let g:deoplete#enable_smart_case = 1
  " Use go caches.
let g:deoplete#sources#go#use_cache = 1
  " Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
