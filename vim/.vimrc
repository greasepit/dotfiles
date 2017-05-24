"*****************************************************************************
"" General
"*****************************************************************************
set nocompatible
set history=50
set ruler
set showcmd
set incsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax on
set autoindent
set t_Co=128
set number
set laststatus=2
set ttimeoutlen=50


"*****************************************************************************
"" Keybinds & Mouse
"*****************************************************************************
let mapleader = ","
map <Leader><Left> :bprev<cr>
map <Leader><Right> :bnext<cr>
map Q gq

" Enable mouse
if has('mouse')
  set mouse=a
endif	 


"*****************************************************************************
"" Plug
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')	 

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))


"*****************************************************************************
"" Plug packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
call plug#end()


"*****************************************************************************
"" Package configuration
"*****************************************************************************
" NERDTree
"let NERDTreeWinSize = 15
"let NERDTreeIgnore=['\.exe$', '\.o$']
noremap <F2> :NERDTreeToggle<CR>

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" Airline customization
let g:airline_theme='raven'
let g:airline#extensions#whitespace#mixed_indent_algo=2
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1

function! AirlineInit()
  call airline#parts#define_raw('linenr', '%l')
  call airline#parts#define_accent('linenr', 'bold')
  call airline#parts#define_raw('linetot', '%L')
  call airline#parts#define_accent('linetot', 'bold')
  let g:airline_section_z = airline#section#create(['linenr', ':', 'linetot', ' '])
endfunction
autocmd VimEnter * call AirlineInit()


"*****************************************************************************
"" Colors
"*****************************************************************************
colorscheme base16-default-dark

" Transparent background, only works after colorscheme
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi clear Signcolumn
hi LineNr ctermfg=grey


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
