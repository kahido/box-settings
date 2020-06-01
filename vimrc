"{{{ Vi-nocompatible

set nocompatible

"}}}
"{{{ Leader key

let mapleader = " " 

"}}}
"{{{ Plugins

"{{ Load plugin manager

if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    let s:first_init=1
endif

if exists("s:first_init")
    echom 'Plugin manager: vim-plug not been installed. Attempting installation...'
    exec 'silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs '.
            \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echom 'Installed successfully!'
endif

call plug#begin('~/.config/nvim/plugged')

"}}

"{{ Intellisense and autocomplete

"}}

"{{ Colorschemes and views

" Load colorscheme

"}}

""{{ Version control - Git

"}}

"{{ Language syntax helpers

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_experimental_template_highlight = 1
  let g:cpp_concepts_highlight = 1

"}}

"{{ Navigation

"}}

"{{ Extras

"}}

" Install all plugins if this is the firs load
if exists('s:first_init')
  PlugInstall
end

call plug#end()

"}}}
"{{{ Settings

"{{ General

set magic
set lazyredraw
set encoding=utf-8
set showmatch
set autoread
set updatetime=300
set mouse=a

"}}

"{{ Indentation

set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set nowrap
set bs=2

"}}

"{{ Search

set incsearch
set hlsearch
set smartcase

"}}

"{{ Syntax

filetype plugin indent on
syntax on
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

"}}

"{{ View

set conceallevel=3
"colorscheme gruvbox
set background=dark
"let g:gruvbox_contrast_light="hard"
set cmdheight=2
set scrolloff=12
let &colorcolumn=80
if has('gui')
  :set guioptions-=m " remove menu bar
  :set guioptions-=T " remove toolbar
  :set guioptions-=r " remove right-hand scroll bar
  :set guioptions-=L " remove left-hand scroll bar
end
set shortmess+=A
set number "relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
"augroup END

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"}}


"{{ Sane splits

set splitbelow

"}}

"{{ Persistent Undo

"" Keep undo history across sessions by storing it in a file

if has('persistent_undo')
  let vim_dir = '$HOME/.vim'
  "let &runtimepath.=','.vim_dir
  let undo_dir = expand(vim_dir.'/undo')
  call system('mkdir ' . vim_dir)
  call system('mkdir ' . undo_dir)
  let &undodir = undo_dir
  set undofile
  set undodir=~/.vim/undo
  set undolevels=1000
  set undoreload=10000
endif

"}}

"{{ Clipboard

set clipboard=unnamed,unnamedplus

"}}

" clear highlighting on return in normal mode
nnoremap <silent> <CR> :noh<CR><CR>

" nice move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"{{ No annoying bells

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

"}}

"{{ Files

set nobackup
set nowritebackup
set nowb
set noswapfile
set hidden
set completeopt-=preview

"}}

"}}}
"{{{ Aliases

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev X x

"}}}
"{{{ Autoreload vim on changes made

augroup vimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"}}}
" vim:ts=4:sw=4:wrap:fdm=marker:
