"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customized key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Disable join lines , map it to move down
map J j

"set H to vertical help
cnoreabbrev H vert h
"set H to vertical help
cnoreabbrev H vert h

"Quick escaping with 'jj'
inoremap jj <ESC>
nnoremap <tab> %
vnoremap <tab> %
noremap - $

"LEADER mappings
"nnoremap <leader>ev <C-W><C-V><C-L>:e $HOME/.vim_runtime/my_configs.vim<cr>
nnoremap <leader>ev :e $HOME/.vim_runtime/my_configs.vim<cr>

"Disable arror key for training Vim key bindings
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" noremap <esc> <nop>

"map last edited buffer
nmap <c-tab> :b#<cr>
"display my buffers and types :buffer<space> command
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" <leader>+" surround a word with parethesis
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"remap ctrl-t and ctrl-]
nnoremap <c-a> <c-t>
nnoremap <c-space> <c-]>
nnoremap <leader>. <c-t>
nnoremap <leader>/ <c-]>
nnoremap <c-w>t <c-w>T

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert-mode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" Also allow line-wise scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>
"some ideas: 

"f key case insensive settins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Personal Extra Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"change default behaviour of tab complete, act like as Bash
set wildmode=longest,list,full
set wildmenu
"
" ingore the go_version update settings
let g:go_version_warning = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let NERDTREE show hidden files
let NERDTreeShowHidden=1

"clever_f
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
