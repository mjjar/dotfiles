"=== SET CONFIG ==="
set cursorline "highlight the current line
set relativenumber
set number
set nowrap
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set mouse=a "Enable usage of mouse
set clipboard=unnamedplus "Copy to clipboard
"set termguicolors Turned of as GNOME Terminal is using grovbox theme
set nobackup "This is needed to make neovim work with Parcel"
set nowritebackup "This is needed to make neovim work with Parcel"
set tags=ctags
set termguicolors


filetype plugin indent on
filetype off
"=== END ===

"=== PLUGINS ===
"curl sth sth comment shit to not forget about vim.plug what i just did
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dikiaap/minimalist'
Plug'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
"=== END ===


"=== THEME CONFIG(ONEDARK) ===
hi LineNr ctermbg=NONE guibg=NONE
let g:tokyonight_style = "storm"
let g:tokyonight_termcolors=256
let g:tokyonight_transparent = 1
let g:tokyonight_italic_functions = 1
syntax on
colorscheme tokyonight

" ======= END ==================




"=== THEME CONFIG(ONEDARK) ===
" onedark.vim override: Don't set a background color when running in a terminal;
" if (has("autocmd") && !has("gui_running"))
"   augroup colorset
"     autocmd!
"     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"     autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"   augroup END
" endif

 " hi Comment cterm=italic
 " let g:onedark_hide_endofbuffer=1
 " let g:onedark_terminal_italics=1
 " let g:onedark_termcolors=256
 " previous green color #6c9970
 " let g:onedark_color_overrides = {
 " \ "green": { "gui": "#6c9970", "cterm": "170", "cterm16": "5" }
 " \}

 "syntax on
 "colorscheme onedark
 " hi LineNr ctermbg=NONE guibg=NONE
" === END ===








"=== MAPINGS ===
let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
noremap <leader>w :w<cr>
noremap <leader>q :q!<cr>


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















" ============ TELESCOPE ========== 
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" ============== END ==============







" ============ NVIM-TREE ==========
let g:nvim_tree_highlight_opened_files = 1
lua require('nvim-tree').setup {
      \auto_close          = true,
      \open_on_setup       = true,
      \update_focused_file = {
        \enable      = true,
        \update_cwd  = true,
        \},
      \}
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" =============== END =============






" =========== LUA-LINE ============
"
lua require('lualine').setup {
    \ options = {theme = 'tokyonight'}
    \ }

" ============ END ================





" =========== LUA-LINE ============
"
"lua require("bufferline").setup{}
" ============ END ================





" ========= DASHBOARD ==========
"
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
    \'',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢Ä‚£Ä‚£†‚£§‚£§‚£¥‚£¶‚£§‚£§‚£Ñ‚£Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢Ä‚£§‚£æ‚£ø‚£ø‚£ø‚£ø‚†ø‚†ø‚†ø‚†ø‚£ø‚£ø‚£ø‚£ø‚£∂‚£§‚°Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚£†‚£æ‚£ø‚£ø‚°ø‚†õ‚†â‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†â‚†õ‚¢ø‚£ø‚£ø‚£∂‚°Ä‚†Ä‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚£¥‚£ø‚£ø‚†ü‚†Å‚†Ä‚†Ä‚†Ä‚£∂‚£∂‚£∂‚£∂‚°Ü‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†à‚†ª‚£ø‚£ø‚£¶‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚£º‚£ø‚£ø‚†ã‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†õ‚†õ‚¢ª‚£ø‚£ø‚°Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†ô‚£ø‚£ø‚£ß‚†Ä‚†Ä ',
     \'‚†Ä‚¢∏‚£ø‚£ø‚†É‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢Ä‚£ø‚£ø‚£∑‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†∏‚£ø‚£ø‚°á‚†Ä ',
     \'‚†Ä‚£ø‚£ø‚°ø‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢Ä‚£æ‚£ø‚£ø‚£ø‚£á‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚£ø‚£ø‚£ø‚†Ä ',
     \'‚†Ä‚£ø‚£ø‚°á‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢†‚£ø‚£ø‚°ü‚¢π‚£ø‚£ø‚°Ü‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚£π‚£ø‚£ø‚†Ä ',
     \'‚†Ä‚£ø‚£ø‚£∑‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚£∞‚£ø‚£ø‚†è‚†Ä‚†Ä‚¢ª‚£ø‚£ø‚°Ñ‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚£ø‚£ø‚°ø‚†Ä ',
     \'‚†Ä‚¢∏‚£ø‚£ø‚°Ü‚†Ä‚†Ä‚†Ä‚†Ä‚£¥‚£ø‚°ø‚†É‚†Ä‚†Ä‚†Ä‚†à‚¢ø‚£ø‚£∑‚£§‚£§‚°Ü‚†Ä‚†Ä‚£∞‚£ø‚£ø‚†á‚†Ä ',
     \'‚†Ä‚†Ä‚¢ª‚£ø‚£ø‚£Ñ‚†Ä‚†Ä‚†æ‚†ø‚†ø‚†Å‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†ò‚£ø‚£ø‚°ø‚†ø‚†õ‚†Ä‚£∞‚£ø‚£ø‚°ü‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†ª‚£ø‚£ø‚£ß‚£Ñ‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚£†‚£æ‚£ø‚£ø‚†è‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚†à‚†ª‚£ø‚£ø‚£∑‚£§‚£Ñ‚°Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚¢Ä‚£†‚£¥‚£æ‚£ø‚£ø‚†ü‚†Å‚†Ä‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†à‚†õ‚†ø‚£ø‚£ø‚£ø‚£ø‚£ø‚£∂‚£∂‚£ø‚£ø‚£ø‚£ø‚£ø‚†ø‚†ã‚†Å‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä ',
     \'‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†â‚†â‚†õ‚†õ‚†õ‚†õ‚†õ‚†õ‚†â‚†â‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä‚†Ä ',
     \]

let g:dashboard_custom_section = {
      \ 'a': {
          \ 'description': ['Ôúù  Find File          SPC f f'],
          \ 'command' : 'Telescope find_files',
      \  },
      \ 'd': {
        \ 'description': ['Óòí  Search Files       SPC f a'],
        \ 'command' : 'Telescope live_grep'
      \},
      \ 'b': {
        \ 'description': ['ÓéÖ  Recent Files       SPC f h'],
        \ 'command' : 'Telescope oldfiles'
      \ },
      \ 'e': {
        \ 'description': ['Óòï  Config             SPC v r'],
        \ 'command' : 'edit ~/.config/nvim/init.vim'
      \ },
      \ 'f': {
        \ 'description': ['ÔÖõ  New File           SPC c n'],
        \ 'command' : 'edit ~/.config/nvim/init.vim'
      \ },
  \ }
let g:dashboard_custom_footer = [
    \ 'Here we go again...'
    \ ]

" ============= END ==================







" ============ WHICH-KEY =============
"
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
local wk = require("which-key")
local mappings = {
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
EOF
" =========== END ================== 
