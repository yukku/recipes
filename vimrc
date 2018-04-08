" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
" set t_Co=256
" color wombat256mod

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set number
set nocompatible              " be iMproved, required
filetype off    
filetype plugin indent on
syntax on

set paste!
" Vim Plug Starts -----------------------------
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'myint/syntastic-extras'
"Plug 'klen/python-mode'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'

" Plugin 'tpope/vim-surround'
call plug#end()
" Vim Plug Ends -------------------------------

" For vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
set t_Co=256
set laststatus=2
set ttimeoutlen=50
" For vim airline

" For 'wincent/Command-T'
let g:CommandTMaxFiles=200000
" For 'wincent/Command-T' end

" Setting for scrooloose/syntastic starts
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" For mxw/vim-jsx"
let g:jsx_ext_required = 0

" For mxw/vim-jsx" end

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Setting for scrooloose/syntastic ends

" Setting for myint/syntastic-extras 
let g:syntastic_javascript_checkers = ['json_tool']
let g:syntastic_python_checkers = ['pyflakes_with_warnings']
" Setting for myint/syntastic-extras 


set showmode                    
set backspace=indent,eol,start  
set copyindent
set showmatch                   
set ignorecase                  
set smartcase                   
set smarttab                    
set scrolloff=4                 
" set virtualedit=all             
set hlsearch                    
set incsearch                   
set gdefault                    
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist                      
" set pastetoggle=<F2>            
" set mouse=a                     
" set fileformats="unix,dos,mac"
" set formatoptions+=1            
" set nrformats=                  
" set shortmess+=I                
" set clipboard=unnamed           
set autoread                    
set history=1000  
set undolevels=1000
set noswapfile  
set visualbell
set noerrorbells 
" set cursorline
set showcmd 
set wildmenu
set lazyredraw
set smartindent
set autoindent

