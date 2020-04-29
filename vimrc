set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/

" Custom settings
let mapleader="_"

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
set wildignore+=tags,doc,tmp,log,node_modules
set number
"set relativenumber
set nocompatible      " Do not be compatible with Vi - be iMproved
set laststatus=2      " Always show status bar
set incsearch

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
set t_Co=256
"set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a
" tmux knows the extended mouse mode
set ttymouse=xterm2
" no freakin' end of line
set noeol

" stop searching at the end of the file
set nowrapscan

"setlocal statusline=%{pathshorten(expand('%:f'))}

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_ruby_mri_exec = '/Users/olivernoack/.rbenv/shims/ruby'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint --'
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 0

call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My bundles here:
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
"Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-markdown'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'ervandew/supertab'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-endwise'
Plugin 'flazz/vim-colorschemes'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'rizzatti/dash.vim'
"Plugin 'keith/parsec.vim'
Plugin 'junegunn/fzf'
"Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'neomake/neomake'
"Plugin 'junegunn/goyo.vim'
"Plugin 'junegunn/limelight.vim'
"Plugin 'k0kubun/vim-open-github'
"Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

" Custom settings 2
set guifont=Inconsolata\ for\ Powerline:h14
set encoding=utf-8
set background=light
colorscheme pencil
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

command Pry :normal orequire 'pry'; binding.pry<ESC>:w<CR>
command! -nargs=1 Fu :exec ":cd " . $FUCHS_DEV . "/" . <q-args> | :NERDTree | :e README

" disable arrow keys
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * NERDTree
autocmd FileType ruby let &colorcolumn=80
" check if file has been changed
"autocmd WinEnter * checktime
"autocmd CursorHold * checktime

map <D-F> :Ack<space>

" copy paste
vnoremap Y "*y
nnoremap Y "*y

"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh

syntax on

map <C-t> :FZF<CR>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ag instead of ack
let g:ackprg = 'ag --vimgrep'

cnoreabbrev Ag Ack
cnoreabbrev W w
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
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"let g:Powerline_symbols = 'fancy'
"set fillchars+=stl:\ ,stlnc:\

" fancy statusline (compare
" https://dustri.org/b/lightweight-and-sexy-status-bar-in-vim.html)
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %F\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage


" Gitgutter Icons
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'

hi Normal ctermbg=NONE
"let g:ale_completion_enabled = 1
"set completeopt=menu,menuone,preview,noselect,noinsert
