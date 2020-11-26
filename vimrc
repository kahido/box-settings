"{{{ Vi-nocompatible

set nocompatible

"}}}
"{{{ Leader key

let mapleader = " " 

"}}}
"{{{ Plugins

"{{ Load plugin manager

"if !filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
if !filereadable(expand('$HOME/.vim/autoload/plug.vim'))
    let s:first_init=1
endif

if exists("s:first_init")
    echom 'Plugin manager: vim-plug not been installed. Attempting installation...'
    "exec 'silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs '.
    "        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    exec 'silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs '.
            \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echom 'Installed successfully!'
endif

call plug#begin('$HOME/.vim/plugged')

"}}

"{{ Intellisense and autocomplete

"}}

"{{ Colorschemes and views

" Load colorscheme

" ingo-library (needed for mark)
Plug 'inkarkat/vim-ingo-library'

" Mark
Plug 'inkarkat/vim-mark'

" remap colors --
fun! s:CustomHighlightings()
    highlight def MarkWord1  ctermbg=230    ctermfg=Black   guibg=#70227E   guifg=Black
    highlight def MarkWord2  ctermbg=167    ctermfg=Black   guibg=#FF7373   guifg=Black
    highlight def MarkWord3  ctermbg=2      ctermfg=Black   guibg=#A60000   guifg=Black
    highlight def MarkWord4  ctermbg=6      ctermfg=Black   guibg=#FFB3FF   guifg=Black
    highlight def MarkWord5  ctermbg=156    ctermfg=Black   guibg=#C262D3   guifg=Black
    highlight def MarkWord6  ctermbg=202    ctermfg=Black   guibg=#FF5F00   guifg=Black
    highlight def MarkWord7  ctermbg=90     ctermfg=Black   guibg=#870087   guifg=Black
    highlight def MarkWord8  ctermbg=27     ctermfg=Black   guibg=#005FFF   guifg=Black
"    highlight def MarkWord10 ctermbg=101    ctermfg=Black   guibg=#8C38D3   guifg=Black
"    highlight def MarkWord1  ctermbg=228    ctermfg=Black   guibg=#BF3030   guifg=Black
"    highlight def MarkWord7  ctermbg=180    ctermfg=Black   guibg=#5D016D   guifg=Black
"    highlight def MarkWord8  ctermbg=164    ctermfg=Black   guibg=#8F04A8   guifg=Black
endfun
autocmd ColorScheme * call <SID>CustomHighlightings()

"}}

""{{ Version control - Git

"}}

""{{ Programming tools

" Clang-format
Plug 'rhysd/vim-clang-format'
  let g:clang_format#detect_style_file = 1

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"}}

"{{ Language syntax helpers

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_posix_standard = 1
  let g:cpp_experimental_simple_template_highlight = 1
  "let g:cpp_experimental_template_highlight = 1
  let g:cpp_concepts_highlight = 1

  let c_no_curly_error=1

" Python
Plug 'vim-python/python-syntax'

" Json
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

" Yang
Plug 'nathanalderson/yang.vim'

" Log
Plug 'mtdl9/vim-log-highlighting'

"}}

"{{ Navigation

Plug 'embear/vim-foldsearch'

"}}

"{{ Extras

Plug 'vim-airline/vim-airline'
	"let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
	"let g:airline_theme='nord'

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
"set mouse=a

"}}

"{{ Indentation

set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
"set nowrap
set bs=2

"}}

"{{ Search

set incsearch
set hlsearch
set smartcase
set wildmenu

"}}

"{{ Syntax

filetype plugin indent on
syntax on
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

"}}

"{{ View

""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
""(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set conceallevel=3
set background=dark
colorscheme cppcode
set cmdheight=2
set scrolloff=12
let &colorcolumn=91
if has('gui')
  :set guioptions-=m " remove menu bar
  :set guioptions-=T " remove toolbar
  :set guioptions-=r " remove right-hand scroll bar
  :set guioptions-=L " remove left-hand scroll bar
end
set shortmess+=A
set number
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
"augroup END

"}}

"{{ Sane splits

set splitbelow

"}}

"{{ Persistent Undo

"" Keep undo history across sessions by storing it in a file

if has('persistent_undo')
  "let vim_dir = '$HOME/.config/nvim'
  let vim_dir = '$HOME/.vim'
  "let &runtimepath.=','.vim_dir
  let undo_dir = expand(vim_dir.'/undo')
  call system('mkdir ' . vim_dir)
  call system('mkdir ' . undo_dir)
  let &undodir = undo_dir
  set undofile
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
"{{{ Keys
nnoremap <leader>c :!$HOME/bin/ctags -R --fields=+l --exclude=.git/* --exclude=log/* --exclude=tmp/* --exclude=*.json --exclude=*.robot --exclude=*.py -f $HOME/workspace/sources/tags $HOME/workspace/sources/* <CR><CR>

" Remove COLOR codes
nnoremap <leader>t :%s!\e[[0-9;]\+[mK]!!g<CR>

" Remove search highlight and refresh
nnoremap <silent> <C-l> :nohl<CR>:syn sync fromstart<CR><C-l>

" Remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

nnoremap <leader>l :StripTrailingWhitespaces<CR>

"}}}
"{{{ Autoreload vim on changes made

augroup vimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"}}}
" vim:ts=4:sw=4:wrap:fdm=marker:
