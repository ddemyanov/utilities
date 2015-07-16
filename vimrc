" Base settings
autocmd!

set nocompatible
set nomodeline

" TMUX
if exists('$TMUX')
    set term=screen-256color
else
    set term=xterm-256color
endif

" Terminal settings
set t_Co=256
set t_RV=
set ttymouse=xterm2

" Encoding
set termencoding=utf-8 nobomb
set encoding=utf-8 nobomb
scriptencoding utf-8 nobomb

" MapLeader
let mapleader=","

" Map Esc
inoremap jk <ESC>

" быстрое сохранение сессии/файлов и выход
function! SaveSessionAndQuit()
	!rm -f ~/.session.vim
	mksession ~/.session.vim
	wa
	qa
endfunction

" сохранение изменений
map <F1> :w<CR>
" безусловное закрытие текущего таба
map <F2> :q<CR>
" быстрое открытие файлов в табе
map <F3> :tabnew<Space>
" очистка поиска
map <silent> <F4> :let @/=''<CR>
" Перезагрузка содержимого всех вкладок
map <F5> :tabdo e<CR>
" выход с сохранением сессии
map <F7> :call SaveSessionAndQuit()
map <F8> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" быстрый переход между табами
nmap <C-h> gT
nmap <C-l> gt
" Показать текущий файл в дереве NERDTree
nmap <silent> <leader>f :NERDTreeFind<CR>

" Set Colorscheme
set background=light
colorscheme solarized

set guioptions-=r
set guioptions-=L

set nojoinspaces " Use only 1 space after "." when joining lines instead of 2

" Prevent adding newline(\n) on last line
set binary
set noeol

" Performance
set ttyfast " Send more characters at a given time
set lazyredraw " Don't redraw when we don't have to

" Joining with indents is useless - instead join and delete spaces
nnoremap gJ Jdiw

filetype plugin indent on " Plugins set indentation
syntax enable " Enable syntax highlighting
set visualbell " Use visual bell instead of audible bell
set noerrorbells " Disable errorbells
set autoindent " Copy indent from last line when starting new line
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=99 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set magic " Enable extended regexes
set mouse=a " Enable mouse in all modes
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set number " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set report=0 " Show all changes
set ruler " Show the cursor position"
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set nobackup
set nowritebackup
set noswapfile
set listchars=trail:·,tab:→→,extends:>,precedes:<
set list
set completeopt-=preview
set splitbelow splitright
set updatecount=0
set wildmode=list:longest
set wildmenu
set shortmess=atI
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set switchbuf=""
set title " Show the filename in the window titlebar
set undofile " Persistent Undo
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/doc/*,*/source_maps/*,*/dist/*,*/public/*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
set showmatch
set showcmd
set fileformats=unix,dos,mac
set clipboard=unnamed
set wrap
set autoread " Auto-reload buffers when files are changed on disk

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

syntax sync minlines=256 " Update syntax highlighting for more lines increased scrolling performance

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme='lucius'

" Move line below even if wrap is enabled
nnoremap j gj
nnoremap k gk

" Be able to use ';' for commands, instead of ':' for faster typing
nnoremap ; :

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files in NERDTree
" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1
" Стандартная ширина окна с NERDTree
let NERDTreeWinSize=40
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.DS_Store$', '\.vim$']
map <leader>e :NERDTreeToggle<CR>
map <leader>r :QuickRun<CR>

" VIM-JSON
let g:vim_json_syntax_conceal=0 " Don't hide quotes

" Turn off highlighting
nnoremap <silent>  <leader>/ :nohl<cr>

" CtrlP
" Use ag(brew install the_silver_searcher) as default CtrlP search
if executable('ag')
    if exists("g:ctrlp_user_command")
      unlet g:ctrlp_user_command
    endif

    let g:ackprg='ag --vimgrep'
    let g:ctrlp_use_caching=0
    let g:ctrlp_user_command = 'ag %s -g "" --nocolor --nogroup --hidden --skip-vcs-ignores
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"'
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden\ --column\ --skip-vcs-ignores
    set grepformat=%f:%l:%c%m
endif

let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_mruf_relative=1
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_map=',t'
let g:ctrlp_custom_ignore='\.git\|\.svn\|\node_modules\|\.DS_Store'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_height=15
let g:ctrlp_max_files=50000
let g:ctrlp_switch_buffer = 'Et'
nnoremap <silent> ,t :CtrlP<CR>
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_matchtype='path'
let g:ctrlp_funky_syntax_highlight=1

" Vim-Pasta
let g:pasta_paste_before_mapping=',P'
let g:pasta_paste_after_mapping=',p'

"Vim-JSDoc
let g:jsdoc_access_descriptions=2
let g:jsdoc_underscore_private=1
let g:jsdoc_default_mapping=0

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" NeoComplete
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete_min_syntax_length=1
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Strip whitespace on save
autocmd BufWritePre <buffer> StripWhitespace

" Add syntax highlighting to json files
autocmd BufRead,BufNewFile .eslintrc set filetype=json
autocmd BufRead,BufNewFile .jshintrc set filetype=json
autocmd BufRead,BufNewFile .jscsrc set filetype=json

" Delete hidden buffer
autocmd BufRead * call s:set_hidden()
function! s:set_hidden()
    if empty(&buftype) "most explorer plugins have buftype=nofile
        setlocal bufhidden=delete
    endif
endfunction

let g:js_indent_log=0

" Vim-javascript-libs
let g:used_javascript_libs = 'jquery,underscore,react,flux,chai,jasmine'

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Vim-JSX
let g:jsx_ext_required=1
let g:jsx_no_default_key_mappings=1

"Vim-rooter
let g:rooter_change_directory_for_non_project_files = 1

" CTags
set tags=./tags,tags;$HOME

" EasyTags
let g:easytags_async=1
let g:easytags_auto_highlight = 0
let g:easytags_updatetime_min=10000


" Vim-Plug Plugins
call plug#begin()
    Plug 'scrooloose/syntastic'
    Plug 'xolox/vim-shell'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'kien/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'rking/ag.vim'
    Plug 'tpope/vim-commentary'
    Plug 'Raimondi/delimitMate'
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'sickill/vim-pasta'
    Plug 'airblade/vim-gitgutter'
    Plug 'haya14busa/incsearch.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'bling/vim-airline'
    Plug 'altercation/vim-colors-solarized', { 'do': 'mkdir -p ~/.vim/colors && cp ./colors/* ~/.vim/colors' }
    Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ap/vim-css-color', { 'for': 'css' }
    Plug 'thinca/vim-quickrun'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeTabsToggle' }
    Plug 'Shougo/neocomplete.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'wavded/vim-stylus', { 'for': 'stylus' }
    Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle'}
    Plug 'chrisbra/csv.vim', { 'for': 'csv' }
    Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'solarnz/thrift.vim'
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx'] }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'airblade/vim-rooter'
    Plug 'mvolkmann/vim-js-arrow-function', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'wincent/terminus'
    Plug 'ahayman/vim-nodejs-complete', { 'for': ['javascript', 'javascript.jsx'] }
call plug#end()