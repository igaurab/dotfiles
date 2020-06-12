"Source Files
source ~/dotfiles/.config/nvim/settings.vim
source ~/dotfiles/.config/nvim/keybindings.vim
source ~/dotfiles/.config/nvim/vimplug.vim
source ~/dotfiles/.config/nvim/cocConf.vim
"Basic Syntax
"let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let dart_html_in_string=v:true
let g:dart_format_on_save = 1
let g:ctrlp_map = '<c-p>'
set t_Co=256
set background=dark
colorscheme onedark
let g:gruvbox_contrast_dark = 'dark'
hi Normal guibg=NONE ctermbg=NONE
"Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
autocmd FileType json syntax match Comment +\/\/.\+$+
highlight Pmenu guifg=#D9D7CE guibg=#282828

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
g:onedark_termcolors:1
g:onedark_terminal_italics:1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" _   _                       _                   
"| |_| |__   ___ _ __ ___  __| | ___ __ _ _ __  
"| __| '_ \ / _ \ '__/ _ \/ _` |/ __/ _` | '_ \    Website: gaurabpanthee.com.np
"| |_| | | |  __/ | |  __/ (_| | (_| (_| | |_) |   Email:   gaurabpanthee@gmail.com
" \__|_| |_|\___|_|  \___|\__,_|\___\__,_| .__/    Twitter: @igaurab
"                                        |_|    
"                                       
