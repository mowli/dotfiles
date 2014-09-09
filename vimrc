set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Custom settings
let mapleader="_"

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
" Ignore files for ctrlp
set wildignore+=tags,doc,tmp,log
set nocompatible      " Do not be compatible with Vi - be iMproved
set number            " Enable line numbers
set laststatus=2      " Always show status bar

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a
" tmux knows the extended mouse mode
set ttymouse=xterm2
" no freakin' end of line
set noeol

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 0

" end

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'flazz/vim-colorschemes'
Bundle 'thoughtbot/vim-rspec'
Bundle 'rizzatti/dash.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'christoomey/vim-tmux-navigator'
" Git repos on your local machine (i.e. when working on your own plugin)

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
" Custom settings 2
set guifont=Inconsolata\ for\ Powerline:h14
set encoding=utf-8
set background=dark
colorscheme solarized
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

command Pry :normal orequire 'pry-remote'; binding.remote_pry<ESC>:w<CR>
command! -nargs=1 Fu :exec ":cd " . $FUCHS_DEV . "/" . <q-args> | :NERDTree

" disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * NERDTree
autocmd FileType ruby let &colorcolumn=80

map <D-F> :Ack<space>

" copy paste
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
vnoremap Y "*y
nnoremap Y "*y

"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh

syntax on

map <C-t> :CtrlP<CR>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

function!   QuickFixOpenAll()
  if empty(getqflist())
    return
  endif
  let s:prev_val = ""
  for d in getqflist()
    let s:curr_val = bufname(d.bufnr)
    if (s:curr_val != s:prev_val)
      exec "edit " . s:curr_val
    endif
    let s:prev_val = s:curr_val
  endfor
endfunction

command! QuickFixOpenAll         call QuickFixOpenAll()


" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

" Gitgutter Icons
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'

hi Normal ctermbg=NONE
