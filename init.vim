if &compatible
  set nocompatible               " Be iMproved
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" navigation
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()

" Use deoplete.
call deoplete#enable()

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

  " make tabs easier to navigate
"map <C-l> :tabn<CR>
"map <C-h> :tabp<CR>
"map <C-n> :tabnew<CR>

  " enable goimports
let g:go_fmt_command = "goimports"

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

  " deocomplete stuff
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
