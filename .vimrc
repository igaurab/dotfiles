set foldmethod=indent
set foldlevel=99
set relativenumber
syntax on
set cursorline
" Enable folding with the spacebar
nnoremap <space> za

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:ctrlp_map = '<c-p>'
set t_Co=256
set background=dark
colorscheme gruvbox 
let g:gruvbox_contrast_dark = 'soft'

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

autocmd FileType json syntax match Comment +\/\/.\+$+
source ~/.vim/plug.vim
source ~/.vim/cocConf.vim
