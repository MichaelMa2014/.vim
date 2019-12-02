set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tweekmonster/impsort.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'
Plugin 'plasticboy/vim-markdown'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-scripts/TagHighlight'
Plugin 'luochen1990/rainbow'
Plugin 'niftylettuce/vim-jinja'
Plugin 'toyamarinyon/vim-swift'
Plugin 'MichaelMa2014/vim-instant-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'junegunn/vim-easy-align'
Plugin 'edkolev/tmuxline.vim'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
colorscheme darcula
set number
set backspace=2
set laststatus=2
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set list
set listchars=tab:>-,trail:•,extends:#,nbsp:.
set pastetoggle=<F12>
set hlsearch
"set completeopt-=preview
set wildmode=longest,list,full
set wildmenu
set showcmd
set ignorecase
set smartcase
set ttimeoutlen=0
set foldmethod=manual
set autoread
set viminfo='100,<1000,s100,:100,n$HOME/.vim/viminfo
set colorcolumn=80
set mouse=a
set exrc
set winwidth=86
set winminwidth=20
set wrap
set cursorline
set cryptmethod=blowfish2

autocmd BufNewFile,BufRead *.md filetype plugin indent off
autocmd TerminalOpen * if &buftype == 'terminal' | set nonu | endif

let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:rainbow_active=1
let g:vim_markdown_folding_disabled=1
let g:NERDSpaceDelims=1
let g:termdebug_wide=1

" Persistant Undo
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000

" Markdown preview testing
let g:instant_markdown_open_to_the_world=1

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-G> :leftabove vertical YcmCompleter GoTo<CR>
nnoremap <C-F> :YcmCompleter FixIt<CR>
nnoremap <F2> :set foldmethod=indent<CR>
nnoremap <F3> :NERDTree<CR>
nnoremap <F4> :vs<CR>:Startify<CR>
noremap j gj
noremap k gk
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap gr :!grep -RniIw --color=auto "<cword>" .<CR>
nnoremap gR :!grep -RniI --color=auto "<cword>" .<CR>
nnoremap Q <NOP>
cabbrev h vert h

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight Pmenu ctermbg=0

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map gf :call ShowFuncName() <CR>

abbreviate ffia from __future__ import division<CR>from __future__ import absolute_import<CR>from __future__ import print_function<CR>from __future__ import unicode_literals
abbreviate bmtx \begin{bmatrix} \end{bmatrix}

" Crontab requires that files are edited in place
au FileType crontab setlocal bkc=yes

map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Disable rainbow in html.jinja
au FileType jinja.html RainbowToggle

packadd termdebug

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:tmuxline_preset = {
      \'a'    : 'MICHAEL',
      \'b'    : '#S',
      \'c'    : '#S',
      \'win'  : '#[fg=colour146][#I]#W',
      \'cwin' : '[#I]#W',
      \'x'    : '%R',
      \'y'    : '%a %m/%d',
      \'z'    : '#H'}

