" Native Python for MacVim and the existing YouCompleteMe build.
if has('mac') && filereadable('/opt/homebrew/opt/python@3.11/Frameworks/Python.framework/Versions/3.11/Python')
    let &pythonthreedll = '/opt/homebrew/opt/python@3.11/Frameworks/Python.framework/Versions/3.11/Python'
    let g:ycm_server_python_interpreter = '/opt/homebrew/bin/python3.11'
    let g:ycm_clangd_binary_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd'
endif

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
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-scripts/TagHighlight'
Plugin 'luochen1990/rainbow'
Plugin 'lepture/vim-jinja'
Plugin 'toyamarinyon/vim-swift'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'junegunn/vim-easy-align'
Plugin 'edkolev/tmuxline.vim'
Plugin 'nvie/vim-flake8'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'Yggdroot/indentLine'
" Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'

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
set display=lastline
set cursorline
set cryptmethod=blowfish2
set clipboard=unnamed
set autochdir

autocmd BufNewFile,BufRead *.md filetype plugin indent off
autocmd TerminalOpen * if &buftype == 'terminal' | set nonu | endif
" Crontab requires that files are edited in place
au FileType crontab setlocal bkc=yes

let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_enable_hover=0
let g:rainbow_active=1
let g:NERDSpaceDelims=1
let g:termdebug_wide=1
let g:impsort_highlight_imported=1
let g:impsort_highlight_star_imports=1

" Persistant Undo
set undofile
set undodir=$HOME/.vim/vimundo
set undolevels=1000
set undoreload=10000

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
nnoremap rg :!rg --color=auto "<cword>" .<CR>
nnoremap rG :!rg --color=auto "<cword>" ~/go 2>/dev/null<CR>
nnoremap Q <NOP>
cabbrev h vert h

noremap <leader>y :.w !~/.vim/pbcopy<CR><CR>

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

abbreviate bmtx \begin{bmatrix} \end{bmatrix}


map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Disable rainbow in html.jinja
au FileType jinja.html RainbowToggle
au FileType jinja.html set sw=2
au FileType typescript set sw=2
au FileType typescriptreact set sw=2
au FileType go set noexpandtab
au FileType json set syn=txt

" packadd termdebug

" airline's tmuxline extension owns the live status format (applied on Vim start).
" Preserve the patched Continuum save trigger when Vim applies its status format.
" Do not snapshot this status back into bak.tmux.conf — that races restore at boot.
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

function! s:usage_status()
    return filereadable(expand('~/.local/bin/tmux-usage'))
        \ ? '#(~/.local/bin/tmux-usage)'
        \ : '#H'
endfunction

" Select the status layout per attached client; keep the original desktop format.
let s:desktop_status_format = '#[align=left range=left #{E:status-left-style}]#[push-default]#{T;=/#{status-left-length}:status-left}#[pop-default]#[norange default]#[list=on align=#{status-justify}]#[list=left-marker]<#[list=right-marker]>#[list=on]#{W:#[range=window|#{window_index} #{E:window-status-style}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-format}#[pop-default]#[norange default]#{?loop_last_flag,,#{E:window-status-separator}},#[range=window|#{window_index} list=focus #{?#{!=:#{E:window-status-current-style},default},#{E:window-status-current-style},#{E:window-status-style}}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-current-format}#[pop-default]#[norange list=on default]#{?loop_last_flag,,#{E:window-status-separator}}}#[nolist align=right range=right #{E:status-right-style}]#[push-default]#{T;=/#{status-right-length}:status-right}#[pop-default]#[norange default]'
let s:phone_status_format = '#[list=on align=centre]#[list=left-marker]<#[list=right-marker]>#[list=on]#{W:#[range=window|#{window_index}] [#I]#W #[norange],#[range=window|#{window_index} list=focus bold] [#I]#W #[norange list=on nobold]}#[nolist]#(~/.tmux/plugins/tmux-continuum/scripts/continuum_save.sh)'

let g:tmuxline_preset = {
      \'a'    : 'MICHAEL',
      \'b'    : s:usage_status(),
      \'c'    : '#S',
      \'win'  : '#[fg=colour146][#I]#W',
      \'cwin' : '[#I]#W',
      \'x'    : '#(' . expand('~/.tmux/plugins/tmux-continuum/scripts/continuum_save.sh') . ')%R',
      \'y'    : '%a %m/%d',
      \'z'    : '#(~/.tmux/plugins/tmux-continuum/scripts/continuum_status.sh)',
      \'options' : {'status-justify' : 'absolute-centre',
      \ 'status-format[0]' : '#{?#{e|<:#{client_width},80},' . s:phone_status_format . ',' . s:desktop_status_format . '}'}}

function! s:gitModified()
    " Check if gt is installed and we're in a git repo
    if !executable('gt') || system('git rev-parse --is-inside-work-tree 2>/dev/null') !~# 'true'
        return []
    endif
    let files = systemlist('git diff --name-only $(gt parent) 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
      \ { 'type': function('s:gitModified'), 'header': ['   git diff $(gt parent)']},
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = ['~/.vim/vimrc', '~/.zshrc' ]
