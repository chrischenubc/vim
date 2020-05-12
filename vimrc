" Common global settings.
set nocompatible
set clipboard=unnamed

set encoding=utf-8
set fileencodings=utf-8,gb18030,big5,euc-tw,iso88591,koi8-t
set autoread
set wildmenu
set magic

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" line number (set relative number: rnu)
set number
set relativenumber
set rnu
set rnu!
set norelativenumber

let mapleader = ","
let g:mapleader = ","

syntax on
filetype plugin indent on

" Highlight settings.
autocmd ColorScheme * highlight clear SpellBad
autocmd ColorScheme * highlight SpellBad term=underline cterm=underline

" Color theme
colorscheme abstract
set background=dark

" Highlight tabs, trailing spaces.
set list!
set listchars=tab:>\ ,trail:.,extends:\#,nbsp:.

" Spell settings
set spell

" Search related options.
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Bottom displays.
set showcmd
set showmode
set ruler

" Global formatting.
set formatoptions+=Mm " For Chinese characters autowrap.
set noexpandtab
set autoindent

""""""""""""""
" Interface
""""""""""""""
" source /usr/share/vim/vim80/delmenu.vim
" source /usr/share/vim/vim80/menu.vim

set cmdheight=2
" Add a bit extra margin to the left
"set foldcolumn=1
" Linebreak on 500 characters
set lbr
set tw=500


""""""""""""""
" Plugins.
""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'amix/open_file_under_cursor.vim'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

""""""""""""""""""""""""""""""
" => Status line
"  """"""""""""""""""""""""""""""
if !has('gui_running')
      set t_Co=256
  endif
" Always show the status line
set laststatus=2
set noshowmode

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""
" key binding
""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>p :PlugInstall<CR>
map <space> /
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('','')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('','')<CR>?<C-R>=@/<CR><CR>

""""""""""""""
" Miscs.
""""""""""""""
set smarttab
set lazyredraw
set expandtab
set shiftwidth=4  " 1 tab == 4 spaces
set tabstop=4
set showmatch " Show matching brackets when cursor is over them for 2 sec
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") ==
        l:currentBufNum
        new
    endif
    if
        buflisted(l:currentBufNum)
        execute("bdelete!
        ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


source ./plugins_config.vim
