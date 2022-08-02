nnoremap <c-f> :NERDTreeToggle<CR>
imap jj <Esc>
"Snippets
inoremap <c-t> <esc>i{%<Space><Space>%}<esc>2hi

"Easy way to save and quit
nnoremap <C-s> :w <CR>
inoremap <C-s> <esc>:w <CR><esc>i
nnoremap <C-Q> :wq! <CR>
"Typos remapping
cnoremap W w
cnoremap Q q

"Tab Managaements
nnoremap tn :tabnew<Space>
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>

"split  Window  navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Use alt+ hjkl to resize windows
nnoremap <M-j>  :resize -2<CR>
nnoremap <M-k>  :resize +2<CR>
nnoremap <M-h>  :vertical resize -2<CR>
nnoremap <M-l>  :vertical resize +2<CR>

xmap <leader>a  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a  <Plug>(coc-codeaction-selected)<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
