set nocompatible
set encoding=utf8
function! LoadVundle()
    let vundle_installed=filereadable(expand('~/.vim/bundle/vundle/README.md'))
    if vundle_installed == 0
        echo "Creating backups directory..."
        silent !mkdir -p ~/.vim/backups
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Bundle definitions
    Plugin 'majutsushi/tagbar'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'Raimondi/delimitMate'
    Plugin 'mattn/emmet-vim'
    Plugin 'fatih/vim-go'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'vim-airline/vim-airline'
    Plugin 'elzr/vim-json'
    Plugin 'zhaocai/GoldenView.Vim'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'chemzqm/vim-jsx-improve'
    Plugin 'epilande/vim-react-snippets'
    Plugin 'rking/ag.vim'
    " Plugin 'Shougo/neocomplete.vim'
    Plugin 'othree/yajs.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tomasr/molokai'
    Plugin 'Valloric/MatchTagAlways'
    Plugin 'w0rp/ale'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'ervandew/supertab'
    Plugin 'roxma/nvim-completion-manager'

    if vundle_installed==0
        echo vundle_installed
        echo "Vundle Installed, now Installing Bundles..."
        echo ""
        :BundleInstall
        silent !make -C ~/.vim/bundle/vimproc.vim
    endif
    filetype plugin indent on
endfunction
call LoadVundle()
filetype plugin indent on
set number
set relativenumber
set cursorline
""""""""" set cursorcolumn
set nuw=4
set ruler
set hidden
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set linespace=2
set scrolloff=5
set clipboard=unnamed
set expandtab
set list listchars=tab:\ \ ,trail:·
" set list listchars=tab:»-,trail:·,extends:»,precedes:«
set syntax=whitespace
set autoindent
set smartindent
set virtualedit=block
set backspace=indent,eol,start
" Searching
set hlsearch
set incsearch
set ignorecase
set modeline
set modelines=10
set nojoinspaces
set autoread
set showcmd
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()
set backupdir=~/.vim/backups
" Tab completion
set wildignore+=*.o,*.obj,.git,*.rbc,.svn
set laststatus=2

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|^env$|^venv$|bower_components$\|dist$\|^node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/env/*,*/venv/*,*/node_modules/*,*.DS_Store,*.pyc,*.pyo,*__pycache__
"""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0

map <c-b> <Esc>:w <CR> :GoRun <CR>
map <c-n> :NERDTreeToggle<CR>
map <c-f> :CtrlP<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
noremap <C-h> <C-W>h
map <C-l> <C-W>l
map <c-m> :TagbarToggle<CR>
""" TAB""""
nnoremap <Tab> :bnext<CR>
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>

let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=','
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
set nobackup
set nowritebackup
set noswapfile
let g:jsx_ext_required = 0
set tags=tags,.tags
syntax enable
set mouse=
command WQ wq
command Wq wq
command W w
set runtimepath^=~/.vim/bundle/ag
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:vim_json_syntax_conceal = 0
let g:goldenview__enable_default_mapping = 0
let g:enable_bold_font = 1
syntax on
set background=dark
colorscheme molokai
hi Normal ctermbg=none
let g:airline_powerline_fonts=1
let g:UltiSnipsExpandTrigger="<tab>"
let g:SuperTabMappingForward="<tab>"
let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript set filetype:javascript.jsx
autocmd FileType jsx set syntax=javascript.jsx
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
au BufNewFile,BufRead *.html set filetype=eruby
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 1
filetype plugin on
set wildmenu
set path+=**/*
let g:go_list_type = "quickfix"
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', 'env', 'venv', '.git', '.svn']
let g:airline_theme='powerlineish'
let g:SuperTabDefaultCompletionType = "<c-n>"
