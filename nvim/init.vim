" General settings {{{
" ===================================
" Use spaces instead of tabs
set expandtab

" Set tabs
set tabstop=2
set shiftwidth=2

" Hides buffers instead of closing them
set hidden

" Add space for gutter column
set signcolumn=yes:1

" Show numbers in gutter
set number
" Relative numbers in gutter
set relativenumber

" Use the colorscheme of the terminal
set termguicolors

" Enables reusing undo history after reboot
set undofile

" Checks for spelling
"set spell

" Sets the vim title to the file name
set title

" Ignores case in searches
set ignorecase
" Overrides ignorecase if search has uppercase
set smartcase

set wildmenu
set wildmode=longest:full,full

" Allow folding
set foldenable
" Fold by blocks
set foldmethod=syntax
" Fold nested blocks by default
set foldlevelstart=10

" No swap files
set noswapfile
" No trying to delete old backups
set nobackup
" No backups before overwriting file
set nowritebackup

" Show only specific blank characters (leading tabs and trailing spaces)
set list
set listchars=tab:▸\ ,trail:·
" Configure backspace behavior
"    indent: backspace through automatic indent
"    eol: backspace through line break
"    start: backspace through start of 'insert'
set backspace=indent,eol,start

" Set to auto read when a file is changed from the outside
set autoread

" Show cursor position
set ruler
" Show status line always
set laststatus=2

" Keep line padding when scrolling
set scrolloff=8
set sidescrolloff=8

" When joining lines, do not add a space
set nojoinspaces

" use system clipboard
set clipboard=unnamedplus

" when quitting, it'll ask you if you want to save or not instead of failing
set confirm
" }}}


" ===================================
" Key Maps {{{
" ===================================
let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Allow gf to open non-existent files
"map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Make Y behave like the other capitals
nnoremap Y y$


" Keep results centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Mapforce save as sudo
cmap w!! %!sudo tee > /dev/null %

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Skip character
imap <C-j> <Esc>:exec <Esc>wa

" Go to end of line
imap <C-l> <Esc>:exec <Esc>A

" buffer navigation
nmap <leader>n :enew<cr>
noremap <silent> [b :bprevious <CR>
noremap <silent> ]b :bnext <CR>

" Open bufexplorer
map <leader>e :Explore<CR>:set number<CR>

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Deactivate arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" }}}

" ===================================
" Custom Functions{{{
" ===================================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.json :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.sass :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.scala :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.wiki :call DeleteTrailingWS()

" Switch from relative to absolute line number
function! NumberToggle()
    set number
    if(&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Switch from two space to four space tabs
function! SpacesToggle()
    if(&tabstop == 4)
        set tabstop=2
        set shiftwidth=2
    else
        set tabstop=4
        set shiftwidth=4
    endif
endfunc
nnoremap <C-s> :call SpacesToggle()<cr>
" }}}

" ===================================
" Plugins {{{
" ===================================
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/fzf.vim
" TODO
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/syntastic.vim
source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/rainbow.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/repeat.vim
"source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/visual-star-search.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/vimwiki.vim
source ~/.config/nvim/plugins/goyo.vim
source ~/.config/nvim/plugins/todoist.vim
" Languages
source ~/.config/nvim/plugins/go.vim
source ~/.config/nvim/plugins/javascript.vim
source ~/.config/nvim/plugins/node.vim
source ~/.config/nvim/plugins/graphql.vim
source ~/.config/nvim/plugins/jsx.vim
source ~/.config/nvim/plugins/typescript.vim
"source ~/.config/nvim/plugins/less.vim
" TODO: move to emmet.vim
source ~/.config/nvim/plugins/html.vim
source ~/.config/nvim/plugins/clojure.vim
source ~/.config/nvim/plugins/rust.vim
source ~/.config/nvim/plugins/markdown.vim
source ~/.config/nvim/plugins/asm.vim
source ~/.config/nvim/plugins/solidity.vim

source ~/.config/nvim/plugins/writer-env.vim


" Polyglot
"source ~/.config/nvim/plugins/polyglot.vim

" TO CONSIDER
" tpope/vim-abolish
" tpope/vim-dispatch
" tpope/vim-unimpaired
" glacambre/firenvim -- embed neovim in chrome/firefox
" voldikss/vim-floaterm -- floating neovim windows
" tommcdo/vim-lion -- align list items vertically
" nerdtree - https://github.com/jessarcher/dotfiles/blob/master/nvim/plugins/nerdtree.vim
" tpope/vim-projectionist -- alias common commands across project types
" jessarcher/vim-sayonara -- close things in a smart/same way
" kana/vim-textobj-user -- define custom text objects -- https://github.com/jessarcher/dotfiles/blob/master/nvim/plugins/textobj-xmlattr.vim
" mg979/vim-visual-multi -- visual mode editing and autocomplete from normal mode

call plug#end()
doautocmd User PlugLoaded
" }}}
