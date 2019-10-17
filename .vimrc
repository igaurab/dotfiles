execute pathogen#infect()
syntax on
filetype plugin indent on

set number

" ###############################################################################
" GENERAL STUFFS
" ###############################################################################
set clipboard=unnamed
set guifont=Monospace\ 20
syntax on
set number relativenumber
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set splitbelow
set splitright
set cursorline
set wrap
set linebreak
set showbreak=...
set autoindent
set smartindent
let g:material_theme_style = 'darker'
colorscheme material
colorscheme material

" ###############################################################################


" ###############################################################################
"Python Development
" ###############################################################################
" enable all Python syntax highlighting features
let python_highlight_all = 1
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ###############################################################################


" ###############################################################################
" Mappings
" ###############################################################################
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Comment using ctrl-shift / 
" nnoremap <c-/> v
"Tab Mapping
vnoremap <Tab> >> 
vnoremap <S-Tab> << 

nnoremap <Tab> >> 
nnoremap <S-Tab> <<
"Tab Mapping End

imap <c-u> <esc>vw<S-u>i "Capitalize 1st letter with ctrl-u
inoremap <c-t> <esc>i{%<Space><Space>%}<esc>2hi
nnoremap <c-f> :NERDTreeToggle

"Typos remapping
cnoremap W w
cnoremap Q q
"Typos remapping end

"Tab Managaements
nnoremap tn :tabnew<Space>
nnoremap <S-k> :tabnext<CR>
nnoremap <S-j> :tabprev<CR>
nnoremap <S-h> :tabfirst<CR>
nnoremap <S-l> :tablast<CR>
"Tab Managaements

"split  Window  navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ###############################################################################

"Load Vundle and plugings from plugins.vim
source ~/.vim/plugin/vundle.vim
