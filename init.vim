# 1 "/home/milosz/.config/nvim/init.vim"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "/home/milosz/.config/nvim/init.vim"
"=== SET CONFIG ==="
set nocompatible
set relativenumber
set nowrap
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
"set termguicolors Turned of as GNOME Terminal is using grovbox theme
set nobackup "This is needed to make neovim work with Parcel"
set nowritebackup "This is needed to make neovim work with Parcel"
set tags=ctags

filetype plugin indent on
filetype off
"=== END ===

"=== PLUGINS ===
"curl sth sth comment shit to not forget about vim.plug what i just did
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'morhetz/gruvbox'
Plug 'dikiaap/minimalist'
Plug 'sheerun/vim-polyglot'
call plug#end()
"=== END ===

"=== THEME CONFIG ===
set background=light
let g:gruvbox_contrast_light='soft'
colorscheme gruvbox
"=== END ===

"=== MAPINGS ===
let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
noremap ss :w<cr>


imap jk <esc>
imap kj <esc>

let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

map <leader>va :VtrAttachToPane<cr>
map <leader>sc :VtrSendCommandToRunner<cr>
map <leader>sf :VtrSendFile<cr>
map <leader>sl :VtrSendLinesToRunner<cr>
map <leader>or :VtrOpenRunner<cr>
map <leader>kr :VtrKillRunner<cr>
map <leader>fr :VtrFocusRunner<cr>
map <leader>dr :VtrDetachRunner<cr>
map <leader>cr :VtrClearRunner<cr>
map <leader>fr :VtrFlushRunner<cr>


map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:VtrUseVtrMaps = 1
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()
map <C-n> :NERDTreeToggle<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"jump to the last non-whitespace char on line, or eol if already there
map <End> :call LineEnd()<CR>:echo<CR>
imap <End> <C-R>=LineEnd()<CR>
function! LineEnd()
  let x = col('.')
    execute "normal g_"
  if x == col('.')
    execute "normal $"
  endif
 return ""
endfunction
"=== END ===
