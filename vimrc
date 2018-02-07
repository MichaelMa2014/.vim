set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
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

autocmd BufNewFile,BufRead *.md filetype plugin indent off

let g:ycm_confirm_extra_conf=0
let g:rainbow_active=1

" Persistant Undo
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000

" Markdown preview testing
let g:instant_markdown_open_to_the_world=1

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-G> :YcmCompleter GoTo<CR>
nnoremap <F2> :set foldmethod=indent<CR>
nnoremap <F3> :NERDTree<CR>
nnoremap <F4> :UndotreeToggle<CR>
noremap j gj
noremap k gk
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap Q <NOP>
nnoremap <F9> :SLoad<SPACE>
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
map f :call ShowFuncName() <CR>

abbreviate ffia from __future__ import division<CR>from __future__ import absolute_import<CR>from __future__ import print_function<CR>from __future__ import unicode_literals

" Crontab requires that files are edited in place
au FileType crontab setlocal bkc=yes

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Disable rainbow in html.jinja
au FileType jinja.html RainbowToggle
